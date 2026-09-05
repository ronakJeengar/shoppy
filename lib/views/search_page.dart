import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/providers/catalog_provider.dart';
import 'package:shopp_app/providers/search_provider.dart';
import 'package:shopp_app/views/widgets/empty_state.dart';
import 'package:shopp_app/views/widgets/error_state.dart';
import 'package:shopp_app/views/widgets/filter_bottom_sheet.dart';
import 'package:shopp_app/views/widgets/product_card.dart';
import 'package:shopp_app/views/widgets/skeleton_loader.dart';

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
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.slate800),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 42,
          margin: const EdgeInsets.only(right: 8),
          decoration: const BoxDecoration(
            color: AppColors.slate100,
            borderRadius: AppRadius.borderFull,
          ),
          child: TextField(
            controller: _searchController,
            focusNode: _searchFocusNode,
            textInputAction: TextInputAction.search,
            style: AppTypography.bodyLarge.copyWith(color: AppColors.slate900),
            decoration: InputDecoration(
              hintText: 'Search products, brands, or describe what you need...',
              hintStyle: AppTypography.bodyMedium.copyWith(
                color: AppColors.slate400,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 20,
                color: AppColors.slate500,
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close_rounded, size: 18, color: AppColors.slate500),
                      onPressed: () {
                        _searchController.clear();
                        searchProvider.clearSearch();
                        setState(() {});
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
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.tune, color: AppColors.slate800),
                tooltip: 'Filters',
                onPressed: _openFilters,
              ),
              if (filterCount > 0)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$filterCount',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 6),
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
    // 1. Loading State with Product Skeletons
    if (searchProvider.isSearching) {
      return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.64,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 6,
        itemBuilder: (context, index) => const ProductCardSkeleton(),
      );
    }

    // 2. Error State
    if (searchProvider.errorMessage != null &&
        searchProvider.searchResults.isEmpty) {
      return ErrorStateView(
        message: searchProvider.errorMessage!,
        onRetry: () => searchProvider.executeSearch(_searchController.text),
      );
    }

    // 3. Search Results View
    if (searchProvider.hasExecutedSearch) {
      if (searchProvider.searchResults.isEmpty) {
        return EmptyStateView(
          icon: Icons.search_off_rounded,
          title: 'No results found',
          description:
              'No products matched "${searchProvider.currentQuery}". Try different keywords or clear filters.',
          buttonText: searchProvider.activeFilterCount > 0 ? 'Clear Filters' : null,
          onButtonPressed: () {
            searchProvider.resetFilters();
          },
        );
      }

      return Column(
        children: [
          // Results Header & Sort Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${searchProvider.searchResults.length} Products Found',
                  style: AppTypography.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.slate700,
                  ),
                ),
                PopupMenuButton<String>(
                  initialValue: searchProvider.selectedSort,
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadius.borderMd,
                  ),
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.sort_rounded, size: 16, color: AppColors.slate700),
                      const SizedBox(width: 4),
                      Text(
                        'Sort',
                        style: AppTypography.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.slate700,
                        ),
                      ),
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
          const Divider(height: 1, color: AppColors.slate200),
          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.64,
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
        separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.slate200),
        itemBuilder: (context, index) {
          final item = searchProvider.suggestions[index];
          final text = item['text']?.toString() ?? '';
          final type = item['type']?.toString() ?? 'product';

          return ListTile(
            leading: Icon(
              type == 'category' ? Icons.category_rounded : Icons.search_rounded,
              size: 20,
              color: AppColors.slate400,
            ),
            title: Text(
              text,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.slate800),
            ),
            trailing: const Icon(
              Icons.north_west_rounded,
              size: 16,
              color: AppColors.slate400,
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
                  style: AppTypography.headingSmall,
                ),
                TextButton(
                  onPressed: () => searchProvider.clearRecentSearches(),
                  child: Text(
                    'Clear All',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: recents.map((term) {
                return Chip(
                  backgroundColor: AppColors.white,
                  side: const BorderSide(color: AppColors.slate200),
                  label: Text(
                    term,
                    style: AppTypography.bodySmall.copyWith(color: AppColors.slate800),
                  ),
                  deleteIcon: const Icon(Icons.close_rounded, size: 14, color: AppColors.slate400),
                  onDeleted: () => searchProvider.removeRecentSearch(term),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],

          // Popular Categories Section
          const Text(
            'Explore Categories',
            style: AppTypography.headingSmall,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: catalogProvider.categories.map((cat) {
              return ActionChip(
                backgroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.slate200),
                avatar: const Icon(Icons.category_rounded, size: 16, color: AppColors.primary),
                label: Text(
                  cat.displayName,
                  style: AppTypography.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.slate800,
                  ),
                ),
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
