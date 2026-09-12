import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/core/utils/currency_formatter.dart';
import 'package:shopp_app/features/coupons/presentation/widgets/coupon_bottom_sheet.dart';
import '../../domain/entities/cart_entity.dart';
import '../providers/cart_providers.dart';

class CouponSection extends ConsumerStatefulWidget {
  final CartEntity cart;

  const CouponSection({
    super.key,
    required this.cart,
  });

  @override
  ConsumerState<CouponSection> createState() => _CouponSectionState();
}

class _CouponSectionState extends ConsumerState<CouponSection> {
  late final TextEditingController _controller;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _applyCoupon(String code) async {
    final cleanCode = code.trim().toUpperCase();
    if (cleanCode.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final error = await ref
        .read(cartNotifierProvider.notifier)
        .applyCoupon(cleanCode);

    if (!mounted) return;

    setState(() {
      _isLoading = false;
      _errorMessage = error;
      if (error == null) {
        _controller.clear();
      }
    });
  }

  Future<void> _removeCoupon() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await ref.read(cartNotifierProvider.notifier).removeCoupon();

    if (!mounted) return;

    setState(() {
      _isLoading = false;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasCoupon = widget.cart.discount > 0 ||
        (widget.cart.couponCode != null && widget.cart.couponCode!.isNotEmpty);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.lg,
        vertical: AppDimensions.sm,
      ),
      padding: const EdgeInsets.all(AppDimensions.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.borderMd,
        border: Border.all(
          color: hasCoupon
              ? AppColors.success.withValues(alpha: 0.5)
              : AppColors.border,
        ),
        boxShadow: AppShadows.card,
      ),
      child: hasCoupon ? _buildAppliedView() : _buildInputView(),
    );
  }

  Widget _buildAppliedView() {
    final code = widget.cart.couponCode ??
        widget.cart.appliedCoupon?.code ??
        'COUPON';
    final savings = widget.cart.discount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const AppIcon(
                  AppIcons.checkCircle,
                  color: AppColors.success,
                  size: AppIconSizes.md,
                ),
                const SizedBox(width: 8),
                Text(
                  code,
                  style: AppTypography.labelLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.success,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.12),
                    borderRadius: AppRadius.borderSm,
                  ),
                  child: Text(
                    AppStrings.coupons.applied,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            if (_isLoading)
              const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.error),
                ),
              )
            else
              InkWell(
                onTap: _removeCoupon,
                borderRadius: AppRadius.borderSm,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppIcon(
                        AppIcons.close,
                        size: AppIconSizes.sm,
                        color: AppColors.error,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        AppStrings.coupons.remove,
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        if (savings > 0) ...[
          const SizedBox(height: 8),
          Text(
            'You save ${CurrencyFormatter.format(savings)} on this order!',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.slate700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInputView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const AppIcon(
                  AppIcons.coupon,
                  color: AppColors.primary,
                  size: AppIconSizes.action,
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.coupons.applyCoupon,
                  style: AppTypography.headingSmall,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                CouponBottomSheet.show(
                  context,
                  currentlyAppliedCode: widget.cart.couponCode,
                  onSelectCoupon: (selectedCode) {
                    _controller.text = selectedCode;
                    _applyCoupon(selectedCode);
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Text(
                      AppStrings.coupons.viewAvailable,
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 2),
                    const AppIcon(
                      AppIcons.chevronRight,
                      size: AppIconSizes.sm,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.sm),

        // Text field & Apply button
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 44,
                child: TextField(
                  controller: _controller,
                  textCapitalization: TextCapitalization.characters,
                  style: AppTypography.bodyMedium.copyWith(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: AppStrings.coupons.enterCouponCode,
                    hintStyle: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textMuted,
                      letterSpacing: 0,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    filled: true,
                    fillColor: AppColors.slate50,
                    border: const OutlineInputBorder(
                      borderRadius: AppRadius.borderSm,
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: AppRadius.borderSm,
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: AppRadius.borderSm,
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                  onSubmitted: (val) => _applyCoupon(val),
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () => _applyCoupon(_controller.text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadius.borderSm,
                  ),
                  elevation: 0,
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        AppStrings.coupons.apply,
                        style: AppTypography.labelMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
              ),
            ),
          ],
        ),

        // Error message if any
        if (_errorMessage != null) ...[
          const SizedBox(height: 6),
          Text(
            _errorMessage!,
            style: AppTypography.caption.copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
