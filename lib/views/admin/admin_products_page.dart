import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/features/admin/presentation/providers/admin_providers.dart';

class AdminProductsPage extends ConsumerStatefulWidget {
  final bool initialLowStockOnly;

  const AdminProductsPage({super.key, this.initialLowStockOnly = false});

  @override
  ConsumerState<AdminProductsPage> createState() => _AdminProductsPageState();
}

class _AdminProductsPageState extends ConsumerState<AdminProductsPage> {
  final TextEditingController _searchController = TextEditingController();
  late bool _lowStockOnly;

  @override
  void initState() {
    super.initState();
    _lowStockOnly = widget.initialLowStockOnly;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adminProductsNotifierProvider.notifier).loadCategories();
      ref
          .read(adminProductsNotifierProvider.notifier)
          .loadProducts(lowStock: _lowStockOnly);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openAddProductDialog(BuildContext context) {
    final nameController = TextEditingController();
    final sellerController =
        TextEditingController(text: 'Shoppy Official Store');
    final descController = TextEditingController();
    final priceController = TextEditingController();
    final stockController = TextEditingController(text: '10');
    final imageController = TextEditingController(
        text: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e');
    final formKey = GlobalKey<FormState>();

    final adminState = ref.read(adminProductsNotifierProvider);
    String? selectedCatId =
        adminState.categories.isNotEmpty ? adminState.categories.first.id : null;

    showDialog(
      context: context,
      builder: (dialogCtx) => StatefulBuilder(
        builder: (context, setModalState) {
          return AlertDialog(
            title: const Text('Add New Product'),
            content: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration:
                          const InputDecoration(labelText: 'Product Name *'),
                      validator: (val) => (val == null || val.trim().isEmpty)
                          ? 'Name is required'
                          : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: sellerController,
                      decoration:
                          const InputDecoration(labelText: 'Seller Name *'),
                      validator: (val) => (val == null || val.trim().isEmpty)
                          ? 'Seller is required'
                          : null,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: priceController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            decoration:
                                const InputDecoration(labelText: 'Price (\$) *'),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Required';
                              }
                              final p = double.tryParse(val);
                              if (p == null || p < 0) return 'Invalid';
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: stockController,
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(labelText: 'Stock *'),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Required';
                              }
                              final s = int.tryParse(val);
                              if (s == null || s < 0) return 'Invalid';
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      initialValue: selectedCatId,
                      decoration:
                          const InputDecoration(labelText: 'Category *'),
                      items: adminState.categories.map((c) {
                        return DropdownMenuItem(
                          value: c.id,
                          child: Text(c.name),
                        );
                      }).toList(),
                      onChanged: (val) =>
                          setModalState(() => selectedCatId = val),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: imageController,
                      decoration:
                          const InputDecoration(labelText: 'Image URL *'),
                      validator: (val) => (val == null || val.trim().isEmpty)
                          ? 'Image URL is required'
                          : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: descController,
                      maxLines: 2,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogCtx),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) return;
                  if (selectedCatId == null && adminState.categories.isNotEmpty) {
                    selectedCatId = adminState.categories.first.id;
                  }

                  Navigator.pop(dialogCtx);
                  final success = await ref
                      .read(adminProductsNotifierProvider.notifier)
                      .createProduct({
                    'productName': nameController.text.trim(),
                    'sellerName': sellerController.text.trim(),
                    'description': descController.text.trim(),
                    'price': double.parse(priceController.text.trim()),
                    'stock': int.parse(stockController.text.trim()),
                    'productImage': imageController.text.trim(),
                    'category': selectedCatId ?? '64f1a2b3c4d5e6f7a8b9c001',
                  });

                  if (!mounted) return;
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    SnackBar(
                      content: Text(success
                          ? 'Product created successfully'
                          : 'Failed to create product'),
                      backgroundColor: success ? Colors.green : Colors.red,
                    ),
                  );
                },
                child: const Text('Create'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _openStockDialog(BuildContext context, Product product) {
    final qtyController = TextEditingController(text: '10');
    String selectedOp = 'ADD';

    showDialog(
      context: context,
      builder: (dialogCtx) => StatefulBuilder(
        builder: (context, setModalState) {
          return AlertDialog(
            title: Text('Adjust Stock: ${product.productName}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Stock: ${product.stock} units',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'ADD', label: Text('Add (+)')),
                    ButtonSegment(value: 'SUBTRACT', label: Text('Subtract (-)')),
                    ButtonSegment(value: 'SET', label: Text('Set Exact')),
                  ],
                  selected: {selectedOp},
                  onSelectionChanged: (set) {
                    setModalState(() => selectedOp = set.first);
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: qtyController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Units',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogCtx),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final val = int.tryParse(qtyController.text.trim());
                  if (val == null || val < 0) return;

                  Navigator.pop(dialogCtx);
                  final success = await ref
                      .read(adminProductsNotifierProvider.notifier)
                      .updateStock(product.id, val, selectedOp);

                  if (!mounted) return;
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    SnackBar(
                      content: Text(success
                          ? 'Stock adjusted successfully'
                          : 'Failed to adjust stock'),
                      backgroundColor: success ? Colors.green : Colors.red,
                    ),
                  );
                },
                child: const Text('Apply'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _confirmDeleteProduct(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Deactivate Product'),
        content: Text(
          'Deactivate "${product.productName}"? Historical orders will retain their data, but the product will be hidden from shoppers.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.pop(dialogCtx);
              final success = await ref
                  .read(adminProductsNotifierProvider.notifier)
                  .deleteProduct(product.id);
              if (!mounted) return;
              if (success) {
                ScaffoldMessenger.of(this.context).showSnackBar(
                  const SnackBar(
                    content: Text('Product deactivated successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: const Text('Deactivate'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final adminState = ref.watch(adminProductsNotifierProvider);
    final adminNotifier = ref.read(adminProductsNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const AppIcon(AppIcons.add, size: 22),
            tooltip: 'Add Product',
            onPressed: () => _openAddProductDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search & Filters Header
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(12),
                        child: AppIcon(AppIcons.search, size: 20),
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const AppIcon(AppIcons.close, size: 18),
                              onPressed: () {
                                _searchController.clear();
                                adminNotifier.loadProducts(search: '');
                              },
                            )
                          : null,
                    ),
                    onSubmitted: (query) {
                      adminNotifier.loadProducts(search: query);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Low Stock'),
                  selected: _lowStockOnly,
                  onSelected: (val) {
                    setState(() => _lowStockOnly = val);
                    adminNotifier.loadProducts(lowStock: val);
                  },
                ),
              ],
            ),
          ),

          // Products List
          Expanded(
            child: adminState.isLoading && adminState.products.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : adminState.products.isEmpty
                    ? const Center(
                        child: Text(
                          'No products found matching criteria',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () => adminNotifier.loadProducts(),
                        child: ListView.separated(
                          padding: const EdgeInsets.all(12),
                          itemCount: adminState.products.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final p = adminState.products[index];
                            final isLowStock = p.stock <= 10;

                            return Card(
                              elevation: 0.5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: !p.isActive
                                      ? Colors.grey.shade300
                                      : isLowStock
                                          ? Colors.red.shade200
                                          : Colors.grey.shade200,
                                ),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: isLowStock
                                      ? Colors.red.shade50
                                      : Colors.blue.shade50,
                                  child: Center(
                                    child: AppIcon(
                                      AppIcons.products,
                                      size: 20,
                                      color: isLowStock
                                          ? Colors.red
                                          : Colors.blue.shade700,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  p.productName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: p.isActive
                                        ? null
                                        : TextDecoration.lineThrough,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${p.sellerName} • \$${p.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isLowStock
                                                ? Colors.red.shade50
                                                : Colors.green.shade50,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            'Stock: ${p.stock}',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: isLowStock
                                                  ? Colors.red.shade800
                                                  : Colors.green.shade800,
                                            ),
                                          ),
                                        ),
                                        if (!p.isActive) ...[
                                          const SizedBox(width: 6),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: const Text(
                                              'INACTIVE',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: PopupMenuButton<String>(
                                  onSelected: (val) {
                                    if (val == 'stock') {
                                      _openStockDialog(context, p);
                                    } else if (val == 'delete') {
                                      _confirmDeleteProduct(context, p);
                                    }
                                  },
                                  itemBuilder: (ctx) => [
                                    const PopupMenuItem(
                                      value: 'stock',
                                      child: Text('Adjust Stock'),
                                    ),
                                    if (p.isActive)
                                      const PopupMenuItem(
                                        value: 'delete',
                                        child: Text('Deactivate Product',
                                            style: TextStyle(color: Colors.red)),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
