import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  Failure(this.message);
}

class PantallaPaso4 extends StatefulWidget {
  const PantallaPaso4({super.key});
  @override
  State<PantallaPaso4> createState() => _PantallaPaso4State();
}

class _PantallaPaso4State extends State<PantallaPaso4> {
  Result<String>? _result;
  bool _loading = false;

  Future<void> _fetchSuccess() async {
    setState(() { _loading = true; _result = null; });
    try {
      final res = await http.get(Uri.parse('https://catfact.ninja/fact'));
      final fact = jsonDecode(res.body)['fact'] as String;
      setState(() { _result = Success(fact); _loading = false; });
    } catch (e) {
      setState(() { _result = Failure('Error inesperado: $e'); _loading = false; });
    }
  }

  Future<void> _fetchFailure() async {
    setState(() { _loading = true; _result = null; });
    try {
      final res = await http.get(Uri.parse('https://catfact.ninja/not-found'));
      setState(() { _result = Failure('HTTP ${res.statusCode}: ${res.reasonPhrase}'); _loading = false; });
    } catch (e) {
      setState(() { _result = Failure('Error de conexion: $e'); _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 4 · Errores tipados'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.check_circle),
                    label: const Text('Exito'),
                    onPressed: _loading ? null : _fetchSuccess,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.error),
                    label: const Text('Error'),
                    onPressed: _loading ? null : _fetchFailure,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: _loading
                    ? const CircularProgressIndicator()
                    : _result == null
                        ? const Text('Presiona un boton para probar')
                        : _buildResult(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResult() {
    return switch (_result!) {
      Success(data: final fact) => Card(
        color: Colors.green[50],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.pets, size: 48, color: Colors.green),
              const SizedBox(height: 12),
              const Text('Dato curioso:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(fact, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
      Failure(message: final msg) => Card(
        color: Colors.red[50],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.warning, size: 48, color: Colors.red),
              const SizedBox(height: 12),
              const Text('Error:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(msg, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    };
  }
}
