import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/currrent_user_model.dart';
import 'package:shopp_app/providers/notification_provider.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/views/addresses_page.dart';
import 'package:shopp_app/views/admin/admin_dashboard_page.dart';
import 'package:shopp_app/views/login_page.dart';
import 'package:shopp_app/views/notifications_page.dart';
import 'package:shopp_app/views/orders_page.dart';
import 'package:shopp_app/views/wishlist_page.dart';
import 'package:shopp_app/views/widgets/app_button.dart';
import 'package:shopp_app/views/widgets/app_text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _openEditProfileDialog(BuildContext context, CurrentUserModel user) {
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
                  prefixIcon: Icons.person_outline_rounded,
                  validator: (val) =>
                      (val == null || val.trim().isEmpty) ? 'Enter your name' : null,
                ),
                const SizedBox(height: 14),
                AppTextField(
                  label: 'Phone Number',
                  controller: phoneController,
                  prefixIcon: Icons.phone_outlined,
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
                final success = await context.read<UserProvider>().updateProfile(
                      fullName: nameController.text.trim(),
                      phone: phoneController.text.trim(),
                    );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        success
                            ? 'Profile updated successfully'
                            : (context.read<UserProvider>().errorMessage ??
                                'Failed to update profile'),
                      ),
                      backgroundColor: success ? AppColors.success : AppColors.error,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _openChangePasswordDialog(BuildContext context) {
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
                  prefixIcon: Icons.lock_outline_rounded,
                  validator: (val) =>
                      (val == null || val.isEmpty) ? 'Enter current password' : null,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  label: 'New Password',
                  controller: newPasswordController,
                  obscureText: true,
                  prefixIcon: Icons.lock_reset_rounded,
                  validator: (val) =>
                      (val == null || val.length < 6) ? 'At least 6 characters' : null,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  label: 'Confirm New Password',
                  controller: confirmPasswordController,
                  obscureText: true,
                  prefixIcon: Icons.check_circle_outline_rounded,
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
                final success = await context.read<UserProvider>().changePassword(
                      currentPassword: currentPasswordController.text,
                      newPassword: newPasswordController.text,
                    );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        success
                            ? 'Password changed successfully'
                            : (context.read<UserProvider>().errorMessage ??
                                'Failed to change password'),
                      ),
                      backgroundColor: success ? AppColors.success : AppColors.error,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmLogout(BuildContext context) {
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
              await context.read<UserProvider>().logout(context);
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final notifProvider = context.watch<NotificationProvider>();
    final user = userProvider.currentUser;

    return Scaffold(
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.slate800),
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
                if (user.role == 'ADMIN') ...[
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
                      icon: Icons.dashboard_rounded,
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
                        icon: Icons.receipt_long_rounded,
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
                        icon: Icons.favorite_rounded,
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
                        icon: Icons.location_on_rounded,
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
                        icon: Icons.notifications_rounded,
                        iconColor: AppColors.accent,
                        title: 'Notifications',
                        subtitle: 'Order updates and promotional offers',
                        trailingBadgeCount: notifProvider.unreadCount,
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
                        icon: Icons.edit_rounded,
                        iconColor: AppColors.primary,
                        title: 'Edit Profile',
                        subtitle: 'Update your display name and contact phone',
                        onTap: () => _openEditProfileDialog(context, user),
                      ),
                      const Divider(height: 1, color: AppColors.slate200, indent: 56),
                      _buildTile(
                        icon: Icons.lock_outline_rounded,
                        iconColor: AppColors.slate700,
                        title: 'Change Password',
                        subtitle: 'Keep your Shoppy account secure',
                        onTap: () => _openChangePasswordDialog(context),
                      ),
                      const Divider(height: 1, color: AppColors.slate200, indent: 56),
                      _buildTile(
                        icon: Icons.tune_rounded,
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
                    icon: Icons.logout_rounded,
                    iconColor: AppColors.error,
                    title: 'Log Out',
                    subtitle: 'Safely sign out of this device',
                    onTap: () => _confirmLogout(context),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
    );
  }

  Widget _buildProfileHeader(CurrentUserModel user) {
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
                        color: user.role == 'ADMIN' ? AppColors.violetLight : AppColors.primary50,
                        borderRadius: AppRadius.borderFull,
                      ),
                      child: Text(
                        user.role,
                        style: AppTypography.label.copyWith(
                          color: user.role == 'ADMIN' ? AppColors.violet : AppColors.primary,
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
    required IconData icon,
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
        child: Icon(icon, color: iconColor, size: 20),
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
          const Icon(
            Icons.chevron_right_rounded,
            size: 18,
            color: AppColors.slate400,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
