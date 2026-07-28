// lib/screens/pantalla_appbar.dart
import 'package:flutter/material.dart';

class PantallaAppBar extends StatelessWidget {
  final VoidCallback? onBack;

  const PantallaAppBar({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text('Turnos del dia'),
            pinned: false,
            backgroundColor: cs.tertiaryContainer,
            foregroundColor: cs.onTertiaryContainer,
            leading: onBack == null
                ? null
                : IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
            actions: [
              IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}, tooltip: 'Filtrar'),
              IconButton(icon: const Icon(Icons.search), onPressed: () {}, tooltip: 'Buscar'),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: cs.primaryContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 56),
                    Icon(Icons.pets, size: 48, color: cs.onPrimaryContainer),
                    const SizedBox(height: 8),
                    Text('12 pacientes por atender', style: TextStyle(color: cs.onPrimaryContainer)),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final pacientes = [
                    ('Luna', 'Control de vacunas', '09:30', 'Vacuna'),
                    ('Milo', 'Revision general', '10:15', 'Consulta'),
                    ('Nina', 'Radiografia', '11:00', 'Estudio'),
                    ('Toby', 'Corte de uñas', '12:20', 'Peluqueria'),
                  ];
                  final paciente = pacientes[i % pacientes.length];

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(backgroundColor: cs.secondaryContainer, child: Icon(Icons.pets, color: cs.onSecondaryContainer)),
                      title: Text(paciente.$1),
                      subtitle: Text('${paciente.$2} · ${paciente.$3}'),
                      trailing: Chip(
                        label: Text(paciente.$4),
                        backgroundColor: cs.tertiaryContainer,
                        labelStyle: TextStyle(color: cs.onTertiaryContainer),
                      ),
                      onTap: () {},
                    ),
                  );
                },
                childCount: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
