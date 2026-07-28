// lib/screens/pantalla_tema.dart
import 'package:flutter/material.dart';

class PantallaTema extends StatelessWidget {
  final ThemeMode themeMode;
  final void Function(ThemeMode) onToggle;
  final VoidCallback? onBack;

  const PantallaTema({
    super.key,
    required this.themeMode,
    required this.onToggle,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personaliza la clínica'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: onBack == null
            ? null
            : IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Tema visual', style: text.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Elige el ambiente de la clínica para tus pacientes y tu equipo.', style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant)),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                RadioListTile<ThemeMode>(
                  value: ThemeMode.system,
                  groupValue: themeMode,
                  onChanged: (value) => onToggle(value!),
                  title: const Text('Sistema'),
                  subtitle: const Text('Usa el modo del dispositivo'),
                  secondary: const Icon(Icons.brightness_auto),
                ),
                RadioListTile<ThemeMode>(
                  value: ThemeMode.light,
                  groupValue: themeMode,
                  onChanged: (value) => onToggle(value!),
                  title: const Text('Claro'),
                  subtitle: const Text('Ideal para la mañana'),
                  secondary: const Icon(Icons.light_mode),
                ),
                RadioListTile<ThemeMode>(
                  value: ThemeMode.dark,
                  groupValue: themeMode,
                  onChanged: (value) => onToggle(value!),
                  title: const Text('Oscuro'),
                  subtitle: const Text('Para consultas nocturnas'),
                  secondary: const Icon(Icons.dark_mode),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Vista previa', style: text.labelLarge?.copyWith(color: cs.primary)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _CirculoPreview(color: cs.primary, label: 'P'),
                      _CirculoPreview(color: cs.secondary, label: 'S'),
                      _CirculoPreview(color: cs.tertiary, label: 'T'),
                      _CirculoPreview(color: cs.error, label: 'E'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.pets), label: const Text('Vacunas')),
                      const SizedBox(width: 8),
                      OutlinedButton(onPressed: () {}, child: const Text('Historial')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CirculoPreview extends StatelessWidget {
  final Color color;
  final String label;

  const _CirculoPreview({required this.color, required this.label});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: color,
          child: Text(
            label,
            style: TextStyle(
              color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
