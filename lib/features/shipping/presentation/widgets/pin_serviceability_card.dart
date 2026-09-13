import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/constants/app_icon_sizes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_icon.dart';
import '../providers/shipping_providers.dart';

/// A card widget that checks Indian PIN code delivery serviceability
/// and displays real-time delivery estimates, express availability, and COD status.
class PinServiceabilityCard extends ConsumerStatefulWidget {
  final String? initialPinCode;
  final bool compact;
  final ValueChanged<String>? onPinVerified;

  const PinServiceabilityCard({
    super.key,
    this.initialPinCode,
    this.compact = false,
    this.onPinVerified,
  });

  @override
  ConsumerState<PinServiceabilityCard> createState() => _PinServiceabilityCardState();
}

class _PinServiceabilityCardState extends ConsumerState<PinServiceabilityCard> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialPinCode ?? ref.read(selectedPinCodeProvider) ?? '';
    _controller = TextEditingController(text: initial);
    if (initial.length == 6) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _triggerCheck(initial);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _triggerCheck(String pin) {
    ref.read(pinServiceabilityNotifierProvider.notifier).check(pin).then((_) {
      final state = ref.read(pinServiceabilityNotifierProvider);
      if (state.result?.serviceable == true && widget.onPinVerified != null) {
        widget.onPinVerified!(pin);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pinServiceabilityNotifierProvider);
    final result = state.result;

    return Container(
      padding: EdgeInsets.all(widget.compact ? 12 : 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.borderMd,
        border: Border.all(color: AppColors.slate200),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: AppRadius.borderSm,
                ),
                child: const Center(
                  child: AppIcon(
                    AppIcons.deliveryTruck,
                    color: AppColors.primary,
                    size: AppIconSizes.action,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Serviceability',
                      style: widget.compact ? AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold) : AppTypography.headingSmall,
                    ),
                    Text(
                      'Check delivery speed & options for your area',
                      style: AppTypography.caption.copyWith(color: AppColors.slate500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // PIN Input Row
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.slate50,
                    borderRadius: AppRadius.borderSm,
                    border: Border.all(
                      color: state.error != null ? AppColors.error : AppColors.slate300,
                    ),
                  ),
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter 6-digit PIN code',
                      hintStyle: AppTypography.bodySmall.copyWith(color: AppColors.slate400),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: AppIcon(
                          AppIcons.location,
                          color: AppColors.slate400,
                          size: AppIconSizes.medium,
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onSubmitted: (val) {
                      if (val.trim().length == 6) _triggerCheck(val);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 44,
                child: AppButton(
                  label: 'Check',
                  isLoading: state.isLoading,
                  onPressed: () {
                    final pin = _controller.text.trim();
                    if (pin.isNotEmpty) _triggerCheck(pin);
                  },
                ),
              ),
            ],
          ),

          // Error banner
          if (state.error != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.08),
                borderRadius: AppRadius.borderSm,
                border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const AppIcon(AppIcons.errorOutline, color: AppColors.error, size: AppIconSizes.action),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      state.error!,
                      style: AppTypography.caption.copyWith(color: AppColors.error),
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Serviceability Result
          if (result != null && state.error == null) ...[
            const SizedBox(height: 12),
            if (result.serviceable) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.06),
                  borderRadius: AppRadius.borderSm,
                  border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const AppIcon(AppIcons.checkCircle, color: AppColors.success, size: AppIconSizes.action),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Delivery available to ${result.city.isNotEmpty ? '${result.city}, ' : ''}${result.state} (${result.pinCode})',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.slate900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Standard delivery
                    if (result.delivery?.standard?.available == true) ...[
                      Row(
                        children: [
                          const AppIcon(AppIcons.deliveryTruck, color: AppColors.primary, size: AppIconSizes.small),
                          const SizedBox(width: 6),
                          Text(
                            'Standard Delivery: ${result.delivery!.standard!.formattedWindow.isNotEmpty ? result.delivery!.standard!.formattedWindow : '${result.delivery!.standard!.minDays}–${result.delivery!.standard!.maxDays} business days'}',
                            style: AppTypography.caption.copyWith(color: AppColors.slate700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                    // Express delivery
                    if (result.delivery?.express?.available == true) ...[
                      Row(
                        children: [
                          const AppIcon(AppIcons.flash, color: Color(0xFFD97706), size: AppIconSizes.small),
                          const SizedBox(width: 6),
                          Text(
                            'Express Delivery: ${result.delivery!.express!.formattedWindow.isNotEmpty ? result.delivery!.express!.formattedWindow : '${result.delivery!.express!.minDays}–${result.delivery!.express!.maxDays} business days'}',
                            style: AppTypography.caption.copyWith(
                              color: const Color(0xFFB45309),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ] else ...[
                      Row(
                        children: [
                          const AppIcon(AppIcons.info, color: AppColors.slate400, size: AppIconSizes.small),
                          const SizedBox(width: 6),
                          Text(
                            'Express delivery not available in this zone',
                            style: AppTypography.caption.copyWith(color: AppColors.slate500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                    // COD status
                    Row(
                      children: [
                        AppIcon(
                          result.codAvailable ? AppIcons.cash : AppIcons.creditCard,
                          color: result.codAvailable ? AppColors.success : AppColors.slate500,
                          size: AppIconSizes.small,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          result.codAvailable ? 'Cash on Delivery (COD) eligible' : 'Prepaid payment only for this location',
                          style: AppTypography.caption.copyWith(
                            color: result.codAvailable ? AppColors.slate700 : AppColors.slate500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.08),
                  borderRadius: AppRadius.borderSm,
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppIcon(AppIcons.locationOff, color: AppColors.error, size: AppIconSizes.action),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Service Unavailable to PIN ${result.pinCode}',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.error,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            result.message ?? 'Delivery is currently not supported for this PIN code. We are expanding to more areas soon!',
                            style: AppTypography.caption.copyWith(color: AppColors.slate600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
