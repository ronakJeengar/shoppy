import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/currrent_user_model.dart';
import 'package:shopp_app/data/models/user_model.dart';
import 'package:shopp_app/data/repositories/auth_repository.dart';
import 'package:shopp_app/views/home_page.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  final AuthRepository authRepository = AuthRepository();
  User _user = User(name: '', email: '', password: '');
  CurrentUserModel? currentUser;

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void getUser(User user) {
    _user = user;
    notifyListeners();
  }

  Future<void> userSignUp(
      {required BuildContext context, required User user}) async {
    try {
      isLoading = true;
      notifyListeners();

      ApiResponse apiResponse = await authRepository.signUp(userData: user);

      if (!apiResponse.status) {
        isLoading = false;
        notifyListeners();
        //show toast or snackbar
        return;
      }
      isLoading = false;
      notifyListeners();
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      //show toast or snackbar
    } catch (e) {
      isLoading = false;
      notifyListeners();
      log('error : $e');
    }
  }

  Future<void> userSignIn(
      {required BuildContext context,
      required Map<String, dynamic> data}) async {
    try {
      isLoading = true;
      notifyListeners();

      ApiResponse response = await authRepository.signIn(loginData: data);

      if (!response.status) {
        isLoading = false;
        notifyListeners();
        return;
      }

      String token = response.data['token'];
      Preferences.setString('token', token);

      if (context.mounted) {
        isLoading = false;
        notifyListeners();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()));
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      log('error : $e');
    }
  }

  Future<CurrentUserModel?> getCurrentUser() async {
    try {
      ApiResponse response = await authRepository.getCurrentUser();

      if (!response.status) {
        log('current user getting error');
      }

      currentUser = CurrentUserModel.fromJson(response.data);
      notifyListeners();
      return currentUser;
    } catch (e) {
      log('error :- $e');
      return null;
    }
  }
}
