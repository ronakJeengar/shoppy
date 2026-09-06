import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/views/sign_up_page.dart';
import 'package:shopp_app/views/widgets/app_button.dart';
import 'package:shopp_app/views/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

    final userProvider = context.read<UserProvider>();
    final Map<String, dynamic> credentials = {
      'email': _emailController.text.trim(),
      'password': _passwordController.text,
    };

    await userProvider.userSignIn(context: context, data: credentials);
  }

  void _fillDemoCredentials(String email, String password) {
    setState(() {
      _emailController.text = email;
      _passwordController.text = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
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
                // Logo & Header
                Center(
                  child: Container(
                    width: AppDimensions.avatarXl,
                    height: AppDimensions.avatarXl,
                    decoration: const BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: AppRadius.borderLg,
                    ),
                    child: const Icon(
                      Icons.shopping_bag_rounded,
                      size: AppIconSizes.hero,
                      color: AppColors.primary,
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
                  style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 14),

                // Error Banner
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
                            style: AppTypography.bodySmall.copyWith(color: AppColors.error),
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
                const SizedBox(height: AppDimensions.md),

                // Password Input
                AppTextField(
                  label: AppStrings.auth.password,
                  hintText: AppStrings.auth.enterPassword,
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
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // Submit Button
                AppButton(
                  label: AppStrings.auth.login,
                  icon: Icons.login_rounded,
                  isLoading: userProvider.isLoading,
                  isFullWidth: true,
                  onPressed: userProvider.isLoading ? null : _submitLogin,
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
                        style: AppTypography.label.copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                side: const BorderSide(color: AppColors.border),
                                shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
                              ),
                              onPressed: () => _fillDemoCredentials(
                                'customer@shoppy.com',
                                'Customer@12345',
                              ),
                              child: Text(AppStrings.auth.demoCustomer, style: const TextStyle(fontSize: 12)),
                            ),
                          ),
                          const SizedBox(width: AppDimensions.sm),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                side: const BorderSide(color: AppColors.border),
                                shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
                              ),
                              onPressed: () => _fillDemoCredentials(
                                'admin@shoppy.com',
                                'Admin@12345',
                              ),
                              child: Text(AppStrings.auth.demoAdmin, style: const TextStyle(fontSize: 12)),
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
                      style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
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
