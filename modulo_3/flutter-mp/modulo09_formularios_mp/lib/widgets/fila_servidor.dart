import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';

class FilaServidor extends StatelessWidget {
  final ServidorSSH servidor;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaServidor({
    super.key,
    required this.servidor,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: servidor.ssl ? cs.primaryContainer : cs.surfaceContainerHighest,
        child: Icon(
          Icons.pets,
          color: servidor.ssl ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),
      title: Text(
        servidor.nombre,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${servidor.usuario} ? ${servidor.so}',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              servidor.favorito ? Icons.star : Icons.star_border,
              color: servidor.favorito ? Colors.amber : cs.outline,
            ),
            onPressed: onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip: servidor.favorito ? 'Quitar favorito' : 'Marcar favorito',
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: cs.error),
            onPressed: onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip: 'Cerrar ficha',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
