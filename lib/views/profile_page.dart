import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/constants/app_icon_sizes.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/features/auth/domain/entities/user_entity.dart';
import 'package:shopp_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopp_app/features/notifications/presentation/providers/notification_providers.dart';
import 'package:shopp_app/views/addresses_page.dart';
import 'package:shopp_app/views/admin/admin_dashboard_page.dart';
import 'package:shopp_app/views/login_page.dart';
import 'package:shopp_app/views/notifications_page.dart';
import 'package:shopp_app/views/orders_page.dart';
import 'package:shopp_app/views/wishlist_page.dart';
import 'package:shopp_app/views/widgets/app_button.dart';
import 'package:shopp_app/views/widgets/app_text_field.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  void _openEditProfileDialog(UserEntity user) {
    final nameController = TextEditingController(text: user.name);
    final phoneController = TextEditingController(text: user.phone);
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (dialogCtx) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderLg),
          title: const Text('Edit Profile', style: AppTypography.headingSmall),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  label: 'Full Name',
                  controller: nameController,
                  prefixIcon: AppIcons.user,
                  validator: (val) =>
                      (val == null || val.trim().isEmpty) ? 'Enter your name' : null,
                ),
                const SizedBox(height: 14),
                AppTextField(
                  label: 'Phone Number',
                  controller: phoneController,
                  prefixIcon: AppIcons.phone,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancel', style: TextStyle(color: AppColors.slate600)),
            ),
            AppButton(
              label: 'Save Changes',
              height: 40,
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;
                Navigator.pop(dialogCtx);
                final success = await ref.read(authStateProvider.notifier).updateProfile(
                      fullName: nameController.text.trim(),
                      phone: phoneController.text.trim(),
                    );
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Profile updated successfully'
                          : (ref.read(authStateProvider).errorMessage ??
                              'Failed to update profile'),
                    ),
                    backgroundColor: success ? AppColors.success : AppColors.error,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _openChangePasswordDialog() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (dialogCtx) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderLg),
          title: const Text('Change Password', style: AppTypography.headingSmall),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  label: 'Current Password',
                  controller: currentPasswordController,
                  obscureText: true,
                  prefixIcon: AppIcons.lock,
                  validator: (val) =>
                      (val == null || val.isEmpty) ? 'Enter current password' : null,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  label: 'New Password',
                  controller: newPasswordController,
                  obscureText: true,
                  prefixIcon: AppIcons.lockReset,
                  validator: (val) =>
                      (val == null || val.length < 6) ? 'At least 6 characters' : null,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  label: 'Confirm New Password',
                  controller: confirmPasswordController,
                  obscureText: true,
                  prefixIcon: AppIcons.checkCircleOutline,
                  validator: (val) {
                    if (val == null || val.isEmpty) return 'Confirm your password';
                    if (val != newPasswordController.text) return 'Passwords do not match';
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancel', style: TextStyle(color: AppColors.slate600)),
            ),
            AppButton(
              label: 'Update',
              height: 40,
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;
                Navigator.pop(dialogCtx);
                final success = await ref.read(authStateProvider.notifier).changePassword(
                      currentPassword: currentPasswordController.text,
                      newPassword: newPasswordController.text,
                    );
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Password changed successfully'
                          : (ref.read(authStateProvider).errorMessage ??
                              'Failed to change password'),
                    ),
                    backgroundColor: success ? AppColors.success : AppColors.error,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderLg),
        title: const Text('Sign Out', style: AppTypography.headingSmall),
        content: const Text(
          'Are you sure you want to sign out of your account?',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel', style: TextStyle(color: AppColors.slate600)),
          ),
          AppButton(
            label: 'Sign Out',
            variant: AppButtonVariant.danger,
            height: 38,
            onPressed: () async {
              Navigator.pop(ctx);
              await ref.read(authStateProvider.notifier).logout();
              if (!mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final unreadCount = ref.watch(notificationUnreadCountProvider);

    return Scaffold(
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const AppIcon(AppIcons.back, color: AppColors.slate800),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('My Account', style: AppTypography.headingSmall),
      ),
      body: user == null
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // 1. Profile Header Card
                _buildProfileHeader(user),
                const SizedBox(height: 20),

                // Store Administration (Visible only to ADMIN role)
                if (user.isAdmin) ...[
                  const Text(
                    'Store Administration',
                    style: AppTypography.label,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppRadius.borderMd,
                      border: Border.all(color: AppColors.violet.withValues(alpha: 0.3)),
                      boxShadow: AppShadows.card,
                    ),
                    child: _buildTile(
                      icon: AppIcons.dashboard,
                      iconColor: AppColors.violet,
                      title: 'Admin Dashboard',
                      subtitle: 'Store overview, products, orders & audit logs',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AdminDashboardPage(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],

                // 2. Shopping Activity Section
                const Text(
                  'SHOPPING ACTIVITY',
                  style: AppTypography.label,
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: AppRadius.borderMd,
                    border: Border.all(color: AppColors.slate200),
                    boxShadow: AppShadows.card,
                  ),
                  child: Column(
                    children: [
                      _buildTile(
                        icon: AppIcons.orders,
                        iconColor: AppColors.primary,
                        title: 'My Orders',
                        subtitle: 'Track, view, or cancel your orders',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const OrdersPage(),
                          ),
                        ),
                      ),
                      const Divider(height: 1, color: AppColors.slate200, indent: 56),
                      _buildTile(
                        icon: AppIcons.wishlistFilled,
                        iconColor: AppColors.coral,
                        title: 'My Wishlist',
                        subtitle: 'Saved products and future purchases',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WishlistPage(),
                          ),
                        ),
                      ),
                      const Divider(height: 1, color: AppColors.slate200, indent: 56),
                      _buildTile(
                        icon: AppIcons.address,
                        iconColor: AppColors.success,
                        title: 'Delivery Addresses',
                        subtitle: 'Manage saved shipping addresses',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddressesPage(),
                          ),
                        ),
                      ),
                      const Divider(height: 1, color: AppColors.slate200, indent: 56),
                      _buildTile(
                        icon: AppIcons.notificationsFilled,
                        iconColor: AppColors.accent,
                        title: 'Notifications',
                        subtitle: 'Order updates and promotional offers',
                        trailingBadgeCount: unreadCount,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const NotificationsPage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 3. Settings & Security Section
                const Text(
                  'SETTINGS & SECURITY',
                  style: AppTypography.label,
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: AppRadius.borderMd,
                    border: Border.all(color: AppColors.slate200),
                    boxShadow: AppShadows.card,
                  ),
                  child: Column(
                    children: [
                      _buildTile(
                        icon: AppIcons.edit,
                        iconColor: AppColors.primary,
                        title: 'Edit Profile',
                        subtitle: 'Update your display name and contact phone',
                        onTap: () => _openEditProfileDialog(user),
                      ),
                      const Divider(height: 1, color: AppColors.slate200, indent: 56),
                      _buildTile(
                        icon: AppIcons.lock,
                        iconColor: AppColors.slate700,
                        title: 'Change Password',
                        subtitle: 'Keep your Shoppy account secure',
                        onTap: () => _openChangePasswordDialog(),
                      ),
                      const Divider(height: 1, color: AppColors.slate200, indent: 56),
                      _buildTile(
                        icon: AppIcons.tune,
                        iconColor: AppColors.violet,
                        title: 'Notification Preferences',
                        subtitle: 'Manage email and app notifications',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Notification preferences updated'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 4. Sign Out Button
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: AppRadius.borderMd,
                    border: Border.all(color: AppColors.slate200),
                    boxShadow: AppShadows.card,
                  ),
                  child: _buildTile(
                    icon: AppIcons.logout,
                    iconColor: AppColors.error,
                    title: 'Log Out',
                    subtitle: 'Safely sign out of this device',
                    onTap: () => _confirmLogout(),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
    );
  }

  Widget _buildProfileHeader(UserEntity user) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.borderMd,
        border: Border.all(color: AppColors.slate200),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.primary50,
            child: Text(
              user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        user.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.headingMedium,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: user.isAdmin ? AppColors.violetLight : AppColors.primary50,
                        borderRadius: AppRadius.borderFull,
                      ),
                      child: Text(
                        user.role,
                        style: AppTypography.label.copyWith(
                          color: user.isAdmin ? AppColors.violet : AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: AppTypography.bodySmall.copyWith(color: AppColors.slate500),
                ),
                if (user.phone.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    user.phone,
                    style: AppTypography.caption.copyWith(color: AppColors.slate400),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile({
    required String icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    int trailingBadgeCount = 0,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          borderRadius: AppRadius.borderSm,
        ),
        child: AppIcon(icon, color: iconColor, size: AppIconSizes.medium),
      ),
      title: Text(
        title,
        style: AppTypography.bodySmall.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.slate900,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTypography.caption.copyWith(color: AppColors.slate500),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingBadgeCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: const BoxDecoration(
                color: AppColors.error,
                borderRadius: AppRadius.borderFull,
              ),
              child: Text(
                '$trailingBadgeCount',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(width: 6),
          const AppIcon(
            AppIcons.chevronRight,
            size: 18,
            color: AppColors.slate400,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
