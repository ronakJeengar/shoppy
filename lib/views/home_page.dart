import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
import 'package:shopp_app/views/widgets/product_card.dart';
import 'package:shopp_app/views/widgets/recommendation_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().getCurrentUser();
      context.read<CatalogProvider>().loadInitialData();
      context.read<RecommendationProvider>().fetchPersonalized();
      context.read<RecommendationProvider>().fetchTrending();
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Shoppy Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // Notifications Action with Unread Badge
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined),
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
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${notifProvider.unreadCount}',
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
          // Wishlist Action with Badge
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
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
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${wishlistProvider.itemCount}',
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
          // Cart Action with Badge
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
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
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${cartProvider.totalItemCount}',
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
          // AI Shopping Assistant Action
          IconButton(
            icon: const Icon(Icons.auto_awesome),
            tooltip: 'AI Shopping Assistant',
            color: Colors.deepPurpleAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AssistantPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'My Account',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([
            catalogProvider.refreshCatalog(),
            context.read<RecommendationProvider>().fetchPersonalized(force: true),
            context.read<RecommendationProvider>().fetchTrending(force: true),
          ]);
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // User Greeting Card
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue.shade100,
                          child: Text(
                            (currentUser?.name.isNotEmpty == true)
                                ? currentUser!.name[0].toUpperCase()
                                : 'U',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, ${currentUser?.name ?? "Shopper"} 👋',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Find what you love today',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            (currentUser?.role ?? 'CUSTOMER').toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Interactive Search Bar Trigger
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
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
                        horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey.shade500),
                        const SizedBox(width: 8),
                        Text(
                          'Search products, brands and categories...',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Categories Section Title
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Category Chips Carousel
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: CategorySelector(),
              ),
            ),

            // AI Recommendations: Recommended For You
            if (recProvider.personalized.isNotEmpty ||
                recProvider.isLoadingPersonalized)
              SliverToBoxAdapter(
                child: RecommendationCarousel(
                  title: 'Recommended For You',
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
                  title: 'Trending Now',
                  subtitle: recProvider.trendingReason,
                  items: recProvider.trending,
                  isLoading: recProvider.isLoadingTrending,
                  onRefresh: () => recProvider.fetchTrending(force: true),
                ),
              ),

            // Catalog Header & Sort Options
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      catalogProvider.selectedCategoryId == null
                          ? 'All Products (${catalogProvider.products.length})'
                          : 'Filtered Products (${catalogProvider.products.length})',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PopupMenuButton<String>(
                      initialValue: catalogProvider.selectedSort,
                      icon: const Row(
                        children: [
                          Icon(Icons.sort, size: 18),
                          SizedBox(width: 4),
                          Text('Sort', style: TextStyle(fontSize: 13)),
                        ],
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

            // Catalog Content
            if (catalogProvider.isLoadingProducts &&
                catalogProvider.products.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else if (catalogProvider.errorMessage != null &&
                catalogProvider.products.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 40,
                          color: Colors.red.shade400,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          catalogProvider.errorMessage!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: () {
                            catalogProvider.loadInitialData();
                          },
                          icon: const Icon(Icons.refresh, size: 18),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else if (catalogProvider.products.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 48,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'No products found in this category',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.68,
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

            // Loading more pagination indicator
            if (catalogProvider.isLoadingMore)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
