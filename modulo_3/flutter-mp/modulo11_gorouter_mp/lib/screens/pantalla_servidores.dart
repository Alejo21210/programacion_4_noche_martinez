import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';

class PantallaServidores extends StatelessWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView.separated(
        itemCount: servidoresSimulados.length,
        separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
        itemBuilder: (context, i) {
          final s = servidoresSimulados[i];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: s.ssl ? cs.primaryContainer : cs.secondaryContainer,
              child: Icon(
                s.ssl ? Icons.warning_amber : Icons.pets,
                color: s.ssl ? cs.onPrimaryContainer : cs.onSecondaryContainer,
              ),
            ),
            title: Text(s.nombre, style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(s.ssl ? 'Atención urgente • ${s.ip}' : 'Control diario • ${s.ip}'),
            onTap: () {
              context.push('/pacientes/${s.id}', extra: s);
            },
          );
        },
      ),
    );
  }
}
