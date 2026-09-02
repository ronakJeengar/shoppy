import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/providers/catalog_provider.dart';
import 'package:shopp_app/providers/search_provider.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
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
    final searchProvider = context.read<SearchProvider>();
    _tempCategoryId = searchProvider.selectedCategoryId;
    _tempMinPrice = searchProvider.minPrice;
    _tempMaxPrice = searchProvider.maxPrice;
    _tempMinRating = searchProvider.minRating;
    _tempInStockOnly = searchProvider.inStockOnly;

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
  }

  void _apply() {
    final double? minP = double.tryParse(_minPriceController.text.trim());
    final double? maxP = double.tryParse(_maxPriceController.text.trim());

    context.read<SearchProvider>().setFilters(
          categoryId: _tempCategoryId,
          minPrice: minP,
          maxPrice: maxP,
          minRating: _tempMinRating,
          inStockOnly: _tempInStockOnly,
        );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CatalogProvider>().categories;

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: _reset,
                  child: const Text('Reset All'),
                ),
              ],
            ),
            const Divider(),

            // Categories
            const Text(
              'Category',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
            const Text(
              'Price Range (\$)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                      prefixText: '\$ ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('to', style: TextStyle(color: Colors.grey)),
                ),
                Expanded(
                  child: TextField(
                    controller: _maxPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Max Price',
                      prefixText: '\$ ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
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
            const Text(
              'Minimum Rating',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                      Icon(Icons.star, size: 14, color: Colors.amber),
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
                      Icon(Icons.star, size: 14, color: Colors.amber),
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
              title: const Text(
                'In-Stock Items Only',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Hide out-of-stock products',
                style: TextStyle(fontSize: 12, color: Colors.grey),
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
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _apply,
                child: const Text(
                  'Apply Filters',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
