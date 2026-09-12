import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/constants/route_names.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/core/widgets/app_button.dart';
import 'package:shopp_app/core/widgets/app_text_field.dart';
import '../providers/auth_providers.dart';
import 'sign_up_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(authStateProvider.notifier).signIn(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );

    if (success && mounted) {
      context.go(RouteNames.home);
    }
  }

  void _fillDemoCredentials(String email, String password) {
    setState(() {
      _emailController.text = email;
      _passwordController.text = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.xxl, vertical: AppDimensions.md),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo & Header
                Center(
                  child: Container(
                    width: AppDimensions.avatarXl,
                    height: AppDimensions.avatarXl,
                    decoration: const BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: AppRadius.borderLg,
                    ),
                    child: const Center(
                      child: AppIcon(
                        AppIcons.bagFilled,
                        size: AppIconSizes.hero,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.auth.loginTitle,
                  textAlign: TextAlign.center,
                  style: AppTypography.displayMedium,
                ),
                const SizedBox(height: AppDimensions.xs),
                Text(
                  AppStrings.auth.loginSubtitle,
                  textAlign: TextAlign.center,
                  style: AppTypography.bodySmall
                      .copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 14),

                // Error Banner
                if (authState.errorMessage != null) ...[
                  Container(
                    padding: AppDimensions.paddingMd,
                    decoration: BoxDecoration(
                      color: AppColors.errorLight,
                      borderRadius: AppRadius.borderMd,
                      border: Border.all(
                          color: AppColors.error.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const AppIcon(AppIcons.errorOutline,
                            size: AppIconSizes.action, color: AppColors.error),
                        const SizedBox(width: AppDimensions.sm),
                        Expanded(
                          child: Text(
                            authState.errorMessage!,
                            style: AppTypography.bodySmall
                                .copyWith(color: AppColors.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimensions.lg),
                ],

                // Email Input
                AppTextField(
                  label: AppStrings.auth.email,
                  hintText: AppStrings.auth.enterEmail,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  prefixIcon: AppIcons.email,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.validation.emailRequired;
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return AppStrings.validation.emailInvalid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.md),

                // Password Input
                AppTextField(
                  label: AppStrings.auth.password,
                  hintText: AppStrings.auth.enterPassword,
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  enableSuggestions: false,
                  prefixIcon: AppIcons.lock,
                  suffixIcon: IconButton(
                    icon: AppIcon(
                      _obscurePassword
                          ? AppIcons.eye
                          : AppIcons.eyeOff,
                      size: AppIconSizes.md,
                      color: AppColors.slate500,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validation.passwordRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // Submit Button
                AppButton(
                  label: AppStrings.auth.login,
                  icon: AppIcons.login,
                  isLoading: authState.isLoading,
                  isFullWidth: true,
                  onPressed: authState.isLoading ? null : _submitLogin,
                ),
                const SizedBox(height: 10),

                // Demo Credentials Helper Box
                Container(
                  padding: AppDimensions.paddingSm,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: AppRadius.borderMd,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.auth.quickDemo,
                        style: AppTypography.label
                            .copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                side: const BorderSide(color: AppColors.border),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: AppRadius.borderSm),
                              ),
                              onPressed: () => _fillDemoCredentials(
                                'customer@shoppy.com',
                                'Customer@12345',
                              ),
                              child: Text(AppStrings.auth.demoCustomer,
                                  style: AppTypography.caption),
                            ),
                          ),
                          const SizedBox(width: AppDimensions.sm),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                side: const BorderSide(color: AppColors.border),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: AppRadius.borderSm),
                              ),
                              onPressed: () => _fillDemoCredentials(
                                'admin@shoppy.com',
                                'Admin@12345',
                              ),
                              child: Text(AppStrings.auth.demoAdmin,
                                  style: AppTypography.caption),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.auth.noAccountPrompt,
                      style: AppTypography.bodySmall
                          .copyWith(color: AppColors.textSecondary),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        AppStrings.auth.register,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
