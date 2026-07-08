import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../domain/model/product.dart';
import '../../providers/products_admin_provider.dart';
import '../../widgets/product_form.dart';
import '../../widgets/restock_dialog.dart';

class ProductsAdminScreen extends ConsumerWidget {
  const ProductsAdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state    = ref.watch(productsAdminProvider);
    final filtered = state.filtered;

    return Column(
      children: [
        Container(
          color:   AppColors.surface,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child:   Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Productos',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 22, fontWeight: FontWeight.bold,
                          )),
                      Text(
                        '${state.totalCount} productos',
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () => showProductForm(context, ref),
                    icon:      const Icon(Icons.add, size: 18),
                    label:     const Text('Nuevo'),
                    style:     ElevatedButton.styleFrom(
                      minimumSize:   const Size(0, 40),
                      padding:       const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                onChanged:  ref.read(productsAdminProvider.notifier).setSearch,
                decoration: const InputDecoration(
                  hintText:   'Buscar producto...',
                  prefixIcon: Icon(Icons.search_rounded, color: AppColors.textSecondary),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
                style: const TextStyle(color: AppColors.textPrimary),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),

        Expanded(
          child: Builder(builder: (_) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.accent),
              );
            }
            if (state.error != null && state.products.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.error!,
                        style: const TextStyle(color: AppColors.error)),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () =>
                          ref.read(productsAdminProvider.notifier).load(),
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              );
            }
            if (filtered.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('📦', style: TextStyle(fontSize: 48)),
                    const SizedBox(height: 12),
                    Text(
                      state.search.isEmpty ? 'Sin productos' : 'Sin resultados',
                      style: const TextStyle(
                        color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }

            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollEndNotification &&
                    state.hasMore && !state.isLoadingMore) {
                  ref.read(productsAdminProvider.notifier).loadMore();
                }
                return false;
              },
              child: ListView.separated(
                padding:         const EdgeInsets.all(16),
                itemCount:       filtered.length + (state.isLoadingMore ? 1 : 0),
                separatorBuilder:(_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  if (i == filtered.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.accent,
                        ),
                      ),
                    );
                  }
                  return _ProductCard(
                    product:  filtered[i],
                    onToggle: () => ref.read(productsAdminProvider.notifier)
                        .toggleActive(filtered[i].id, !filtered[i].isActive),
                    onEdit:   () => showProductForm(context, ref, initial: filtered[i]),
                    onDelete: () => _confirmDelete(context, ref, filtered[i]),
                    onRestock: () => showRestockDialog(
                      context, ref, filtered[i].id, filtered[i].name,
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ],
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Product product) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape:           RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('¿Eliminar producto?',
            style: TextStyle(color: AppColors.textPrimary)),
        content: Text(
          '"${product.name}" se eliminará permanentemente.',
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(productsAdminProvider.notifier).deleteProduct(product.id);
            },
            child: const Text('Eliminar',
                style: TextStyle(color: AppColors.error, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product     product;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onRestock;

  const _ProductCard({
    required this.product,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
    required this.onRestock,
  });

  @override
  Widget build(BuildContext context) => Opacity(
    opacity: product.isActive ? 1.0 : 0.55,
    child:   Container(
      padding:    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color:        AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border:       Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Switch(
            value:       product.isActive,
            onChanged:   (_) => onToggle(),
            activeThumbColor: AppColors.accent,
            trackColor:  WidgetStateProperty.resolveWith((s) =>
              s.contains(WidgetState.selected)
                ? AppColors.accent.withValues(alpha: 0.4)
                : AppColors.border,
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          color: AppColors.textPrimary, fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (!product.isActive) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding:    const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color:        AppColors.error.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Inactivo',
                          style: TextStyle(
                            color: AppColors.error, fontSize: 10, fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      formatPrice(product.price),
                      style: const TextStyle(
                        color: AppColors.accent, fontSize: 13, fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: product.inStock
                            ? AppColors.success.withValues(alpha: 0.12)
                            : AppColors.error.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Stock: ${product.stock}',
                        style: TextStyle(
                          color: product.inStock ? AppColors.success : AppColors.error,
                          fontSize: 11, fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                if (product.category != null)
                  Text(
                    product.category!.name,
                    style: const TextStyle(
                      color: AppColors.textFaint, fontSize: 11,
                    ),
                  ),
              ],
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed:   onRestock,
                icon:        const Icon(Icons.inventory_2_outlined, size: 20),
                color:       AppColors.info,
                padding:     EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
              ),
              IconButton(
                onPressed:   onEdit,
                icon:        const Icon(Icons.edit_outlined, size: 20),
                color:       AppColors.textSecondary,
                padding:     EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
              ),
              IconButton(
                onPressed:   onDelete,
                icon:        const Icon(Icons.delete_outline, size: 20),
                color:       AppColors.error,
                padding:     EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
