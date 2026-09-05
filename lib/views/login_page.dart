import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo & Header
                Center(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: AppRadius.borderLg,
                    ),
                    child: const Icon(
                      Icons.shopping_bag_rounded,
                      size: 24,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Shoppy Login',
                  textAlign: TextAlign.center,
                  style: AppTypography.displayMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Sign in to access your cart, orders, and saved items',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodySmall.copyWith(color: AppColors.slate500),
                ),
                const SizedBox(height: 14),

                // Error Banner
                if (userProvider.errorMessage != null) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.errorLight,
                      borderRadius: AppRadius.borderMd,
                      border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline_rounded, size: 18, color: AppColors.error),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            userProvider.errorMessage!,
                            style: AppTypography.bodySmall.copyWith(color: AppColors.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Email Input
                AppTextField(
                  label: 'Email',
                  hintText: 'Enter your email address',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Password Input
                AppTextField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  prefixIcon: Icons.lock_outline_rounded,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      size: 20,
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
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // Submit Button
                AppButton(
                  label: 'Login',
                  icon: Icons.login_rounded,
                  isLoading: userProvider.isLoading,
                  isFullWidth: true,
                  onPressed: userProvider.isLoading ? null : _submitLogin,
                ),
                const SizedBox(height: 10),

                // Demo Credentials Helper Box
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.slate50,
                    borderRadius: AppRadius.borderMd,
                    border: Border.all(color: AppColors.slate200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'QUICK DEMO ACCOUNTS',
                        style: AppTypography.label.copyWith(color: AppColors.slate500),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                side: const BorderSide(color: AppColors.slate300),
                                shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
                              ),
                              onPressed: () => _fillDemoCredentials(
                                'customer@shoppy.com',
                                'Customer@12345',
                              ),
                              child: const Text('Customer', style: TextStyle(fontSize: 12)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                side: const BorderSide(color: AppColors.slate300),
                                shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
                              ),
                              onPressed: () => _fillDemoCredentials(
                                'admin@shoppy.com',
                                'Admin@12345',
                              ),
                              child: const Text('Admin', style: TextStyle(fontSize: 12)),
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
                      'Don\'t have an account?',
                      style: AppTypography.bodySmall.copyWith(color: AppColors.slate600),
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
                        'Register',
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
