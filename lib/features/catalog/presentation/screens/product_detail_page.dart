import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/data/models/review_model.dart';
import 'package:shopp_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:shopp_app/features/catalog/data/mappers/catalog_mappers.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';
import 'package:shopp_app/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:shopp_app/features/config/presentation/providers/app_config_providers.dart';
import 'package:shopp_app/features/recommendations/presentation/providers/recommendation_providers.dart';
import 'package:shopp_app/features/reviews/domain/entities/review_entity.dart';
import 'package:shopp_app/features/reviews/presentation/providers/review_providers.dart';
import 'package:shopp_app/features/wishlist/presentation/providers/wishlist_providers.dart';
import 'package:shopp_app/features/cart/presentation/screens/cart_page.dart';
import 'package:shopp_app/core/widgets/app_button.dart';
import '../widgets/product_media_gallery.dart';
import 'package:shopp_app/features/recommendations/presentation/widgets/recommendation_carousel.dart';
import 'package:shopp_app/features/reviews/presentation/widgets/write_review_dialog.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final ProductEntity? product;
  final String? productId;

  const ProductDetailPage({
    super.key,
    this.product,
    this.productId,
  }) : assert(product != null || productId != null,
            'Either product or productId must be provided');

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  late ProductEntity _currentProduct;
  bool _isAddingToCart = false;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _currentProduct = widget.product!;
    } else {
      _currentProduct = ProductEntity(
        id: widget.productId!,
        productName: 'Loading...',
        price: 0,
        productImage: '',
      );
    }
  }

  void _handleAddToCart() async {
    setState(() {
      _isAddingToCart = true;
    });

    await ref.read(cartNotifierProvider.notifier).addToCart(_currentProduct.id, quantity: 1);

    if (mounted) {
      setState(() {
        _isAddingToCart = false;
      });

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
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch detail provider for live updates
    final detailAsync = ref.watch(productDetailProvider(_currentProduct.id));
    detailAsync.whenData((updated) {
      _currentProduct = updated;
    });

    final featureFlags = ref.watch(featureFlagsProvider);
    final inStock = _currentProduct.stock > 0;
    final isWishlisted = ref.watch(isWishlistedProvider(_currentProduct.id));
    final cartCount = ref.watch(cartItemCountProvider);
    final reviewsResult = ref.watch(productReviewsProvider(_currentProduct.id)).valueOrNull;
    final fbtAsync = ref.watch(frequentlyBoughtTogetherProvider(_currentProduct.id)).valueOrNull;
    final fbtItems = fbtAsync?.items ?? [];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const AppIcon(AppIcons.back, color: AppColors.slate800),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _currentProduct.productName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.headingSmall,
        ),
        bottom: detailAsync.isLoading
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
          if (featureFlags.wishlist)
            IconButton(
              icon: AppIcon(
                isWishlisted
                    ? AppIcons.wishlistFilled
                    : AppIcons.wishlist,
                color: isWishlisted ? AppColors.error : AppColors.slate700,
                size: AppIconSizes.lg,
              ),
              tooltip: AppStrings.nav.wishlist,
              onPressed: () {
                ref.read(wishlistNotifierProvider.notifier).toggle(_currentProduct);
              },
            ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const AppIcon(AppIcons.cart, color: AppColors.slate700, size: AppIconSizes.lg),
                tooltip: AppStrings.nav.cart,
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
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Media Gallery Header
            ProductMediaGallery(
              product: _currentProduct.toModel(),
              height: 360,
              enableVideo: featureFlags.productVideo,
              enable3d: featureFlags.product3D,
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category & Rating Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentProduct.categoryName != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: const BoxDecoration(
                            color: AppColors.slate100,
                            borderRadius: AppRadius.borderFull,
                          ),
                          child: Text(
                            _currentProduct.categoryName!,
                            style: AppTypography.caption.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.slate700,
                            ),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      Row(
                        children: [
                          const AppIcon(AppIcons.star, color: AppColors.accent, size: AppIconSizes.medium),
                          const SizedBox(width: 4),
                          Text(
                            _currentProduct.productRating.toStringAsFixed(1),
                            style: AppTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.slate800,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${_currentProduct.totalReviews})',
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
                    style: AppTypography.headingLarge,
                  ),

                  const SizedBox(height: 6),

                  // Seller Info
                  Text(
                    'Sold by ${_currentProduct.sellerName}',
                    style: AppTypography.caption.copyWith(color: AppColors.slate500),
                  ),

                  const SizedBox(height: 16),

                  // Price & Stock Urgency Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price', style: AppTypography.caption.copyWith(color: AppColors.slate500)),
                          const SizedBox(height: 2),
                          Text(
                            '\$${_currentProduct.price.toStringAsFixed(2)}',
                            style: AppTypography.priceHero,
                          ),
                        ],
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

                  if (featureFlags.recommendations && fbtItems.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    const Divider(color: AppColors.slate200),
                    const SizedBox(height: 20),
                    RecommendationCarousel(
                      title: 'Frequently Bought Together',
                      subtitle: 'Popular combinations picked by customers',
                      items: fbtItems,
                    ),
                  ],

                  if (featureFlags.reviews) ...[
                    const SizedBox(height: 24),
                    const Divider(color: AppColors.slate200),
                    const SizedBox(height: 20),

                    // Customer Reviews Section
                    _buildReviewsSection(context, reviewsResult),
                  ],

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
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: AppButton(
          label: inStock ? AppStrings.product.addToCart : AppStrings.product.outOfStock,
          isLoading: _isAddingToCart,
          onPressed: inStock ? _handleAddToCart : null,
          icon: inStock ? AppIcons.bag : null,
        ),
      ),
    );
  }

  Widget _buildReviewsSection(BuildContext context, ProductReviewsResult? reviewsResult) {
    final reviews = reviewsResult?.reviews ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.product.reviews, style: AppTypography.headingSmall),
            TextButton.icon(
              icon: const AppIcon(AppIcons.rateReview, size: AppIconSizes.button),
              label: Text(AppStrings.reviews.writeReview),
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

        // Reviews List
        if (reviews.isEmpty)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.slate50,
              borderRadius: AppRadius.borderMd,
              border: Border.all(color: AppColors.slate200),
            ),
            child: Center(
              child: Text(
                AppStrings.reviews.noReviews,
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
                    style: AppTypography.caption.copyWith(
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppIcon(
                          AppIcons.verified,
                          size: AppIconSizes.xs,
                          color: AppColors.success,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Verified',
                          style: AppTypography.label.copyWith(color: AppColors.success),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
            Row(
              children: List.generate(5, (index) {
                return AppIcon(
                  index < rev.rating ? AppIcons.star : AppIcons.starEmpty,
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
