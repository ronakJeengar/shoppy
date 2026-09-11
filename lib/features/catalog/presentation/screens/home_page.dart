import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopp_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:shopp_app/features/recommendations/domain/entities/recommendation_entity.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';
import 'package:shopp_app/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:shopp_app/features/config/domain/entities/app_config_entity.dart';
import 'package:shopp_app/features/config/presentation/providers/app_config_providers.dart';
import 'package:shopp_app/features/notifications/presentation/providers/notification_providers.dart';
import 'package:shopp_app/features/recommendations/presentation/providers/recommendation_providers.dart';
import 'package:shopp_app/features/wishlist/presentation/providers/wishlist_providers.dart';
import 'package:shopp_app/features/assistant/presentation/screens/assistant_page.dart';
import 'package:shopp_app/features/cart/presentation/screens/cart_page.dart';
import 'package:shopp_app/features/notifications/presentation/screens/notifications_page.dart';
import 'package:shopp_app/features/profile/presentation/screens/profile_page.dart';
import 'package:shopp_app/features/search/presentation/screens/search_page.dart';
import 'package:shopp_app/features/wishlist/presentation/screens/wishlist_page.dart';
import '../widgets/category_selector.dart';
import 'package:shopp_app/core/widgets/empty_state.dart';
import 'package:shopp_app/core/widgets/error_state.dart';
import '../widgets/product_card.dart';
import 'package:shopp_app/features/recommendations/presentation/widgets/recommendation_carousel.dart';
import 'package:shopp_app/core/widgets/skeleton_loader.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final PageController _bannerController = PageController();
  int _activeBannerIndex = 0;

  final List<Map<String, String>> _promoBanners = [
    {
      'tag': 'SEASON HIGHLIGHT',
      'title': 'Next-Gen Sound & Audio Labs',
      'subtitle': 'Explore noise-cancelling headphones & studio gear.',
      'action': 'Discover Now',
      'bgGradient': 'indigo',
    },
    {
      'tag': 'NEW ARRIVALS',
      'title': 'Timeless Minimalist Essentials',
      'subtitle': 'Sustainable organic apparel and premium leather goods.',
      'action': 'Shop Collection',
      'bgGradient': 'slate',
    },
    {
      'tag': 'LIMITED OFFER',
      'title': 'Modern Living & Artisan Brews',
      'subtitle': 'Handcrafted ceramic drippers and dinnerware.',
      'action': 'Claim 15% Off',
      'bgGradient': 'amber',
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _bannerController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      // Catalog pagination if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);
    final productsState = ref.watch(productsNotifierProvider);
    final products = productsState.productsState.data ?? [];
    final isLoadingProducts = productsState.productsState.isLoading;
    final productsError = productsState.productsState.error;
    final cartCount = ref.watch(cartItemCountProvider);
    final wishlistCount = ref.watch(wishlistNotifierProvider).data?.length ?? 0;
    final unreadNotifs = ref.watch(notificationUnreadCountProvider);
    final personalizedRecs = ref.watch(personalizedRecommendationsProvider).valueOrNull?.items ?? [];
    final trendingRecs = ref.watch(trendingRecommendationsProvider).valueOrNull?.items ?? [];
    final featureFlags = ref.watch(featureFlagsProvider);
    final homeSections = ref.watch(homeSectionsProvider);

    return Scaffold(
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.primary50,
                borderRadius: AppRadius.borderSm,
              ),
              child: const Center(
                child: AppIcon(
                  AppIcons.bagFilled,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Shoppy Store',
                  style: AppTypography.headingSmall,
                ),
                Text(
                  currentUser?.name.isNotEmpty == true
                      ? 'Hi, ${currentUser!.name}'
                      : 'Find what you love',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.slate500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // AI Shopping Assistant Quick Pill
          if (featureFlags.aiAssistant) ...[
            Material(
              color: AppColors.violetLight,
              borderRadius: AppRadius.borderFull,
              child: InkWell(
                borderRadius: AppRadius.borderFull,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AssistantPage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppIcon(
                        AppIcons.sparkles,
                        size: 15,
                        color: AppColors.violet,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'AI Copilot',
                        style: AppTypography.label.copyWith(
                          color: AppColors.violet,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
          ],

          // Notifications Icon with Badge
          if (featureFlags.notifications)
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const AppIcon(AppIcons.notifications, size: AppIconSizes.lg),
                  color: AppColors.slate700,
                  tooltip: 'Notifications',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsPage(),
                      ),
                    );
                  },
                ),
                if (unreadNotifs > 0)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$unreadNotifs',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.white,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

          // Wishlist Action with Badge
          if (featureFlags.wishlist)
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const AppIcon(AppIcons.wishlist, size: AppIconSizes.lg),
                  color: AppColors.slate700,
                  tooltip: 'Wishlist',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WishlistPage()),
                    );
                  },
                ),
                if (wishlistCount > 0)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.rose500,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$wishlistCount',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.white,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

          // Cart Action with Badge
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const AppIcon(AppIcons.cart, size: AppIconSizes.lg),
                color: AppColors.slate700,
                tooltip: 'Cart',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              ),
              if (cartCount > 0)
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
                      '$cartCount',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.white,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Profile / Account Action
          IconButton(
            icon: const AppIcon(AppIcons.user, size: AppIconSizes.lg),
            color: AppColors.slate700,
            tooltip: 'My Account',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          await Future.wait([
            ref.read(productsNotifierProvider.notifier).fetchProducts(),
            ref.read(cartNotifierProvider.notifier).loadCart(),
            ref.read(wishlistNotifierProvider.notifier).loadWishlist(),
            ref.read(notificationNotifierProvider.notifier).loadNotifications(),
          ]);
          ref.invalidate(personalizedRecommendationsProvider);
          ref.invalidate(trendingRecommendationsProvider);
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Search Bar Quick-Access Field
            SliverToBoxAdapter(
              child: _buildSearchBar(context),
            ),

            // Server-Driven Dynamic Home Sections
            for (final section in homeSections)
              ..._buildSectionSlivers(
                context: context,
                section: section,
                featureFlags: featureFlags,
                personalizedRecs: personalizedRecs,
                trendingRecs: trendingRecs,
                productsState: productsState,
                products: products,
                isLoadingProducts: isLoadingProducts,
                productsError: productsError,
              ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: InkWell(
        borderRadius: AppRadius.borderMd,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppRadius.borderMd,
            border: Border.all(color: AppColors.slate200, width: 1),
            boxShadow: AppShadows.card,
          ),
          child: Row(
            children: [
              const AppIcon(
                AppIcons.search,
                color: AppColors.slate400,
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  AppStrings.home.searchPlaceholder,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.slate400,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.slate100,
                  borderRadius: AppRadius.borderXs,
                ),
                child: const Center(
                  child: AppIcon(
                    AppIcons.tune,
                    size: 16,
                    color: AppColors.slate600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSectionSlivers({
    required BuildContext context,
    required HomeSectionEntity section,
    required FeatureFlagsEntity featureFlags,
    required List<RecommendedProductEntity> personalizedRecs,
    required List<RecommendedProductEntity> trendingRecs,
    required dynamic productsState,
    required List<ProductEntity> products,
    required bool isLoadingProducts,
    required String? productsError,
  }) {
    switch (section.id) {
      case 'hero_banner':
        return [
          SliverToBoxAdapter(child: _buildHeroBanner()),
        ];

      case 'categories':
        return [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                section.title.isNotEmpty ? section.title : AppStrings.home.categories,
                style: AppTypography.headingSmall,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: CategorySelector(),
            ),
          ),
        ];

      case 'recommendations':
        if (!featureFlags.recommendations || personalizedRecs.isEmpty) {
          return const [];
        }
        return [
          SliverToBoxAdapter(
            child: RecommendationCarousel(
              title: section.title.isNotEmpty
                  ? section.title
                  : AppStrings.home.curatedForYou,
              subtitle: AppStrings.home.basedOnShoppingTrends,
              items: personalizedRecs,
              onRefresh: () => ref.refresh(personalizedRecommendationsProvider),
            ),
          ),
        ];

      case 'trending':
        if (!featureFlags.recommendations || trendingRecs.isEmpty) {
          return const [];
        }
        return [
          SliverToBoxAdapter(
            child: RecommendationCarousel(
              title: section.title.isNotEmpty
                  ? section.title
                  : AppStrings.home.trending,
              subtitle: AppStrings.home.mostPopularToday,
              items: trendingRecs,
              onRefresh: () => ref.refresh(trendingRecommendationsProvider),
            ),
          ),
        ];

      case 'offers':
        if (!featureFlags.coupons) {
          return const [];
        }
        return [
          SliverToBoxAdapter(
            child: _buildOffersBanner(section),
          ),
        ];

      case 'featured_collection':
        return [
          _buildCatalogHeader(section.title, productsState, products.length),
          ..._buildCatalogContent(
            isLoadingProducts: isLoadingProducts,
            products: products,
            productsError: productsError,
          ),
        ];

      default:
        // Allowlist security: strictly ignore any unauthorized/unknown remote sections
        return const [];
    }
  }

  Widget _buildOffersBanner(HomeSectionEntity section) {
    final title = section.title.isNotEmpty ? section.title : AppStrings.home.offers;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryLight.withValues(alpha: 0.12),
          borderRadius: AppRadius.borderLg,
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: AppRadius.borderMd,
              ),
              child: const Center(
                child: AppIcon(
                  AppIcons.tag,
                  color: AppColors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.headingSmall.copyWith(
                      fontSize: 15,
                      color: AppColors.slate900,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Exclusive discounts applied automatically at checkout.',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.slate600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: AppRadius.borderFull,
              ),
              child: Text(
                'PROMO',
                style: AppTypography.label.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: [
          SizedBox(
            height: 156,
            child: PageView.builder(
              controller: _bannerController,
              onPageChanged: (idx) {
                setState(() {
                  _activeBannerIndex = idx;
                });
              },
              itemCount: _promoBanners.length,
              itemBuilder: (context, index) {
                final b = _promoBanners[index];
                Gradient gradient;
                if (b['bgGradient'] == 'slate') {
                  gradient = const LinearGradient(
                    colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  );
                } else if (b['bgGradient'] == 'amber') {
                  gradient = const LinearGradient(
                    colors: [Color(0xFF78350F), Color(0xFFB45309)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  );
                } else {
                  gradient = AppColors.primaryGradient;
                }

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: AppRadius.borderLg,
                    boxShadow: AppShadows.card,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.2),
                              borderRadius: AppRadius.borderFull,
                            ),
                            child: Text(
                              b['tag']!,
                              style: AppTypography.label.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            b['title']!,
                            style: AppTypography.headingMedium.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            b['subtitle']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.white.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            b['action']!,
                            style: AppTypography.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const AppIcon(
                            AppIcons.arrowForward,
                            color: AppColors.white,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _promoBanners.length,
              (index) => Container(
                width: _activeBannerIndex == index ? 16 : 6,
                height: 5,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: _activeBannerIndex == index
                      ? AppColors.primary
                      : AppColors.slate300,
                  borderRadius: AppRadius.borderFull,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCatalogHeader(String title, dynamic productsState, int count) {
    final displayTitle = title.isNotEmpty
        ? title
        : (productsState.selectedCategory == null
            ? 'All Products ($count)'
            : 'Filtered Results ($count)');

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              displayTitle,
              style: AppTypography.headingSmall,
            ),
            PopupMenuButton<String>(
              initialValue: productsState.sort,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadius.borderMd,
              ),
              icon: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppRadius.borderFull,
                  border: Border.all(color: AppColors.slate200),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AppIcon(
                      AppIcons.sort,
                      size: 16,
                      color: AppColors.slate700,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      AppStrings.home.sort,
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.slate700,
                      ),
                    ),
                  ],
                ),
              ),
              onSelected: (sort) {
                ref.read(productsNotifierProvider.notifier).setSort(sort);
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'newest',
                  child: Text(AppStrings.home.newestFirst),
                ),
                PopupMenuItem(
                  value: 'price_asc',
                  child: Text(AppStrings.home.priceLowHigh),
                ),
                PopupMenuItem(
                  value: 'price_desc',
                  child: Text(AppStrings.home.priceHighLow),
                ),
                PopupMenuItem(
                  value: 'rating',
                  child: Text(AppStrings.home.highestRated),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCatalogContent({
    required bool isLoadingProducts,
    required List<dynamic> products,
    required String? productsError,
  }) {
    if (isLoadingProducts && products.isEmpty) {
      return [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.64,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => const ProductCardSkeleton(),
              childCount: 6,
            ),
          ),
        ),
      ];
    } else if (productsError != null && products.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: ErrorStateView(
            message: productsError,
            onRetry: () => ref.read(productsNotifierProvider.notifier).fetchProducts(),
          ),
        ),
      ];
    } else if (products.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: EmptyStateView(
            icon: AppIcons.package,
            title: AppStrings.home.noProductsCategory,
            description: AppStrings.home.noProductsCategorySubtitle,
            buttonText: AppStrings.home.viewAllProducts,
            onButtonPressed: () {
              ref.read(productsNotifierProvider.notifier).selectCategory(null);
            },
          ),
        ),
      ];
    } else {
      return [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.64,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
              childCount: products.length,
            ),
          ),
        ),
      ];
    }
  }
}
