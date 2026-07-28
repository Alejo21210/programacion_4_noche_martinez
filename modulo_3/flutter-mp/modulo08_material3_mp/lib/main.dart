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
  int paso = 1;
  ThemeMode _themeMode = ThemeMode.system;

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
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00695C),
          primary: const Color(0xFF00695C),
          secondary: const Color(0xFFFF8F00),
          tertiary: const Color(0xFFD84315),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: paso == 1
          ? _PantallaPrincipal(
              onSeleccionarPaso: (valor) => setState(() => paso = valor),
            )
          : paso == 2
              ? PantallaTema(
                  themeMode: _themeMode,
                  onToggle: (mode) => setState(() => _themeMode = mode),
                  onBack: () => setState(() => paso = 1),
                )
              : paso == 3
                  ? PantallaAppBar(onBack: () => setState(() => paso = 1))
                  : paso == 4
                      ? CatalogoBotones(onBack: () => setState(() => paso = 1))
                      : paso == 5
                          ? PantallaNavegacion(onBack: () => setState(() => paso = 1))
                          : PantallaDialogs(onBack: () => setState(() => paso = 1)),
    );
  }
}

class _PantallaPrincipal extends StatelessWidget {
  final ValueChanged<int> onSeleccionarPaso;

  const _PantallaPrincipal({required this.onSeleccionarPaso});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    final secciones = [
      (titulo: 'Tema y apariencia', subtitulo: 'Ajusta colores para la clínica', paso: 2),
      (titulo: 'Turnos del dia', subtitulo: 'Revisa pacientes y citas', paso: 3),
      (titulo: 'Acciones rapidas', subtitulo: 'Botones Material 3 veterinarios', paso: 4),
      (titulo: 'Centro de control', subtitulo: 'Seguimiento de pacientes y alertas', paso: 5),
      (titulo: 'Notificaciones', subtitulo: 'Snackbars y dialogos de atencion', paso: 6),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clinica Veterinaria Patitas Felices'),
        centerTitle: true,
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: cs.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: cs.primary,
                        child: Icon(Icons.pets, color: cs.onPrimary, size: 30),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Atencion integral', style: text.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('Gestiona turnos, historiales y cuidados de tus pacientes', style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(label: const Text('Urgencias 24h')),
                      Chip(label: const Text('Vacunas')),
                      Chip(label: const Text('Laboratorio')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Explora las secciones', style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...secciones.map(
            (seccion) => Card(
              child: ListTile(
                title: Text(seccion.titulo),
                subtitle: Text(seccion.subtitulo),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => onSeleccionarPaso(seccion.paso),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
