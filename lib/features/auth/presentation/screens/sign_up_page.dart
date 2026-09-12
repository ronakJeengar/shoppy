import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/core/widgets/app_button.dart';
import 'package:shopp_app/core/widgets/app_text_field.dart';
import 'package:shopp_app/features/auth/presentation/providers/auth_providers.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitRegister() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(authStateProvider.notifier).signUp(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully! Please log in.'),
          backgroundColor: AppColors.success,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const AppIcon(AppIcons.back, color: AppColors.slate800),
                onPressed: () => Navigator.pop(context),
              )
            : null,
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
                Center(
                  child: Container(
                    width: AppDimensions.giant,
                    height: AppDimensions.giant,
                    decoration: const BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: AppRadius.borderLg,
                    ),
                    child: const Center(
                      child: AppIcon(
                        AppIcons.userAdd,
                        size: AppIconSizes.xxl,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.xl),
                Text(
                  AppStrings.auth.createAccount,
                  textAlign: TextAlign.center,
                  style: AppTypography.displayMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  AppStrings.auth.registerTitle,
                  textAlign: TextAlign.center,
                  style: AppTypography.bodySmall
                      .copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 28),

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
                            style: AppTypography.caption
                                .copyWith(color: AppColors.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimensions.lg),
                ],

                // Full Name
                AppTextField(
                  label: AppStrings.auth.fullName,
                  hintText: AppStrings.auth.enterName,
                  controller: _nameController,
                  prefixIcon: AppIcons.user,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.validation.nameRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.lg),

                // Email
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
                const SizedBox(height: AppDimensions.lg),

                // Password
                AppTextField(
                  label: AppStrings.auth.password,
                  hintText: AppStrings.auth.passwordRule,
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
                    if (value.length < 6) {
                      return AppStrings.validation.passwordTooShort;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.lg),

                // Confirm Password
                AppTextField(
                  label: AppStrings.auth.confirmPassword,
                  hintText: AppStrings.auth.confirmPassword,
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  enableSuggestions: false,
                  prefixIcon: AppIcons.lockClock,
                  suffixIcon: IconButton(
                    icon: AppIcon(
                      _obscureConfirmPassword
                          ? AppIcons.eye
                          : AppIcons.eyeOff,
                      size: AppIconSizes.md,
                      color: AppColors.slate500,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validation.confirmPasswordRequired;
                    }
                    if (value != _passwordController.text) {
                      return AppStrings.validation.passwordsDoNotMatch;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.xxl),

                // Submit Button
                AppButton(
                  label: AppStrings.auth.createAccount,
                  icon: AppIcons.checkCircleOutline,
                  isLoading: authState.isLoading,
                  isFullWidth: true,
                  onPressed: authState.isLoading ? null : _submitRegister,
                ),
                const SizedBox(height: AppDimensions.xl),

                // Back to Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.auth.alreadyHaveAccount,
                      style: AppTypography.bodySmall
                          .copyWith(color: AppColors.textSecondary),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        AppStrings.auth.signIn,
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
