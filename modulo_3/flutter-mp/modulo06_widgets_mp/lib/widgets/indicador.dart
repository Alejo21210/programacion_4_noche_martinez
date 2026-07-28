import 'package:flutter/material.dart';

class Indicador extends StatelessWidget {
  final String label;
  final String valor;
  final Color color;
  final String? subtitulo;
  final IconData? icono;

  const Indicador({
    super.key,
    required this.label,
    required this.valor,
    required this.color,
    this.subtitulo,
    this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icono != null) ...[
                Icon(icono, size: 22, color: color),
                const SizedBox(width: 6),
              ],
              Text(
                valor,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
          if (subtitulo != null)
            Text(subtitulo!, style: TextStyle(fontSize: 10, color: Colors.grey.shade500)),
        ],
      ),
    );
  }
}
