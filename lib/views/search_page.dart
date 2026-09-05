import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/providers/catalog_provider.dart';
import 'package:shopp_app/providers/search_provider.dart';
import 'package:shopp_app/views/widgets/filter_bottom_sheet.dart';
import 'package:shopp_app/views/widgets/product_card.dart';

class SearchPage extends StatefulWidget {
  final String? initialQuery;

  const SearchPage({
    super.key,
    this.initialQuery,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.initialQuery != null && widget.initialQuery!.isNotEmpty) {
      _searchController.text = widget.initialQuery!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<SearchProvider>().executeSearch(widget.initialQuery!);
      });
    } else {
      _searchFocusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _openFilters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    final catalogProvider = context.watch<CatalogProvider>();
    final filterCount = searchProvider.activeFilterCount;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search products, brands, or describe what you need...',
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, size: 20),
                    onPressed: () {
                      _searchController.clear();
                      searchProvider.clearSearch();
                    },
                  )
                : null,
          ),
          onChanged: (val) {
            setState(() {});
            searchProvider.onQueryChanged(val);
          },
          onSubmitted: (val) {
            searchProvider.executeSearch(val);
          },
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.tune),
                tooltip: 'Filters',
                onPressed: _openFilters,
              ),
              if (filterCount > 0)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$filterCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: _buildBody(context, searchProvider, catalogProvider),
    );
  }

  Widget _buildBody(
    BuildContext context,
    SearchProvider searchProvider,
    CatalogProvider catalogProvider,
  ) {
    // 1. Loading State
    if (searchProvider.isSearching) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Searching products...'),
          ],
        ),
      );
    }

    // 2. Error State
    if (searchProvider.errorMessage != null &&
        searchProvider.searchResults.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48, color: Colors.red.shade400),
              const SizedBox(height: 12),
              Text(
                searchProvider.errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  searchProvider.executeSearch(_searchController.text);
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    // 3. Search Results View
    if (searchProvider.hasExecutedSearch) {
      if (searchProvider.searchResults.isEmpty) {
        return Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off,
                  size: 64,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 16),
                Text(
                  'No products found matching "${searchProvider.currentQuery}"',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Try checking your spelling, using more general search terms, or clearing filters.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 20),
                if (searchProvider.activeFilterCount > 0)
                  OutlinedButton.icon(
                    onPressed: () {
                      searchProvider.resetFilters();
                    },
                    icon: const Icon(Icons.filter_alt_off),
                    label: const Text('Clear All Filters'),
                  ),
              ],
            ),
          ),
        );
      }

      return Column(
        children: [
          // Results Header & Sort
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${searchProvider.searchResults.length} results',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                PopupMenuButton<String>(
                  initialValue: searchProvider.selectedSort,
                  icon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.sort, size: 16),
                      SizedBox(width: 4),
                      Text('Sort', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  onSelected: (sort) {
                    searchProvider.setSort(sort);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'newest',
                      child: Text('Newest First'),
                    ),
                    const PopupMenuItem(
                      value: 'price_asc',
                      child: Text('Price: Low to High'),
                    ),
                    const PopupMenuItem(
                      value: 'price_desc',
                      child: Text('Price: High to Low'),
                    ),
                    const PopupMenuItem(
                      value: 'rating',
                      child: Text('Highest Rated'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: searchProvider.searchResults.length,
              itemBuilder: (context, index) {
                final product = searchProvider.searchResults[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      );
    }

    // 4. Live Suggestions (while typing)
    if (_searchController.text.trim().isNotEmpty &&
        searchProvider.suggestions.isNotEmpty) {
      return ListView.separated(
        itemCount: searchProvider.suggestions.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = searchProvider.suggestions[index];
          final text = item['text']?.toString() ?? '';
          final type = item['type']?.toString() ?? 'product';

          return ListTile(
            leading: Icon(
              type == 'category' ? Icons.category_outlined : Icons.search,
              size: 20,
              color: Colors.grey,
            ),
            title: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
            trailing: const Icon(
              Icons.north_west,
              size: 16,
              color: Colors.grey,
            ),
            onTap: () {
              _searchController.text = text;
              searchProvider.executeSearch(text);
            },
          );
        },
      );
    }

    // 5. Default Screen: Recent Searches & Categories
    final recents = searchProvider.recentSearches;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent Searches Section
          if (recents.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Searches',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    searchProvider.clearRecentSearches();
                  },
                  child: const Text('Clear All'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: recents.map((term) {
                return InputChip(
                  label: Text(term),
                  onPressed: () {
                    _searchController.text = term;
                    searchProvider.executeSearch(term);
                  },
                  onDeleted: () {
                    searchProvider.removeRecentSearch(term);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],

          // Popular Categories Section
          const Text(
            'Explore Categories',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: catalogProvider.categories.map((cat) {
              return ActionChip(
                avatar: const Icon(Icons.category, size: 16),
                label: Text(cat.displayName),
                onPressed: () {
                  _searchController.text = cat.displayName;
                  searchProvider.setFilters(categoryId: cat.id);
                  searchProvider.executeSearch(cat.displayName);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
