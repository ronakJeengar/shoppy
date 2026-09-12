import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_names.dart';
import '../../../../core/icons/app_icon.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../coupons/presentation/widgets/coupon_bottom_sheet.dart';
import '../../domain/entities/campaign_entity.dart';

class CampaignCard extends StatelessWidget {
  final CampaignEntity campaign;
  final VoidCallback? onTap;
  final double? height;

  const CampaignCard({
    super.key,
    required this.campaign,
    this.onTap,
    this.height = 168.0,
  });

  void _handleNavigation(BuildContext context) {
    if (onTap != null) {
      onTap!();
      return;
    }

    final actionType = (campaign.ctaAction?.type ?? campaign.targetType).toUpperCase();
    final actionValue = campaign.ctaAction?.value ?? campaign.targetId;

    switch (actionType) {
      case 'HOME':
        context.go(RouteNames.home);
        break;
      case 'CATEGORY':
        if (actionValue.isNotEmpty) {
          context.push('${RouteNames.search}?q=${Uri.encodeComponent(actionValue)}');
        } else {
          context.go(RouteNames.home);
        }
        break;
      case 'PRODUCT':
        if (actionValue.isNotEmpty) {
          context.push(RouteNames.productDetail(actionValue));
        }
        break;
      case 'SEARCH':
        context.push(
          actionValue.isNotEmpty
              ? '${RouteNames.search}?q=${Uri.encodeComponent(actionValue)}'
              : RouteNames.search,
        );
        break;
      case 'COUPON':
        CouponBottomSheet.show(
          context,
          currentlyAppliedCode: actionValue.isNotEmpty ? actionValue : campaign.couponCode,
          onSelectCoupon: (code) {
            context.push(RouteNames.cart);
          },
        );
        break;
      case 'COLLECTION':
        context.go(RouteNames.home);
        break;
      default:
        // Safely ignore unknown/unsupported remote CTA actions
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final metadata = campaign.metadata;
    final tag = metadata['tag']?.toString() ?? campaign.campaignType;
    final bgGradientName = metadata['bgGradient']?.toString();

    Gradient fallbackGradient;
    if (bgGradientName == 'amber') {
      fallbackGradient = const LinearGradient(
        colors: [Color(0xFF78350F), Color(0xFFB45309)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (bgGradientName == 'slate') {
      fallbackGradient = const LinearGradient(
        colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else {
      fallbackGradient = AppColors.primaryGradient;
    }

    return Semantics(
      label: '${campaign.title}. ${campaign.subtitle}. Tap to ${campaign.ctaLabel}',
      button: true,
      child: GestureDetector(
        onTap: () => _handleNavigation(context),
        child: Container(
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            gradient: fallbackGradient,
            borderRadius: AppRadius.borderLg,
            boxShadow: AppShadows.card,
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Background Image with Lazy Caching
              if (campaign.bannerImage.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: campaign.bannerImage,
                  fit: BoxFit.cover,
                  memCacheWidth: 800,
                  memCacheHeight: 400,
                  placeholder: (context, url) => Container(
                    decoration: BoxDecoration(gradient: fallbackGradient),
                  ),
                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(gradient: fallbackGradient),
                  ),
                ),

              // 2. High-Contrast Legibility Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.82),
                      Colors.black.withValues(alpha: 0.45),
                      Colors.black.withValues(alpha: 0.70),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),

              // 3. Campaign Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Row: Tag badge + Optional Coupon Pill
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.22),
                            borderRadius: AppRadius.borderFull,
                          ),
                          child: Text(
                            tag.toUpperCase(),
                            style: AppTypography.label.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        if (campaign.couponCode != null &&
                            campaign.couponCode!.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.warningLight.withValues(alpha: 0.25),
                              borderRadius: AppRadius.borderFull,
                              border: Border.all(
                                color: AppColors.warningLight.withValues(alpha: 0.5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const AppIcon(
                                  AppIcons.coupon,
                                  size: 11,
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  campaign.couponCode!,
                                  style: AppTypography.label.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),

                    // Middle: Title and Subtitle
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          campaign.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.headingMedium.copyWith(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                          ),
                        ),
                        if (campaign.subtitle.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            campaign.subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.white.withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ],
                    ),

                    // Bottom: Call to Action button
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: AppRadius.borderFull,
                            boxShadow: AppShadows.card,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                campaign.ctaLabel,
                                style: AppTypography.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.slate900,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const AppIcon(
                                AppIcons.arrowForward,
                                color: AppColors.slate900,
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
