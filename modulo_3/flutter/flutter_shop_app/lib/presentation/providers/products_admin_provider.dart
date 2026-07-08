import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/api/product_remote_datasource.dart';
import '../../domain/model/product.dart';

class ProductsAdminState {
  final List<Product> products;
  final bool           isLoading;
  final bool           isLoadingMore;
  final String?        error;
  final String         search;
  final ProductFormState formState;
  final int            totalCount;
  final int            currentPage;
  final bool           hasMore;

  const ProductsAdminState({
    this.products    = const [],
    this.isLoading   = false,
    this.isLoadingMore = false,
    this.error,
    this.search      = '',
    this.formState   = const ProductFormIdle(),
    this.totalCount  = 0,
    this.currentPage = 1,
    this.hasMore     = false,
  });

  List<Product> get filtered => search.isEmpty
      ? products
      : products.where((p) =>
          p.name.toLowerCase().contains(search.toLowerCase()) ||
          (p.category?.name ?? '').toLowerCase().contains(search.toLowerCase())).toList();

  ProductsAdminState copyWith({
    List<Product>?    products,
    bool?             isLoading,
    bool?             isLoadingMore,
    String?           error,
    String?           search,
    ProductFormState? formState,
    int?              totalCount,
    int?              currentPage,
    bool?             hasMore,
  }) => ProductsAdminState(
    products:      products      ?? this.products,
    isLoading:     isLoading     ?? this.isLoading,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    error:         error,
    search:        search        ?? this.search,
    formState:     formState     ?? this.formState,
    totalCount:    totalCount    ?? this.totalCount,
    currentPage:   currentPage   ?? this.currentPage,
    hasMore:       hasMore       ?? this.hasMore,
  );
}

sealed class ProductFormState {
  const ProductFormState();
}
class ProductFormIdle    extends ProductFormState { const ProductFormIdle(); }
class ProductFormSaving  extends ProductFormState { const ProductFormSaving(); }
class ProductFormSuccess extends ProductFormState {
  final String message;
  const ProductFormSuccess(this.message);
}
class ProductFormError extends ProductFormState {
  final String message;
  const ProductFormError(this.message);
}

class ProductsAdminNotifier extends StateNotifier<ProductsAdminState> {
  final ProductRemoteDatasource _datasource;
  static const int _pageSize = 20;

  ProductsAdminNotifier(this._datasource) : super(const ProductsAdminState()) {
    load();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true, error: null, currentPage: 1);
    try {
      final result = await _datasource.getProducts(
        page:     1,
        pageSize: _pageSize,
        isActive: null,
      );
      state = state.copyWith(
        products:   result.results,
        isLoading:  false,
        totalCount: result.count,
        hasMore:    result.next != null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error:     e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  void setSearch(String q) => state = state.copyWith(search: q);

  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;
    state = state.copyWith(isLoadingMore: true);
    try {
      final nextPage = state.currentPage + 1;
      final result = await _datasource.getProducts(
        page:     nextPage,
        pageSize: _pageSize,
        isActive: null,
      );
      state = state.copyWith(
        products:      [...state.products, ...result.results],
        isLoadingMore: false,
        currentPage:   nextPage,
        hasMore:       result.next != null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingMore: false,
        error:         e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<void> toggleActive(int id, bool isActive) async {
    state = state.copyWith(
      products: state.products.map((p) =>
        p.id == id ? p.copyWith(isActive: isActive) : p,
      ).toList(),
    );
    try {
      await _datasource.updateProduct(id, {'is_active': isActive});
    } catch (_) {
      state = state.copyWith(
        products: state.products.map((p) =>
          p.id == id ? p.copyWith(isActive: !isActive) : p,
        ).toList(),
      );
    }
  }

  Future<void> createProduct(Map<String, dynamic> payload) async {
    state = state.copyWith(formState: const ProductFormSaving());
    try {
      final created = await _datasource.createProduct(payload);
      state = state.copyWith(
        products:   [created, ...state.products],
        totalCount: state.totalCount + 1,
        formState:  const ProductFormSuccess('Producto creado'),
      );
    } catch (e) {
      state = state.copyWith(
        formState: ProductFormError(e.toString().replaceAll('Exception: ', '')),
      );
    }
  }

  Future<void> updateProduct(int id, Map<String, dynamic> payload) async {
    state = state.copyWith(formState: const ProductFormSaving());
    try {
      final updated = await _datasource.updateProduct(id, payload);
      state = state.copyWith(
        products:  state.products.map((p) => p.id == id ? updated : p).toList(),
        formState: const ProductFormSuccess('Producto actualizado'),
      );
    } catch (e) {
      state = state.copyWith(
        formState: ProductFormError(e.toString().replaceAll('Exception: ', '')),
      );
    }
  }

  Future<void> deleteProduct(int id) async {
    final previous = state.products;
    state = state.copyWith(
      products: state.products.where((p) => p.id != id).toList(),
    );
    try {
      await _datasource.deleteProduct(id);
    } catch (e) {
      state = state.copyWith(
        products: previous,
        error:    e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<void> restock(int id, int quantity) async {
    state = state.copyWith(formState: const ProductFormSaving());
    try {
      final result = await _datasource.restock(id, quantity);
      final newStock = result['new_stock'] as int? ?? result['stock'] as int? ?? 0;
      state = state.copyWith(
        products:  state.products.map((p) =>
          p.id == id ? p.copyWith(stock: newStock) : p,
        ).toList(),
        formState: const ProductFormSuccess('Stock actualizado'),
      );
    } catch (e) {
      state = state.copyWith(
        formState: ProductFormError(e.toString().replaceAll('Exception: ', '')),
      );
    }
  }

  void resetFormState() =>
      state = state.copyWith(formState: const ProductFormIdle());
}

final productsAdminProvider =
    StateNotifierProvider<ProductsAdminNotifier, ProductsAdminState>((ref) {
  return ProductsAdminNotifier(ref.watch(productDatasourceProvider));
});
