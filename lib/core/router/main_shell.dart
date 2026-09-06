import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/constants/route_names.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/riverpod/cart_riverpod_provider.dart';

/// The responsive, polished bottom shell navigation for the core commerce tabs.
/// Consumes centralized design tokens, strings, and route names.
class MainShell extends ConsumerWidget {
  final Widget child;
  final String location;

  const MainShell({
    super.key,
    required this.child,
    required this.location,
  });

  int _calculateSelectedIndex(String loc) {
    if (loc.startsWith(RouteNames.search)) return 1;
    if (loc.startsWith(RouteNames.cart)) return 2;
    if (loc.startsWith(RouteNames.wishlist)) return 3;
    if (loc.startsWith(RouteNames.profile)) return 4;
    return 0; // Default to /home
  }

  void _onItemTapped(int index, BuildContext context) {
    HapticFeedback.selectionClick();
    switch (index) {
      case 0:
        context.go(RouteNames.home);
        break;
      case 1:
        context.go(RouteNames.search);
        break;
      case 2:
        context.go(RouteNames.cart);
        break;
      case 3:
        context.go(RouteNames.wishlist);
        break;
      case 4:
        context.go(RouteNames.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = _calculateSelectedIndex(location);
    final cartCount = ref.watch(cartItemCountProvider);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(
            top: BorderSide(color: AppColors.border, width: 1),
          ),
          boxShadow: AppShadows.bottomBar,
        ),
        child: SafeArea(
          child: Container(
            height: AppDimensions.bottomBarHeight,
            padding: AppDimensions.paddingHorizontalSm,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  context,
                  index: 0,
                  selectedIndex: selectedIndex,
                  icon: AppIcons.home,
                  activeIcon: Icons.home_rounded,
                  label: AppStrings.nav.home,
                ),
                _buildNavItem(
                  context,
                  index: 1,
                  selectedIndex: selectedIndex,
                  icon: AppIcons.search,
                  activeIcon: Icons.search_rounded,
                  label: AppStrings.nav.explore,
                ),
                _buildNavItem(
                  context,
                  index: 2,
                  selectedIndex: selectedIndex,
                  icon: Icons.shopping_bag_outlined,
                  activeIcon: Icons.shopping_bag_rounded,
                  label: AppStrings.nav.cart,
                  badgeCount: cartCount,
                ),
                _buildNavItem(
                  context,
                  index: 3,
                  selectedIndex: selectedIndex,
                  icon: AppIcons.wishlist,
                  activeIcon: AppIcons.wishlistFilled,
                  label: AppStrings.nav.wishlist,
                ),
                _buildNavItem(
                  context,
                  index: 4,
                  selectedIndex: selectedIndex,
                  icon: Icons.account_circle_outlined,
                  activeIcon: Icons.account_circle,
                  label: AppStrings.nav.profile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required int selectedIndex,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    int badgeCount = 0,
  }) {
    final isSelected = index == selectedIndex;
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppRadius.borderSm,
          onTap: () => _onItemTapped(index, context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      isSelected ? activeIcon : icon,
                      color: color,
                      size: AppIconSizes.lg,
                    ),
                    if (badgeCount > 0)
                      Positioned(
                        top: -4,
                        right: -8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          decoration: const BoxDecoration(
                            color: AppColors.error,
                            borderRadius: AppRadius.borderFull,
                          ),
                          constraints: const BoxConstraints(minWidth: 16),
                          child: Text(
                            badgeCount > 99 ? '99+' : '$badgeCount',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight:
                        isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: color,
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
