import 'package:flutter/material.dart';

class AvatarBadge extends StatelessWidget {
  final String nombre;
  final int alertas;
  final bool activo;

  const AvatarBadge({
    super.key,
    required this.nombre,
    required this.alertas,
    required this.activo,
  });

  @override
  Widget build(BuildContext context) {
    final color = activo ? Colors.deepOrange : Colors.grey;
    final inicial = nombre.isNotEmpty ? nombre.substring(0, 1).toUpperCase() : '?';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: activo ? Colors.deepOrange.shade100 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  inicial,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: color),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: activo ? Colors.green : Colors.red,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ),
            if (alertas > 0)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                  constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                  child: Text(
                    alertas > 9 ? '9+' : '$alertas',
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(nombre, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
