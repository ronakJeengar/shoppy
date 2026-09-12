import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:shopp_app/features/search/presentation/providers/search_providers.dart';

class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  String? _tempCategoryId;
  double? _tempMinPrice;
  double? _tempMaxPrice;
  double? _tempMinRating;
  bool _tempInStockOnly = false;

  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final search = ref.read(searchNotifierProvider);
    _tempCategoryId = search.selectedCategoryId;
    _tempMinPrice = search.minPrice;
    _tempMaxPrice = search.maxPrice;
    _tempMinRating = search.minRating;
    _tempInStockOnly = search.inStockOnly;

    if (_tempMinPrice != null) {
      _minPriceController.text = _tempMinPrice!.toStringAsFixed(0);
    }
    if (_tempMaxPrice != null) {
      _maxPriceController.text = _tempMaxPrice!.toStringAsFixed(0);
    }
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _apply() {
    final min = double.tryParse(_minPriceController.text.trim());
    final max = double.tryParse(_maxPriceController.text.trim());

    ref.read(searchNotifierProvider.notifier).setFilters(
          categoryId: _tempCategoryId,
          minPrice: min,
          maxPrice: max,
          minRating: _tempMinRating,
          inStockOnly: _tempInStockOnly,
        );
    Navigator.of(context).pop();
  }

  void _reset() {
    setState(() {
      _tempCategoryId = null;
      _tempMinPrice = null;
      _tempMaxPrice = null;
      _tempMinRating = null;
      _tempInStockOnly = false;
      _minPriceController.clear();
      _maxPriceController.clear();
    });
    ref.read(searchNotifierProvider.notifier).resetFilters();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesState = ref.watch(categoriesNotifierProvider);
    final categories = categoriesState.data ?? [];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            20,
            16,
            20,
            24 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filters',
                    style: AppTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: _reset,
                    child: Text(
                      'Reset All',
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),

              // Categories
              Text(
                'Category',
                style: AppTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('All Categories'),
                    selected: _tempCategoryId == null,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _tempCategoryId = null);
                      }
                    },
                  ),
                  ...categories.map((cat) {
                    final isSelected = _tempCategoryId == cat.id;
                    return ChoiceChip(
                      label: Text(cat.displayName),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _tempCategoryId = selected ? cat.id : null;
                        });
                      },
                    );
                  }),
                ],
              ),
              const SizedBox(height: 20),

              // Price Range
              Text(
                'Price Range (₹)',
                style: AppTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _minPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Min Price',
                        prefixText: '₹ ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'to',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _maxPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Max Price',
                        prefixText: '₹ ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Rating
              Text(
                'Minimum Rating',
                style: AppTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('Any'),
                    selected: _tempMinRating == null,
                    onSelected: (selected) {
                      if (selected) setState(() => _tempMinRating = null);
                    },
                  ),
                  ChoiceChip(
                    label: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppIcon(AppIcons.star, size: AppIconSizes.sm, color: AppColors.warning),
                        SizedBox(width: 4),
                        Text('4.0+'),
                      ],
                    ),
                    selected: _tempMinRating == 4.0,
                    onSelected: (selected) {
                      setState(() {
                        _tempMinRating = selected ? 4.0 : null;
                      });
                    },
                  ),
                  ChoiceChip(
                    label: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppIcon(AppIcons.star, size: AppIconSizes.sm, color: AppColors.warning),
                        SizedBox(width: 4),
                        Text('4.5+'),
                      ],
                    ),
                    selected: _tempMinRating == 4.5,
                    onSelected: (selected) {
                      setState(() {
                        _tempMinRating = selected ? 4.5 : null;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Availability Switch
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'In-Stock Items Only',
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Hide out-of-stock products',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                value: _tempInStockOnly,
                onChanged: (val) {
                  setState(() => _tempInStockOnly = val);
                },
              ),
              const SizedBox(height: 20),

              // Apply Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                  onPressed: _apply,
                  child: Text(
                    'Apply Filters',
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
