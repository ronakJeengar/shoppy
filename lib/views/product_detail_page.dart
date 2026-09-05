import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/models/review_model.dart';
import 'package:shopp_app/data/repositories/catalog_repository.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/providers/recommendation_provider.dart';
import 'package:shopp_app/providers/review_provider.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/providers/wishlist_provider.dart';
import 'package:shopp_app/views/cart_page.dart';
import 'package:shopp_app/views/login_page.dart';
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
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'View Cart',
              textColor: Colors.white,
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
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inStock = _currentProduct.stock > 0;
    final wishlistProvider = context.watch<WishlistProvider>();
    final cartProvider = context.watch<CartProvider>();
    final isWishlisted = wishlistProvider.isInWishlist(_currentProduct.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentProduct.productName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        bottom: _isLoadingDetails
            ? const PreferredSize(
                preferredSize: Size.fromHeight(3),
                child: LinearProgressIndicator(minHeight: 3),
              )
            : null,
        actions: [
          // Wishlist Action
          IconButton(
            icon: Icon(
              isWishlisted ? Icons.favorite : Icons.favorite_border,
              color: isWishlisted ? Colors.red : null,
            ),
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
          // Cart Action with Live Count Badge
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
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image Container
            Container(
              height: 320,
              width: double.infinity,
              color: Colors.grey.shade100,
              child: _currentProduct.productImage.isNotEmpty
                  ? Image.network(
                      _currentProduct.productImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    )
                  : Center(
                      child: Icon(
                        Icons.inventory_2_outlined,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
                    ),
            ),

            // Product Details Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category & Rating Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentProduct.categoryName != null)
                        Chip(
                          label: Text(
                            _currentProduct.categoryName!.toUpperCase(),
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor,
                            ),
                          ),
                          backgroundColor: theme.primaryColor.withValues(alpha: 0.08),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        )
                      else
                        const SizedBox.shrink(),
                      if (_currentProduct.productRating > 0)
                        Row(
                          children: [
                            const Icon(Icons.star,
                                size: 18, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              _currentProduct.productRating.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '(Verified Reviews)',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Product Title
                  Text(
                    _currentProduct.productName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Seller Info
                  Row(
                    children: [
                      Icon(Icons.storefront,
                          size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 6),
                      Text(
                        'Sold by ${_currentProduct.sellerName}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 12),

                  // Stock Availability Banner
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: inStock
                          ? Colors.green.shade50
                          : Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: inStock
                            ? Colors.green.shade200
                            : Colors.red.shade200,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          inStock
                              ? Icons.check_circle_outline
                              : Icons.cancel_outlined,
                          size: 16,
                          color: inStock ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          inStock
                              ? 'In Stock (${_currentProduct.stock} items available)'
                              : 'Currently Out of Stock',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: inStock
                                ? Colors.green.shade800
                                : Colors.red.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Description
                  const Text(
                    'About this item',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currentProduct.description.isNotEmpty
                        ? _currentProduct.description
                        : 'No detailed description provided for this product.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      height: 1.5,
                    ),
                  ),

                  // Frequently Bought Together Carousel
                  _buildFrequentlyBoughtTogether(context),

                  // Similar Products Carousel
                  _buildSimilarProducts(context),

                  // Customer Reviews & Ratings
                  _buildReviewsSection(context),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              offset: const Offset(0, -2),
              blurRadius: 10,
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Price',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      '\$${_currentProduct.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: _isAddingToCart
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.add_shopping_cart, size: 20),
                  label: Text(
                    inStock ? 'Add to Cart' : 'Out of Stock',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: inStock && !_isAddingToCart
                      ? _handleAddToCart
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingBar(int stars, int count, int total) {
    final double pct = total > 0 ? (count / total).clamp(0.0, 1.0) : 0.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text('$stars★',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(width: 6),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: pct,
                minHeight: 6,
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
            ),
          ),
          const SizedBox(width: 6),
          SizedBox(
            width: 24,
            child: Text(
              '$count',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWriteReviewCTA(
    BuildContext context,
    dynamic user,
    ReviewEligibilityModel? eligibility,
    ReviewModel? userReview,
  ) {
    if (user == null) {
      return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(42),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        icon: const Icon(Icons.login, size: 18),
        label: const Text('Sign in to review this product'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        },
      );
    }

    if (eligibility?.hasReviewed == true || userReview != null) {
      return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(42),
          foregroundColor: Colors.blue,
          side: const BorderSide(color: Colors.blue),
        ),
        icon: const Icon(Icons.edit_note, size: 20),
        label: const Text('Edit Your Review'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => WriteReviewDialog(
              productId: _currentProduct.id,
              productName: _currentProduct.productName,
              existingReview: userReview,
            ),
          );
        },
      );
    }

    if (eligibility?.canReview == true) {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(42),
          backgroundColor: Colors.amber.shade700,
          foregroundColor: Colors.white,
        ),
        icon: const Icon(Icons.rate_review_outlined, size: 18),
        label: const Text('Write a Customer Review'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => WriteReviewDialog(
              productId: _currentProduct.id,
              productName: _currentProduct.productName,
            ),
          );
        },
      );
    }

    // Not eligible yet
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.verified_user_outlined,
              size: 16, color: Colors.grey.shade600),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Only verified buyers who received this item can write a review.',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(BuildContext context, ReviewModel rev) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Author, verified badge, and owner actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue.shade100,
                      child: Text(
                        rev.authorName.isNotEmpty ? rev.authorName[0] : 'U',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      rev.authorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    if (rev.verifiedPurchase) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '✓ Verified',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                if (rev.isOwner)
                  PopupMenuButton<String>(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.more_vert, size: 18),
                    onSelected: (val) {
                      if (val == 'edit') {
                        showDialog(
                          context: context,
                          builder: (_) => WriteReviewDialog(
                            productId: _currentProduct.id,
                            productName: _currentProduct.productName,
                            existingReview: rev,
                          ),
                        );
                      } else if (val == 'delete') {
                        _showDeleteReviewDialog(context, rev.id);
                      }
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit Review'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete Review',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 6),

            // Rating Stars
            Row(
              children: [
                ...List.generate(5, (starIdx) {
                  return Icon(
                    starIdx < rev.rating ? Icons.star : Icons.star_border,
                    size: 15,
                    color: Colors.amber,
                  );
                }),
                const SizedBox(width: 8),
                Text(
                  '${rev.createdAt.day}/${rev.createdAt.month}/${rev.createdAt.year}',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Title
            if (rev.title.isNotEmpty) ...[
              Text(
                rev.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
            ],

            // Comment text
            Text(
              rev.comment,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade800,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteReviewDialog(BuildContext context, String reviewId) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Delete Review'),
        content: const Text(
          'Are you sure you want to delete your review? This cannot be undone.',
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
              final success = await context
                  .read<ReviewProvider>()
                  .deleteReview(reviewId, _currentProduct.id);
              if (context.mounted && success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Review deleted successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Widget _buildFrequentlyBoughtTogether(BuildContext context) {
    RecommendationProvider? recProv;
    try {
      recProv = Provider.of<RecommendationProvider?>(context, listen: true);
    } catch (_) {}

    if (recProv == null) return const SizedBox.shrink();

    final fbtItems = recProv.getFbtForProduct(_currentProduct.id);
    if (fbtItems.isEmpty && !recProv.isLoadingFbt) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecommendationCarousel(
          title: 'Frequently Bought Together',
          subtitle: recProv.getFbtReason(_currentProduct.id),
          items: fbtItems,
          isLoading: recProv.isLoadingFbt,
          onRefresh: () =>
              recProv!.fetchFrequentlyBoughtTogether(_currentProduct.id),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSimilarProducts(BuildContext context) {
    RecommendationProvider? recProv;
    try {
      recProv = Provider.of<RecommendationProvider?>(context, listen: true);
    } catch (_) {}

    if (recProv == null) return const SizedBox.shrink();

    final similarItems = recProv.getSimilarForProduct(_currentProduct.id);
    if (similarItems.isEmpty && !recProv.isLoadingSimilar) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecommendationCarousel(
          title: 'Similar Products',
          subtitle: recProv.getSimilarReason(_currentProduct.id),
          items: similarItems,
          isLoading: recProv.isLoadingSimilar,
          onRefresh: () =>
              recProv!.fetchSimilarProducts(_currentProduct.id),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildReviewsSection(BuildContext context) {
    ReviewProvider? reviewProvider;
    try {
      reviewProvider = Provider.of<ReviewProvider?>(context, listen: true);
    } catch (_) {}

    dynamic user;
    try {
      user = Provider.of<UserProvider?>(context, listen: true)?.currentUser;
    } catch (_) {}

    final summary = reviewProvider?.summary;
    final eligibility = reviewProvider?.eligibility;
    final reviews = reviewProvider?.reviews ?? [];

    final avg = summary?.averageRating ?? _currentProduct.productRating;
    final total = summary?.totalReviews ?? 0;
    final distribution =
        summary?.ratingDistribution ?? {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};

    ReviewModel? userReview;
    try {
      userReview = reviews.firstWhere((r) => r.isOwner);
    } catch (_) {}

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Customer Reviews',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (total > 0)
              Text(
                '$total ${total == 1 ? 'review' : 'reviews'}',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
          ],
        ),
        const SizedBox(height: 12),

        // Summary Card
        Card(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Left: Big Score & Stars
                Column(
                  children: [
                    Text(
                      avg.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < avg.round() ? Icons.star : Icons.star_border,
                          size: 16,
                          color: Colors.amber,
                        );
                      }),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$total ratings',
                      style:
                          TextStyle(fontSize: 11, color: Colors.grey.shade600),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Container(
                  height: 60,
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(width: 16),

                // Right: 5 Distribution Bars
                Expanded(
                  child: Column(
                    children: [
                      _buildRatingBar(5, distribution[5] ?? 0, total),
                      _buildRatingBar(4, distribution[4] ?? 0, total),
                      _buildRatingBar(3, distribution[3] ?? 0, total),
                      _buildRatingBar(2, distribution[2] ?? 0, total),
                      _buildRatingBar(1, distribution[1] ?? 0, total),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Write Review CTA Banner
        _buildWriteReviewCTA(context, user, eligibility, userReview),
        const SizedBox(height: 16),

        // Filter by Rating Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ChoiceChip(
                label: const Text('All'),
                selected: reviewProvider?.selectedRatingFilter == null,
                onSelected: (_) {
                  reviewProvider?.loadProductReviews(_currentProduct.id,
                      rating: 0);
                },
              ),
              const SizedBox(width: 6),
              ...List.generate(5, (index) {
                final stars = 5 - index;
                final isSelected =
                    reviewProvider?.selectedRatingFilter == stars;
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: ChoiceChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('$stars'),
                        const SizedBox(width: 2),
                        const Icon(Icons.star, size: 14, color: Colors.amber),
                      ],
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      reviewProvider?.loadProductReviews(_currentProduct.id,
                          rating: stars);
                    },
                  ),
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Reviews List
        if (reviewProvider?.isLoadingReviews == true && reviews.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(),
            ),
          )
        else if (reviews.isEmpty)
          Card(
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  reviewProvider?.selectedRatingFilter != null
                      ? 'No ${reviewProvider!.selectedRatingFilter}-star reviews yet'
                      : 'No customer reviews yet. Be the first verified buyer to review!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ),
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: reviews.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final rev = reviews[index];
              return _buildReviewCard(context, rev);
            },
          ),
      ],
    );
  }
}
