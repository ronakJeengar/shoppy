import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/currrent_user_model.dart';
import 'package:shopp_app/data/models/user_model.dart';
import 'package:shopp_app/data/repositories/auth_repository.dart';
import 'package:shopp_app/providers/address_provider.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/providers/checkout_provider.dart';
import 'package:shopp_app/providers/wishlist_provider.dart';
import 'package:shopp_app/views/home_page.dart';
import 'package:shopp_app/views/login_page.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  final AuthRepository authRepository = AuthRepository();
  User _user = User(name: '', email: '', password: '');
  CurrentUserModel? currentUser;

  User get user => _user;
  bool get isAuthenticated => Preferences.getAccessToken() != null;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void getUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  Future<bool> userSignUp({
    required BuildContext context,
    required User user,
  }) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final ApiResponse apiResponse = await authRepository.signUp(userData: user);

      isLoading = false;
      if (!apiResponse.status) {
        errorMessage = apiResponse.message;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(apiResponse.message),
              backgroundColor: Colors.red.shade700,
            ),
          );
        }
        return false;
      }

      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully! Please log in.'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop();
      }
      return true;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
      log('userSignUp error: $e');
      return false;
    }
  }

  Future<bool> userSignIn({
    required BuildContext context,
    required Map<String, dynamic> data,
  }) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final ApiResponse response = await authRepository.signIn(loginData: data);

      isLoading = false;
      if (!response.status || response.data == null) {
        errorMessage = response.message.isNotEmpty
            ? response.message
            : 'Login failed. Please check your credentials.';
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage!),
              backgroundColor: Colors.red.shade700,
            ),
          );
        }
        return false;
      }

      final dynamic responseData = response.data;
      final String accessToken =
          (responseData['accessToken'] ?? responseData['token'] ?? '').toString();
      final String? refreshToken = responseData['refreshToken']?.toString();

      await Preferences.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      // Populate current user
      if (responseData['user'] != null && responseData['user'] is Map<String, dynamic>) {
        currentUser = CurrentUserModel.fromJson(responseData['user']);
      } else {
        await getCurrentUser();
      }

      notifyListeners();

      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
          (route) => false,
        );
      }
      return true;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
      log('userSignIn error: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error signing in: $e'),
            backgroundColor: Colors.red.shade700,
          ),
        );
      }
      return false;
    }
  }

  Future<CurrentUserModel?> getCurrentUser() async {
    try {
      final ApiResponse response = await authRepository.getCurrentUser();

      if (!response.status || response.data == null) {
        log('current user fetch unsuccessful: ${response.message}');
        return null;
      }

      if (response.data is Map<String, dynamic>) {
        currentUser = CurrentUserModel.fromJson(response.data as Map<String, dynamic>);
      }
      notifyListeners();
      return currentUser;
    } catch (e) {
      log('getCurrentUser exception: $e');
      return null;
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await authRepository.logout();
    } catch (e) {
      log('Backend logout error: $e');
    } finally {
      await Preferences.clearAuth();
      currentUser = null;
      errorMessage = null;
      notifyListeners();

      if (context.mounted) {
        try {
          context.read<CartProvider>().clearCartState();
          context.read<WishlistProvider>().clearWishlistState();
          context.read<AddressProvider>().clearAddressState();
          context.read<CheckoutProvider>().resetState();
        } catch (_) {}

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const LoginPage()),
          (route) => false,
        );
      }
    }
  }
}
