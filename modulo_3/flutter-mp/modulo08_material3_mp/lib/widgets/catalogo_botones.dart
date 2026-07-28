// lib/widgets/catalogo_botones.dart
import 'package:flutter/material.dart';

class CatalogoBotones extends StatelessWidget {
  final VoidCallback? onBack;

  const CatalogoBotones({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acciones veterinarias'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: onBack == null ? null : IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
        actions: [IconButton(icon: const Icon(Icons.medical_services), onPressed: () {}, tooltip: 'Atencion')],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Variantes de accion', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton(onPressed: () {}, child: const Text('Registrar cita')),
          const SizedBox(height: 8),
          FilledButton.tonal(onPressed: () {}, child: const Text('Aplicar tratamiento')),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: () {}, child: const Text('Programar cirugia')),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: () {}, child: const Text('Ver historial')),
          const SizedBox(height: 8),
          TextButton(onPressed: () {}, child: const Text('Llamar al dueño')),
          const Divider(height: 32),
          Text('Con icono', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.pets), label: const Text('Vacunar paciente')),
          const SizedBox(height: 8),
          OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.medical_information), label: const Text('Solicitar laboratorio')),
          const SizedBox(height: 8),
          TextButton.icon(onPressed: () {}, icon: const Icon(Icons.phone), label: const Text('Llamar a la familia')),
          const Divider(height: 32),
          Text('Estados y personalizacion', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton(onPressed: null, child: const Text('No disponible por el momento')),
          const SizedBox(height: 8),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: cs.errorContainer, foregroundColor: cs.onErrorContainer, minimumSize: const Size(double.infinity, 48)),
            onPressed: () {},
            child: const Text('Emergencia veterinaria'),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Reagendar'))),
              const SizedBox(width: 8),
              Expanded(child: FilledButton(onPressed: () {}, child: const Text('Confirmar'))),
            ],
          ),
          const SizedBox(height: 8),
          Center(child: IconButton(icon: const Icon(Icons.favorite), onPressed: () {}, tooltip: 'Seguir paciente')),
        ],
      ),
    );
  }
}
