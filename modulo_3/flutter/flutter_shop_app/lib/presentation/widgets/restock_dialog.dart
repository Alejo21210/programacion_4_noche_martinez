import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/app_colors.dart';
import '../providers/products_admin_provider.dart';

Future<void> showRestockDialog(
  BuildContext context,
  WidgetRef    ref,
  int          productId,
  String       productName,
) {
  final ctrl = TextEditingController();
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Reabastecer stock',
          style: TextStyle(color: AppColors.textPrimary)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('"$productName"',
              style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          const SizedBox(height: 12),
          TextField(
            controller:  ctrl,
            autofocus:   true,
            keyboardType: TextInputType.number,
            decoration:  const InputDecoration(
              labelText: 'Cantidad',
              hintText:  'Ej: 10',
            ),
            style: const TextStyle(color: AppColors.textPrimary),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final qty = int.tryParse(ctrl.text.trim());
            if (qty == null || qty <= 0) return;
            Navigator.pop(ctx);
            ref.read(productsAdminProvider.notifier).restock(productId, qty);
          },
          child: const Text('Reabastecer',
              style: TextStyle(
                color: AppColors.accent, fontWeight: FontWeight.bold,
              )),
        ),
      ],
    ),
  );
}
