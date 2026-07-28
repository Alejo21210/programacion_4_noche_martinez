import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/servidor_ssh.dart';
import '../providers/servidores_provider.dart';

class PantallaServidores extends ConsumerWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servidores = ref.watch(servidoresProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pacientes (${servidores.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: servidores.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.pets_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin pacientes', style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount: servidores.length,
              separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final s = servidores[i];
                final urgente = s.ssl;

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: urgente ? cs.primaryContainer : cs.secondaryContainer,
                    child: Icon(
                      urgente ? Icons.medical_services : Icons.pets,
                      color: urgente ? cs.onPrimaryContainer : cs.onSecondaryContainer,
                    ),
                  ),
                  title: Text(
                    s.nombre,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    urgente ? '${s.ip} • Atención urgente' : '${s.ip} • Control diario',
                    style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          s.favorito ? Icons.star : Icons.star_border,
                          color: s.favorito ? Colors.amber : cs.outline,
                        ),
                        onPressed: () => ref
                            .read(servidoresProvider.notifier)
                            .toggleFavorito(s.id),
                        tooltip: s.favorito ? 'Quitar favorito' : 'Marcar favorito',
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline, color: cs.error),
                        onPressed: () => ref
                            .read(servidoresProvider.notifier)
                            .eliminar(s.id),
                        tooltip: 'Cerrar ficha',
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(servidoresProvider.notifier).agregar(
            ServidorSSH(
              id: id,
              nombre: 'Nuevo paciente',
              ip: 'Cama ${servidores.length + 1}',
              puerto: 22,
              ssl: servidores.length.isEven,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
