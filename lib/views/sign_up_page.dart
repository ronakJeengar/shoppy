import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/user_model.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/views/widgets/app_button.dart';
import 'package:shopp_app/views/widgets/app_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

    final userProvider = context.read<UserProvider>();
    final User newUser = User(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    await userProvider.userSignUp(context: context, user: newUser);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.slate800),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xxl, vertical: AppDimensions.md),
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
                    child: const Icon(
                      Icons.person_add_rounded,
                      size: AppIconSizes.xxl,
                      color: AppColors.primary,
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
                  style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 28),

                if (userProvider.errorMessage != null) ...[
                  Container(
                    padding: AppDimensions.paddingMd,
                    decoration: BoxDecoration(
                      color: AppColors.errorLight,
                      borderRadius: AppRadius.borderMd,
                      border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline_rounded, size: AppIconSizes.sm + 2, color: AppColors.error),
                        const SizedBox(width: AppDimensions.sm),
                        Expanded(
                          child: Text(
                            userProvider.errorMessage!,
                            style: AppTypography.caption.copyWith(color: AppColors.error),
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
                  prefixIcon: Icons.person_outline_rounded,
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
                  prefixIcon: Icons.email_outlined,
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
                  prefixIcon: Icons.lock_outline_rounded,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
                  hintText: AppStrings.auth.enterConfirmPassword,
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  prefixIcon: Icons.lock_reset_rounded,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
                const SizedBox(height: 28),

                // Submit Button
                AppButton(
                  label: AppStrings.auth.register,
                  icon: Icons.check_circle_outline_rounded,
                  isLoading: userProvider.isLoading,
                  isFullWidth: true,
                  onPressed: userProvider.isLoading ? null : _submitRegister,
                ),
                const SizedBox(height: AppDimensions.xxl),

                // Back to Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.auth.alreadyHaveAccountPrompt,
                      style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
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
