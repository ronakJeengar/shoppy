import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_icon_sizes.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../providers/app_config_providers.dart';

/// Full-screen view displayed when backend remote configuration enables maintenance mode.
class MaintenanceView extends ConsumerWidget {
  final String? customMessage;

  const MaintenanceView({
    super.key,
    this.customMessage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maintenanceConfig = ref.watch(maintenanceConfigProvider);
    final support = ref.watch(appConfigProvider).support;
    final state = ref.watch(appConfigNotifierProvider);

    final displayMessage = customMessage ?? maintenanceConfig.message;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.xxxl,
              vertical: AppDimensions.xl,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 84,
                  height: 84,
                  decoration: const BoxDecoration(
                    color: AppColors.warningLight,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.build_circle_outlined,
                    size: AppIconSizes.xxl + 12,
                    color: AppColors.warning,
                  ),
                ),
                const SizedBox(height: AppDimensions.xl),
                const Text(
                  'Under Maintenance',
                  style: AppTypography.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimensions.md),
                Text(
                  displayMessage,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimensions.xxl),
                AppButton(
                  label: 'Check Status',
                  icon: Icons.refresh_rounded,
                  isLoading: state.isLoading,
                  onPressed: () {
                    ref
                        .read(appConfigNotifierProvider.notifier)
                        .refreshConfig(forceRefresh: true);
                  },
                ),
                const SizedBox(height: AppDimensions.xl),
                if (support.contactEmail.isNotEmpty)
                  Container(
                    padding: AppDimensions.paddingMd,
                    decoration: const BoxDecoration(
                      color: AppColors.slate50,
                      borderRadius: AppRadius.borderMd,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: AppIconSizes.sm,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: AppDimensions.sm),
                        Text(
                          'Need urgent help? ${support.contactEmail}',
                          style: AppTypography.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
