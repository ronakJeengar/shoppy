import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/providers/catalog_provider.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final catalogProvider = context.watch<CatalogProvider>();
    final categories = catalogProvider.categories;
    final selectedId = catalogProvider.selectedCategoryId;

    if (catalogProvider.isLoadingCategories && categories.isEmpty) {
      return SizedBox(
        height: 42,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 5,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) => Container(
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isAll = index == 0;
          final isSelected =
              isAll ? selectedId == null : selectedId == categories[index - 1].id;
          final title = isAll ? 'All' : categories[index - 1].displayName;

          return FilterChip(
            selected: isSelected,
            label: Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
            selectedColor: Colors.blue,
            backgroundColor: Colors.grey.shade100,
            checkmarkColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected ? Colors.blue : Colors.grey.shade300,
                width: 1,
              ),
            ),
            onSelected: (_) {
              final newId = isAll ? null : categories[index - 1].id;
              context.read<CatalogProvider>().selectCategory(newId);
            },
          );
        },
      ),
    );
  }
}
