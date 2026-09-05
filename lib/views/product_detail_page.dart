import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/models/review_model.dart';
import 'package:shopp_app/data/repositories/catalog_repository.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/providers/recommendation_provider.dart';
import 'package:shopp_app/providers/review_provider.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/providers/wishlist_provider.dart';
import 'package:shopp_app/views/cart_page.dart';
import 'package:shopp_app/views/widgets/app_button.dart';
import 'package:shopp_app/views/widgets/recommendation_carousel.dart';
import 'package:shopp_app/views/widgets/write_review_dialog.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Product _currentProduct;
  bool _isLoadingDetails = false;
  bool _isAddingToCart = false;

  @override
  void initState() {
    super.initState();
    _currentProduct = widget.product;
    _fetchFreshDetails();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final reviewProvider =
            Provider.of<ReviewProvider?>(context, listen: false);
        if (reviewProvider != null) {
          reviewProvider.loadProductReviews(_currentProduct.id);
          final user =
              Provider.of<UserProvider?>(context, listen: false)?.currentUser;
          if (user != null) {
            reviewProvider.checkEligibility(_currentProduct.id);
          }
        }

        final recProvider =
            Provider.of<RecommendationProvider?>(context, listen: false);
        if (recProvider != null) {
          recProvider.fetchSimilarProducts(_currentProduct.id);
          recProvider.fetchFrequentlyBoughtTogether(_currentProduct.id);
          recProvider.recordInteraction(
            eventType: 'VIEW_PRODUCT',
            productId: _currentProduct.id,
            categoryId: _currentProduct.categoryId,
          );
        }
      } catch (_) {}
    });
  }

  void _fetchFreshDetails() async {
    setState(() {
      _isLoadingDetails = true;
    });

    final repo = CatalogRepository();
    final response = await repo.getProductById(_currentProduct.id);

    if (mounted) {
      if (response.status && response.data is Product) {
        setState(() {
          _currentProduct = response.data as Product;
          _isLoadingDetails = false;
        });
      } else {
        setState(() {
          _isLoadingDetails = false;
        });
      }
    }
  }

  void _handleAddToCart() async {
    setState(() {
      _isAddingToCart = true;
    });

    final cartProvider = context.read<CartProvider>();
    final success = await cartProvider.addToCart(_currentProduct);

    if (mounted) {
      setState(() {
        _isAddingToCart = false;
      });

      if (success) {
        try {
          context.read<RecommendationProvider>().recordInteraction(
            eventType: 'ADD_TO_CART',
            productId: _currentProduct.id,
            categoryId: _currentProduct.categoryId,
          );
        } catch (_) {}

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${_currentProduct.productName} added to cart!'),
            backgroundColor: AppColors.slate900,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'View Cart',
              textColor: AppColors.primaryLight,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              cartProvider.errorMessage ?? 'Could not add product to cart',
            ),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final inStock = _currentProduct.stock > 0;
    final wishlistProvider = context.watch<WishlistProvider>();
    final cartProvider = context.watch<CartProvider>();
    final isWishlisted = wishlistProvider.isInWishlist(_currentProduct.id);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.slate800),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _currentProduct.productName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.headingSmall,
        ),
        bottom: _isLoadingDetails
            ? const PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: LinearProgressIndicator(
                  minHeight: 2,
                  backgroundColor: AppColors.slate100,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              )
            : null,
        actions: [
          IconButton(
            icon: Icon(
              isWishlisted
                  ? Icons.favorite_rounded
                  : Icons.favorite_border,
              color: isWishlisted ? AppColors.error : AppColors.slate700,
            ),
            tooltip: 'Wishlist',
            onPressed: () {
              final wasWishlisted = isWishlisted;
              wishlistProvider.toggleWishlist(_currentProduct);
              try {
                context.read<RecommendationProvider>().recordInteraction(
                  eventType: wasWishlisted ? 'WISHLIST_REMOVE' : 'WISHLIST_ADD',
                  productId: _currentProduct.id,
                  categoryId: _currentProduct.categoryId,
                );
              } catch (_) {}
            },
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: AppColors.slate700),
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
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image Container with border
            Container(
              height: 340,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.slate100,
                border: Border(
                  bottom: BorderSide(color: AppColors.slate200, width: 1),
                ),
              ),
              child: _currentProduct.productImage.isNotEmpty
                  ? Image.network(
                      _currentProduct.productImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 64,
                          color: AppColors.slate400,
                        ),
                      ),
                    )
                  : const Center(
                      child: Icon(
                        Icons.inventory_2_outlined,
                        size: 64,
                        color: AppColors.slate400,
                      ),
                    ),
            ),

            // Product Details Content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Badge & Rating Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: const BoxDecoration(
                          color: AppColors.primary50,
                          borderRadius: AppRadius.borderFull,
                        ),
                        child: Text(
                          (_currentProduct.categoryName ?? 'Store').toUpperCase(),
                          style: AppTypography.label.copyWith(
                            color: AppColors.primary,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                      if (_currentProduct.productRating > 0)
                        Row(
                          children: [
                            const Icon(Icons.star_rounded, size: 18, color: AppColors.accent),
                            const SizedBox(width: 4),
                            Text(
                              _currentProduct.productRating.toStringAsFixed(1),
                              style: AppTypography.bodySmall.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.slate800,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(${_currentProduct.totalReviews} reviews)',
                              style: AppTypography.caption.copyWith(color: AppColors.slate500),
                            ),
                          ],
                        ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Product Title
                  Text(
                    _currentProduct.productName,
                    style: AppTypography.displayMedium,
                  ),

                  const SizedBox(height: 8),

                  // Seller Info Row
                  Row(
                    children: [
                      const Icon(Icons.storefront_rounded, size: 16, color: AppColors.slate400),
                      const SizedBox(width: 6),
                      Text(
                        'Sold by ${_currentProduct.sellerName}',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.slate600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Divider(color: AppColors.slate200),
                  const SizedBox(height: 16),

                  // Price & Stock Banner
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: AppTypography.caption.copyWith(color: AppColors.slate500),
                          ),
                          Text(
                            '\$${_currentProduct.price.toStringAsFixed(2)}',
                            style: AppTypography.priceHero,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: inStock ? AppColors.successLight : AppColors.errorLight,
                          borderRadius: AppRadius.borderFull,
                          border: Border.all(
                            color: inStock ? AppColors.success : AppColors.error,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              inStock ? Icons.check_circle_outline : Icons.cancel_outlined,
                              size: 14,
                              color: inStock ? AppColors.success : AppColors.error,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              inStock ? '${_currentProduct.stock} in stock' : 'Out of stock',
                              style: AppTypography.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: inStock ? AppColors.success : AppColors.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Description Section
                  const Text('About this product', style: AppTypography.headingSmall),
                  const SizedBox(height: 8),
                  Text(
                    _currentProduct.description.isNotEmpty
                        ? _currentProduct.description
                        : 'No additional description provided.',
                    style: AppTypography.bodyLarge.copyWith(height: 1.6),
                  ),

                  const SizedBox(height: 24),
                  const Divider(color: AppColors.slate200),
                  const SizedBox(height: 20),

                  // AI Recommendations: Frequently Bought Together
                  Consumer<RecommendationProvider>(
                    builder: (context, recProvider, _) {
                      final fbt = recProvider.getFbtForProduct(_currentProduct.id);
                      if (fbt.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return RecommendationCarousel(
                        title: 'Frequently Bought Together',
                        subtitle: recProvider.getFbtReason(_currentProduct.id),
                        items: fbt,
                      );
                    },
                  ),

                  // AI Recommendations: Similar Products
                  Consumer<RecommendationProvider>(
                    builder: (context, recProvider, _) {
                      final similar = recProvider.getSimilarForProduct(_currentProduct.id);
                      if (similar.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return RecommendationCarousel(
                        title: 'Similar Alternatives',
                        subtitle: recProvider.getSimilarReason(_currentProduct.id),
                        items: similar,
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                  const Divider(color: AppColors.slate200),
                  const SizedBox(height: 20),

                  // Customer Reviews Section
                  _buildReviewsSection(context),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
      // Sticky Bottom Action Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: AppShadows.bottomBar,
          border: Border(
            top: BorderSide(color: AppColors.slate200, width: 1),
          ),
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: AppTypography.caption.copyWith(color: AppColors.slate500),
                ),
                Text(
                  '\$${_currentProduct.price.toStringAsFixed(2)}',
                  style: AppTypography.priceCard.copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: AppButton(
                label: inStock ? 'Add to Cart' : 'Out of Stock',
                icon: Icons.add_shopping_cart_rounded,
                isLoading: _isAddingToCart,
                isFullWidth: true,
                onPressed: inStock && !_isAddingToCart ? _handleAddToCart : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsSection(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider?>(context);
    final eligibility = reviewProvider?.eligibility;
    final reviews = reviewProvider?.reviews ?? [];
    final avg = _currentProduct.productRating;
    final total = _currentProduct.totalReviews;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Customer Reviews', style: AppTypography.headingSmall),
            if (eligibility?.canReview == true)
              TextButton.icon(
                icon: const Icon(Icons.rate_review_outlined, size: 16),
                label: const Text('Write Review'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => WriteReviewDialog(
                      productId: _currentProduct.id,
                      productName: _currentProduct.productName,
                    ),
                  );
                },
              ),
          ],
        ),
        const SizedBox(height: 12),

        // Rating Overview Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.slate50,
            borderRadius: AppRadius.borderMd,
            border: Border.all(color: AppColors.slate200),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    avg.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: AppColors.slate900,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < avg.round() ? Icons.star_rounded : Icons.star_outline_rounded,
                        size: 16,
                        color: AppColors.accent,
                      );
                    }),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$total ratings',
                    style: AppTypography.caption.copyWith(color: AppColors.slate500),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verified Purchases',
                      style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Real feedback from confirmed Shoppy customers.',
                      style: AppTypography.caption.copyWith(color: AppColors.slate500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Reviews List
        if (reviewProvider?.isLoadingReviews == true && reviews.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
          )
        else if (reviews.isEmpty)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.slate50,
              borderRadius: AppRadius.borderMd,
              border: Border.all(color: AppColors.slate200),
            ),
            child: Center(
              child: Text(
                'No customer reviews yet. Be the first verified buyer to review!',
                textAlign: TextAlign.center,
                style: AppTypography.bodySmall.copyWith(color: AppColors.slate500),
              ),
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: reviews.length,
            separatorBuilder: (_, __) => const Divider(color: AppColors.slate200, height: 24),
            itemBuilder: (context, index) {
              final rev = reviews[index];
              return _buildReviewCard(context, rev);
            },
          ),
      ],
    );
  }

  Widget _buildReviewCard(BuildContext context, ReviewModel rev) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColors.primary50,
                  child: Text(
                    rev.userName.isNotEmpty ? rev.userName[0].toUpperCase() : 'U',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  rev.userName,
                  style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold),
                ),
                if (rev.verifiedPurchase) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: const BoxDecoration(
                      color: AppColors.successLight,
                      borderRadius: AppRadius.borderFull,
                    ),
                    child: Text(
                      '✓ Verified',
                      style: AppTypography.label.copyWith(color: AppColors.success),
                    ),
                  ),
                ],
              ],
            ),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rev.rating ? Icons.star_rounded : Icons.star_outline_rounded,
                  size: 14,
                  color: AppColors.accent,
                );
              }),
            ),
          ],
        ),
        if (rev.title.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            rev.title,
            style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
        const SizedBox(height: 4),
        Text(
          rev.comment,
          style: AppTypography.bodySmall.copyWith(color: AppColors.slate700),
        ),
      ],
    );
  }
}
