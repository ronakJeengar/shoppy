import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/providers/catalog_provider.dart';
import 'package:shopp_app/views/widgets/skeleton_loader.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  IconData _getCategoryIcon(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('electronic')) return Icons.devices_rounded;
    if (lower.contains('fashion') || lower.contains('apparel')) return Icons.checkroom_rounded;
    if (lower.contains('home') || lower.contains('living')) return Icons.chair_rounded;
    if (lower.contains('sport') || lower.contains('outdoor')) return Icons.fitness_center_rounded;
    if (lower.contains('book') || lower.contains('stationery')) return Icons.menu_book_rounded;
    if (lower.contains('beauty') || lower.contains('wellness')) return Icons.spa_rounded;
    return Icons.category_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final catalogProvider = context.watch<CatalogProvider>();
    final categories = catalogProvider.categories;
    final selectedId = catalogProvider.selectedCategoryId;

    if (catalogProvider.isLoadingCategories && categories.isEmpty) {
      return SizedBox(
        height: 38,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 6,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) => SkeletonLoader(
            width: index == 0 ? 60 : 100,
            height: 38,
            borderRadius: AppRadius.borderFull,
          ),
        ),
      );
    }

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isAll = index == 0;
          final isSelected =
              isAll ? selectedId == null : selectedId == categories[index - 1].id;
          final title = isAll ? 'All Items' : categories[index - 1].displayName;
          final icon = isAll ? Icons.grid_view_rounded : _getCategoryIcon(categories[index - 1].name);

          return Material(
            color: isSelected ? AppColors.primary : AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.borderFull,
              side: BorderSide(
                color: isSelected ? AppColors.primary : AppColors.slate200,
                width: 1,
              ),
            ),
            child: InkWell(
              onTap: () {
                final newId = isAll ? null : categories[index - 1].id;
                context.read<CatalogProvider>().selectCategory(newId);
              },
              borderRadius: AppRadius.borderFull,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      size: 16,
                      color: isSelected ? AppColors.white : AppColors.slate600,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      title,
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected ? AppColors.white : AppColors.slate700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
