import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/recommendation_model.dart';
import 'package:shopp_app/views/widgets/product_card.dart';
import 'package:shopp_app/views/widgets/skeleton_loader.dart';

class RecommendationCarousel extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<RecommendedProduct> items;
  final bool isLoading;
  final VoidCallback? onRefresh;

  const RecommendationCarousel({
    super.key,
    required this.title,
    this.subtitle,
    required this.items,
    this.isLoading = false,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SkeletonLoader(width: 180, height: 20),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 270,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: 3,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return const SizedBox(
                    width: 164,
                    child: ProductCardSkeleton(),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.auto_awesome,
                            size: 18,
                            color: AppColors.violet,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            title,
                            style: AppTypography.headingSmall,
                          ),
                        ],
                      ),
                      if (subtitle != null && subtitle!.isNotEmpty) ...[
                        const SizedBox(height: 3),
                        Text(
                          subtitle!,
                          style: AppTypography.caption.copyWith(
                            color: AppColors.slate500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                if (onRefresh != null)
                  IconButton(
                    icon: const Icon(Icons.refresh_rounded, size: 18, color: AppColors.slate500),
                    onPressed: onRefresh,
                    tooltip: 'Refresh',
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Product List Carousel
          SizedBox(
            height: 270,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final recItem = items[index];
                return SizedBox(
                  width: 164,
                  child: ProductCard(product: recItem.product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
