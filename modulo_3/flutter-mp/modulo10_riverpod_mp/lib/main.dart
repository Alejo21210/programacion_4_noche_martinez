// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importa las pantallas a medida que las crees en cada paso:
import 'screens/pantalla_servidores.dart';
// import 'screens/pantalla_busqueda.dart';
// import 'screens/pantalla_metricas.dart';
// import 'screens/pantalla_dashboard.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  ProviderScope + StateProvider básico (contador)     │
// │  2  Paso 2  NotifierProvider + lista de pacientes              │
// │  3  Paso 3  Provider derivado + búsqueda filtrada               │
// │  4  Paso 4  AsyncNotifierProvider + métricas loading/error      │
// │  5  Paso 5  NavigationBar con dos tabs usando Riverpod          │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 2;

// NotifierProvider — estado simple del Paso 1 (Riverpod 3.x)
final contadorProvider = NotifierProvider<_ContadorNotifier, int>(_ContadorNotifier.new);

class _ContadorNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state++;
  void decrement() {
    if (state > 0) state--;
  }
}

void main() {
  runApp(const ProviderScope(child: AppVeterinaria()));
}

class AppVeterinaria extends StatelessWidget {
  const AppVeterinaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00695C),
          primary: const Color(0xFF00695C),
          secondary: const Color(0xFFFF8F00),
          tertiary: const Color(0xFFD84315),
        ),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => const PantallaServidores(),
        // 3 => const PantallaBusqueda(),
        // 4 => const PantallaMetricas(),
        // 5 => const PantallaDashboard(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

// ─── Paso 1 — vive en main.dart ─────────────────────────────────────────
class _Paso1 extends ConsumerWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(contadorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Seguimiento clínico')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count', style: Theme.of(context).textTheme.displayLarge),
            const Text('pacientes en observación'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => ref.read(contadorProvider.notifier).increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'rem',
            onPressed: () {
              if (ref.read(contadorProvider) > 0) {
                ref.read(contadorProvider.notifier).decrement();
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}