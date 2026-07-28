import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';

class PantallaServidoresFiltro extends StatelessWidget {
  final bool soloUrgente;
  const PantallaServidoresFiltro({super.key, this.soloUrgente = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloUrgente
        ? servidoresSimulados.where((s) => s.ssl).toList()
        : servidoresSimulados;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pacientes${soloUrgente ? ' (Urgentes)' : ''}'),
        actions: [
          IconButton(
            icon: Icon(soloUrgente ? Icons.filter_alt_off : Icons.warning_amber),
            tooltip: soloUrgente ? 'Ver todos' : 'Solo urgentes',
            onPressed: () => soloUrgente
                ? context.go('/pacientes')
                : context.go('/pacientes?soloUrgente=true'),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: filtrados.length,
        separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
        itemBuilder: (context, i) {
          final s = filtrados[i];
          return ListTile(
            leading: Icon(
              s.ssl ? Icons.warning_amber : Icons.pets,
              color: s.ssl ? Colors.orange : Colors.teal,
            ),
            title: Text(s.nombre),
            subtitle: Text(s.ip),
            onTap: () => context.push('/pacientes/${s.id}', extra: s),
          );
        },
      ),
    );
  }
}
