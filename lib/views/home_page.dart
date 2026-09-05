import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/currrent_user_model.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/providers/catalog_provider.dart';
import 'package:shopp_app/providers/notification_provider.dart';
import 'package:shopp_app/providers/recommendation_provider.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/providers/wishlist_provider.dart';
import 'package:shopp_app/views/assistant_page.dart';
import 'package:shopp_app/views/cart_page.dart';
import 'package:shopp_app/views/notifications_page.dart';
import 'package:shopp_app/views/profile_page.dart';
import 'package:shopp_app/views/search_page.dart';
import 'package:shopp_app/views/wishlist_page.dart';
import 'package:shopp_app/views/widgets/category_selector.dart';
import 'package:shopp_app/views/widgets/empty_state.dart';
import 'package:shopp_app/views/widgets/error_state.dart';
import 'package:shopp_app/views/widgets/product_card.dart';
import 'package:shopp_app/views/widgets/recommendation_carousel.dart';
import 'package:shopp_app/views/widgets/skeleton_loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().getCurrentUser();
      context.read<CatalogProvider>().loadInitialData();
      context.read<RecommendationProvider>().fetchPersonalized();
      context.read<RecommendationProvider>().fetchTrending();
      context.read<CartProvider>().loadCart();
      context.read<WishlistProvider>().loadWishlist();
      context.read<NotificationProvider>().loadNotifications();
    });

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
      context.read<CatalogProvider>().loadMoreProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final catalogProvider = context.watch<CatalogProvider>();
    final cartProvider = context.watch<CartProvider>();
    final wishlistProvider = context.watch<WishlistProvider>();
    final notifProvider = context.watch<NotificationProvider>();
    final recProvider = context.watch<RecommendationProvider>();
    final CurrentUserModel? currentUser = userProvider.currentUser;

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
              child: const Icon(
                Icons.shopping_bag_rounded,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Shoppy Store',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    color: AppColors.slate900,
                  ),
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
                    const Icon(
                      Icons.auto_awesome,
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

          // Notifications Icon with Badge
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined),
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
              if (notifProvider.unreadCount > 0)
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
                      '${notifProvider.unreadCount}',
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

          // Wishlist Action with Badge
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                color: AppColors.slate700,
                tooltip: 'Wishlist',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WishlistPage()),
                  );
                },
              ),
              if (wishlistProvider.itemCount > 0)
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
                      '${wishlistProvider.itemCount}',
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

          // Cart Action with Badge
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                color: AppColors.slate700,
                tooltip: 'Cart',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              ),
              if (cartProvider.totalItemCount > 0)
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
                      '${cartProvider.totalItemCount}',
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

          // Profile / Account Action
          IconButton(
            icon: const Icon(Icons.person_outline),
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
            catalogProvider.refreshCatalog(),
            context.read<RecommendationProvider>().fetchPersonalized(force: true),
            context.read<RecommendationProvider>().fetchTrending(force: true),
            context.read<CartProvider>().loadCart(),
            context.read<WishlistProvider>().loadWishlist(),
          ]);
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Search Bar Quick-Access Field
            SliverToBoxAdapter(
              child: Padding(
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
                        const Icon(
                          Icons.search_rounded,
                          color: AppColors.slate400,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Search products, brands and categories...',
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
                          child: const Icon(
                            Icons.tune_rounded,
                            size: 16,
                            color: AppColors.slate600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Hero Promotional Carousel Banner
            SliverToBoxAdapter(
              child: Padding(
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
                                    const Icon(
                                      Icons.arrow_forward_rounded,
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
                    // Banner Indicators
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
              ),
            ),

            // Categories Section Title & Selector
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Categories',
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

            // AI Recommendations: Recommended For You
            if (recProvider.personalized.isNotEmpty ||
                recProvider.isLoadingPersonalized)
              SliverToBoxAdapter(
                child: RecommendationCarousel(
                  title: 'Curated For You',
                  subtitle: recProvider.personalizedReason,
                  items: recProvider.personalized,
                  isLoading: recProvider.isLoadingPersonalized,
                  onRefresh: () =>
                      recProvider.fetchPersonalized(force: true),
                ),
              ),

            // AI Recommendations: Trending Now
            if (recProvider.trending.isNotEmpty ||
                recProvider.isLoadingTrending)
              SliverToBoxAdapter(
                child: RecommendationCarousel(
                  title: 'Trending Right Now',
                  subtitle: recProvider.trendingReason,
                  items: recProvider.trending,
                  isLoading: recProvider.isLoadingTrending,
                  onRefresh: () => recProvider.fetchTrending(force: true),
                ),
              ),

            // Catalog Header with Sort Selector
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      catalogProvider.selectedCategoryId == null
                          ? 'All Products (${catalogProvider.products.length})'
                          : 'Filtered Results (${catalogProvider.products.length})',
                      style: AppTypography.headingSmall,
                    ),
                    PopupMenuButton<String>(
                      initialValue: catalogProvider.selectedSort,
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
                            const Icon(
                              Icons.sort_rounded,
                              size: 16,
                              color: AppColors.slate700,
                            ),
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
                      ),
                      onSelected: (sort) {
                        catalogProvider.setSort(sort);
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
            ),

            // Main Catalog Grid / Skeletons / Empty / Error States
            if (catalogProvider.isLoadingProducts &&
                catalogProvider.products.isEmpty)
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
              )
            else if (catalogProvider.errorMessage != null &&
                catalogProvider.products.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: ErrorStateView(
                  message: catalogProvider.errorMessage!,
                  onRetry: () => catalogProvider.loadInitialData(),
                ),
              )
            else if (catalogProvider.products.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyStateView(
                  icon: Icons.inventory_2_outlined,
                  title: 'No products in this category',
                  description:
                      'Try switching categories or check back later for new inventory.',
                  buttonText: 'View All Products',
                  onButtonPressed: () {
                    context.read<CatalogProvider>().selectCategory(null);
                  },
                ),
              )
            else
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
                      final product = catalogProvider.products[index];
                      return ProductCard(product: product);
                    },
                    childCount: catalogProvider.products.length,
                  ),
                ),
              ),

            // Pagination loading indicator
            if (catalogProvider.isLoadingMore)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
          ],
        ),
      ),
    );
  }
}
