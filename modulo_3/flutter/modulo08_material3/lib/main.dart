// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/pantalla_tema.dart';
import 'screens/pantalla_appbar.dart';
import 'screens/pantalla_navegacion.dart';
import 'screens/pantalla_dialogs.dart';
import 'widgets/catalogo_botones.dart';

void main() => runApp(const AppMonitoreo());

class AppMonitoreo extends StatefulWidget {
  const AppMonitoreo({super.key});

  @override
  State<AppMonitoreo> createState() => _AppMonitoreoState();
}

class _AppMonitoreoState extends State<AppMonitoreo> {
  int paso = 6;

  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003893),
          primary: const Color(0xFF003893),
          secondary: const Color(0xFFFFD100),
          tertiary: const Color(0xFFED1C24),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003893),
          primary: const Color(0xFF003893),
          secondary: const Color(0xFFFFD100),
          tertiary: const Color(0xFFED1C24),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: paso == 1
          ? const _PantallaPrincipal()
          : paso == 2
              ? PantallaTema(
                  themeMode: _themeMode,
                  onToggle: (mode) => setState(() => _themeMode = mode),
                )
              : paso == 3
                  ? const PantallaAppBar()
                  : paso == 4
                      ? const CatalogoBotones()
                      : paso == 5
                          ? const PantallaNavegacion()
                          : const PantallaDialogs(),
    );
  }
}

class _PantallaPrincipal extends StatelessWidget {
  const _PantallaPrincipal();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Sistema de Monitoreo'),
        centerTitle: true,
        backgroundColor: cs.tertiaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud, size: 96, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Servidor web-01',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '10.0.2.10 · Ubuntu 24.04',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon:  const Icon(Icons.terminal),
              label: const Text('Conectar SSH'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Agregar servidor',
        child:   const Icon(Icons.add),
      ),
    );
  }
}
