import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/features/catalog/domain/entities/category_entity.dart';
import 'package:shopp_app/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:shopp_app/features/search/presentation/providers/search_providers.dart';
import 'package:shopp_app/views/widgets/empty_state.dart';
import 'package:shopp_app/views/widgets/error_state.dart';
import 'package:shopp_app/views/widgets/filter_bottom_sheet.dart';
import 'package:shopp_app/views/widgets/product_card.dart';
import 'package:shopp_app/views/widgets/skeleton_loader.dart';

class SearchPage extends ConsumerStatefulWidget {
  final String? initialQuery;

  const SearchPage({
    super.key,
    this.initialQuery,
  });

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.initialQuery != null && widget.initialQuery!.isNotEmpty) {
      _searchController.text = widget.initialQuery!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(searchNotifierProvider.notifier).executeSearch(widget.initialQuery!);
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
    final searchState = ref.watch(searchNotifierProvider);
    final searchNotifier = ref.read(searchNotifierProvider.notifier);
    final categoriesState = ref.watch(categoriesNotifierProvider);
    final categories = categoriesState.data ?? [];
    final filterCount = searchState.activeFilterCount;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const AppIcon(AppIcons.back, color: AppColors.slate800),
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
              prefixIcon: const Padding(
                padding: EdgeInsets.all(12),
                child: AppIcon(
                  AppIcons.search,
                  size: AppIconSizes.md,
                  color: AppColors.slate500,
                ),
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const AppIcon(AppIcons.close, size: AppIconSizes.action, color: AppColors.slate500),
                      onPressed: () {
                        _searchController.clear();
                        searchNotifier.clearSearch();
                        setState(() {});
                      },
                    )
                  : null,
            ),
            onChanged: (val) {
              setState(() {});
              searchNotifier.onQueryChanged(val);
            },
            onSubmitted: (val) {
              searchNotifier.executeSearch(val);
            },
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const AppIcon(AppIcons.tune, color: AppColors.slate800),
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
      body: _buildBody(context, searchState, searchNotifier, categories),
    );
  }

  Widget _buildBody(
    BuildContext context,
    SearchState searchState,
    SearchNotifier searchNotifier,
    List<CategoryEntity> categories,
  ) {
    // 1. Loading State with Product Skeletons
    if (searchState.resultsState.isLoading) {
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
    if (searchState.resultsState.isError &&
        (searchState.resultsState.data?.isEmpty ?? true)) {
      return ErrorStateView(
        message: searchState.resultsState.error ?? 'An error occurred during search',
        onRetry: () => searchNotifier.executeSearch(_searchController.text),
      );
    }

    // 3. Search Results View
    if (searchState.hasExecutedSearch) {
      final searchResults = searchState.resultsState.data ?? [];
      if (searchResults.isEmpty) {
        return EmptyStateView(
          icon: AppIcons.searchOff,
          title: AppStrings.search.noResults,
          description:
              'No products matched "${searchState.query}". Try different keywords or clear filters.',
          buttonText: searchState.activeFilterCount > 0 ? AppStrings.search.clearFilters : null,
          onButtonPressed: () {
            searchNotifier.resetFilters();
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
                  AppStrings.search.productsFound(searchResults.length),
                  style: AppTypography.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.slate700,
                  ),
                ),
                PopupMenuButton<String>(
                  initialValue: searchState.selectedSort,
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadius.borderMd,
                  ),
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppIcon(AppIcons.sort, size: AppIconSizes.sm, color: AppColors.slate700),
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
                    searchNotifier.setSort(sort);
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
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final product = searchResults[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      );
    }

    // 4. Live Suggestions (while typing)
    if (_searchController.text.trim().isNotEmpty &&
        searchState.suggestions.isNotEmpty) {
      return ListView.separated(
        itemCount: searchState.suggestions.length,
        separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.divider),
        itemBuilder: (context, index) {
          final item = searchState.suggestions[index];
          final text = item['name']?.toString() ?? item['text']?.toString() ?? '';
          final type = item['type']?.toString() ?? 'product';

          return ListTile(
            leading: AppIcon(
              type == 'category' ? AppIcons.category : AppIcons.search,
              size: AppIconSizes.md,
              color: AppColors.textMuted,
            ),
            title: Text(
              text,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.slate800),
            ),
            trailing: const AppIcon(
              AppIcons.arrowNorthWest,
              size: AppIconSizes.sm,
              color: AppColors.textMuted,
            ),
            onTap: () {
              _searchController.text = text;
              searchNotifier.executeSearch(text);
            },
          );
        },
      );
    }

    // 5. Default Screen: Recent Searches & Categories
    final recents = searchState.recentSearches;

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
                  onPressed: () => searchNotifier.clearRecentSearches(),
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
                  deleteIcon: const AppIcon(AppIcons.close, size: AppIconSizes.sm, color: AppColors.textMuted),
                  onDeleted: () => searchNotifier.removeRecentSearch(term),
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
            children: categories.map((cat) {
              return ActionChip(
                backgroundColor: AppColors.surface,
                side: const BorderSide(color: AppColors.border),
                avatar: const AppIcon(AppIcons.category, size: AppIconSizes.sm, color: AppColors.primary),
                label: Text(
                  cat.name,
                  style: AppTypography.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.slate800,
                  ),
                ),
                onPressed: () {
                  _searchController.text = cat.name;
                  searchNotifier.setFilters(categoryId: cat.id);
                  searchNotifier.executeSearch(cat.name);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
