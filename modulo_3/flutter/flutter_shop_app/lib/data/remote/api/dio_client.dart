import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../local/secure_storage.dart';

class _AuthInterceptor extends Interceptor {
  final SecureStorage _storage;
  final Dio           _dio;

  _AuthInterceptor(this._storage, this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getAccess();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;

    if (response?.statusCode != 401) {
      handler.next(err);
      return;
    }
    if (err.requestOptions.path.contains('/auth/token/refresh/')) {
      await _storage.clearSession();
      handler.next(err);
      return;
    }
    if (err.requestOptions.extra['_retry'] == true) {
      await _storage.clearSession();
      handler.next(err);
      return;
    }

    final refresh = await _storage.getRefresh();
    if (refresh == null || refresh.isEmpty) {
      await _storage.clearSession();
      handler.next(err);
      return;
    }

    try {
      final refreshResponse = await _dio.post(
        '/auth/token/refresh/',
        data:    {'refresh': refresh},
        options: Options(extra: {'_retry': true}),
      );

      final newAccess  = refreshResponse.data['access']  as String;
      final newRefresh = refreshResponse.data['refresh']  as String?;

      await _storage.saveAccessToken(newAccess);
      if (newRefresh != null) {
        await _storage.saveTokens(newAccess, newRefresh);
      }

      final retryOptions = err.requestOptions;
      retryOptions.headers['Authorization'] = 'Bearer $newAccess';
      retryOptions.extra['_retry']          = true;

      final retryResponse = await _dio.fetch(retryOptions);
      handler.resolve(retryResponse);

    } on DioException {
      await _storage.clearSession();
      handler.next(err);
    }
  }
}

Dio createDioClient(SecureStorage storage) {
  final dio = Dio(
    BaseOptions(
      baseUrl:        '${AppConfig.baseUrl}/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers:        {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.addAll([
    _AuthInterceptor(storage, dio),
    LogInterceptor(
      requestBody:  true,
      responseBody: true,
      logPrint:     (o) => debugPrint(o.toString()),
    ),
  ]);

  return dio;
}

final dioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return createDioClient(storage);
});
