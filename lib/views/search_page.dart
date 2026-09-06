import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColors.surface,
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
            style: AppTypography.bodyLarge.copyWith(color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: AppStrings.search.searchHint,
              hintStyle: AppTypography.bodyMedium.copyWith(
                color: AppColors.textMuted,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: AppDimensions.lg, vertical: 10),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: AppIconSizes.md,
                color: AppColors.slate500,
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close_rounded, size: AppIconSizes.sm + 2, color: AppColors.slate500),
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
                tooltip: AppStrings.search.filters,
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
        padding: AppDimensions.cardPadding,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.64,
          crossAxisSpacing: AppDimensions.md,
          mainAxisSpacing: AppDimensions.md,
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
          title: AppStrings.search.noResults,
          description:
              'No products matched "${searchProvider.currentQuery}". Try different keywords or clear filters.',
          buttonText: searchProvider.activeFilterCount > 0 ? AppStrings.search.clearFilters : null,
          onButtonPressed: () {
            searchProvider.resetFilters();
          },
        );
      }

      return Column(
        children: [
          // Results Header & Sort Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.lg, vertical: 10),
            color: AppColors.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.search.productsFound(searchProvider.searchResults.length),
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
                      const Icon(Icons.sort_rounded, size: AppIconSizes.sm, color: AppColors.slate700),
                      const SizedBox(width: AppDimensions.xs),
                      Text(
                        AppStrings.search.sort,
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
                    PopupMenuItem(
                      value: 'newest',
                      child: Text(AppStrings.search.newest),
                    ),
                    PopupMenuItem(
                      value: 'price_asc',
                      child: Text(AppStrings.search.priceLowToHigh),
                    ),
                    PopupMenuItem(
                      value: 'price_desc',
                      child: Text(AppStrings.search.priceHighToLow),
                    ),
                    PopupMenuItem(
                      value: 'rating',
                      child: Text(AppStrings.search.highestRated),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.divider),
          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: AppDimensions.cardPadding,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.64,
                crossAxisSpacing: AppDimensions.md,
                mainAxisSpacing: AppDimensions.md,
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
        separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.divider),
        itemBuilder: (context, index) {
          final item = searchProvider.suggestions[index];
          final text = item['text']?.toString() ?? '';
          final type = item['type']?.toString() ?? 'product';

          return ListTile(
            leading: Icon(
              type == 'category' ? Icons.category_rounded : Icons.search_rounded,
              size: AppIconSizes.md,
              color: AppColors.textMuted,
            ),
            title: Text(
              text,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.slate800),
            ),
            trailing: const Icon(
              Icons.north_west_rounded,
              size: AppIconSizes.sm,
              color: AppColors.textMuted,
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
      padding: AppDimensions.cardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent Searches Section
          if (recents.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.search.recentSearches,
                  style: AppTypography.headingSmall,
                ),
                TextButton(
                  onPressed: () => searchProvider.clearRecentSearches(),
                  child: Text(
                    AppStrings.search.clearAll,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.sm),
            Wrap(
              spacing: AppDimensions.sm,
              runSpacing: AppDimensions.sm,
              children: recents.map((term) {
                return Chip(
                  backgroundColor: AppColors.surface,
                  side: const BorderSide(color: AppColors.border),
                  label: Text(
                    term,
                    style: AppTypography.bodySmall.copyWith(color: AppColors.slate800),
                  ),
                  deleteIcon: const Icon(Icons.close_rounded, size: 14, color: AppColors.textMuted),
                  onDeleted: () => searchProvider.removeRecentSearch(term),
                );
              }).toList(),
            ),
            const SizedBox(height: AppDimensions.xxl),
          ],

          // Popular Categories Section
          Text(
            AppStrings.search.exploreCategories,
            style: AppTypography.headingSmall,
          ),
          const SizedBox(height: AppDimensions.md),
          Wrap(
            spacing: AppDimensions.sm,
            runSpacing: AppDimensions.sm,
            children: catalogProvider.categories.map((cat) {
              return ActionChip(
                backgroundColor: AppColors.surface,
                side: const BorderSide(color: AppColors.border),
                avatar: const Icon(Icons.category_rounded, size: AppIconSizes.sm, color: AppColors.primary),
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
