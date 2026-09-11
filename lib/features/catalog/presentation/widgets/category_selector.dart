import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:shopp_app/core/widgets/skeleton_loader.dart';

class CategorySelector extends ConsumerWidget {
  const CategorySelector({super.key});

  String _getCategoryIcon(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('electronic')) return AppIcons.electronics;
    if (lower.contains('fashion') || lower.contains('apparel')) return AppIcons.clothing;
    if (lower.contains('home') || lower.contains('living')) return AppIcons.furniture;
    if (lower.contains('sport') || lower.contains('outdoor')) return AppIcons.sports;
    if (lower.contains('book') || lower.contains('stationery')) return AppIcons.books;
    if (lower.contains('beauty') || lower.contains('wellness')) return AppIcons.beauty;
    return AppIcons.category;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoriesNotifierProvider);
    final categories = categoriesState.data ?? [];
    final selectedId = ref.watch(productsNotifierProvider.select((s) => s.selectedCategory));

    if (categoriesState.isLoading && categories.isEmpty) {
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
          final icon = isAll ? AppIcons.dashboard : _getCategoryIcon(categories[index - 1].name);

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
                ref.read(productsNotifierProvider.notifier).selectCategory(newId);
                ref.read(selectedCategoryProvider.notifier).state = newId;
              },
              borderRadius: AppRadius.borderFull,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppIcon(
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
