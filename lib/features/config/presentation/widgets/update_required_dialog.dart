import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_icon_sizes.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_icon.dart';

class UpdateRequiredDialog extends StatelessWidget {
  final String minimumVersion;
  final String updateUrl;

  const UpdateRequiredDialog({
    super.key,
    required this.minimumVersion,
    required this.updateUrl,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderLg),
        backgroundColor: AppColors.surface,
        insetPadding: const EdgeInsets.symmetric(horizontal: AppDimensions.xl),
        child: Padding(
          padding: AppDimensions.paddingXl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: AppColors.primary50,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: AppIcon(
                    AppIcons.systemUpdate,
                    size: AppIconSizes.xl,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.lg),
              const Text(
                'Update Required',
                style: AppTypography.headingMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.sm),
              Text(
                'A new version of Shoppy ($minimumVersion or newer) is required to continue. Please update to enjoy the latest features and security improvements.',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.xl),
              AppButton(
                label: 'Update Now',
                icon: AppIcons.openInNew,
                isFullWidth: true,
                onPressed: () {
                  // In production, opens launchUrlString(updateUrl)
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
