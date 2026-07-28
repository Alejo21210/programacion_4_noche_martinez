import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';

class PantallaDetalle extends StatelessWidget {
  final String id;
  final ServidorSSH? servidor;

  const PantallaDetalle({super.key, required this.id, this.servidor});

  @override
  Widget build(BuildContext context) {
    final matches = servidoresSimulados.where((s) => s.id == id).toList();
    final srv = servidor ?? (matches.isNotEmpty ? matches.first : null);

    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ficha: ${srv?.nombre ?? id}'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: srv == null
          ? Center(child: Text('Paciente $id no encontrado'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Fila('ID', srv.id),
                  _Fila('Paciente', srv.nombre),
                  _Fila('Ubicación', srv.ip),
                  _Fila('Expediente', srv.puerto.toString()),
                  _Fila('Prioridad', srv.ssl ? 'Urgente' : 'Control'),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Volver'),
                      ),
                      const SizedBox(width: 12),
                      FilledButton.icon(
                        onPressed: () => context.push('/pacientes/${srv.id}/historial'),
                        icon: const Icon(Icons.history),
                        label: const Text('Ver historial'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

class _Fila extends StatelessWidget {
  final String label;
  final String valor;
  const _Fila(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: TextStyle(color: cs.onSurfaceVariant, fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
          Text(valor, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
