import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de widgets veterinarios'),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Clínica Veterinaria PetCare',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Atención integral para perros, gatos y exóticos.'),
          const SizedBox(height: 12),
          const Text(
            'Milo • vacunado • 08:30',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),
          ),
          const SizedBox(height: 8),
          const Text(
            'Luna • revisión mensual • 10:15',
            style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, color: Colors.teal),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Control de peso y alimentación recomendada para mascotas geriátricas.',
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Registrar paciente')),
              FilledButton(onPressed: () {}, child: const Text('Vacunación')),
              OutlinedButton(onPressed: () {}, child: const Text('Historia clínica')),
              TextButton(onPressed: () {}, child: const Text('Ver notas')),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.pets), label: const Text('Visita guiada')),
              FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.healing), label: const Text('Receta')),
              OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.medical_services), label: const Text('Urgencia')),
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings), tooltip: 'Configuración clínica'),
            ],
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.pets)),
              title: const Text('Milo'),
              subtitle: const Text('Diagnóstico: desparasitación anual • 3 años'),
              trailing: const Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
          Card(
            child: SwitchListTile(
              value: true,
              onChanged: (_) {},
              title: const Text('Recordatorio de vacunación activado'),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: const Text('Cachorro')),
              Chip(label: const Text('Gato')),
              FilterChip(label: const Text('Exótico'), selected: true, onSelected: (_) {}),
              InputChip(label: const Text('Peluquería'), selected: true, onSelected: (_) {}),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 48, height: 48, child: CircularProgressIndicator(color: Colors.deepOrange)),
              SizedBox(width: 48, height: 48, child: CircularProgressIndicator(value: 0.6, color: Colors.teal, strokeWidth: 6)),
              SizedBox(width: 48, height: 48, child: CircularProgressIndicator(value: 0.3, color: Colors.red, strokeWidth: 3, strokeCap: StrokeCap.round)),
            ],
          ),
          const SizedBox(height: 16),
          const LinearProgressIndicator(value: 0.7, color: Colors.deepOrange),
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: 0.4, color: Colors.teal, minHeight: 10),
        ],
      ),
    );
  }
}
