import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/preferences.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final json = await _remoteDataSource.signIn(email.trim(), password);
      final data = (json['data'] ?? json) as Map<String, dynamic>;
      final accessToken = (data['accessToken'] ?? data['token'] ?? '').toString();
      final refreshToken = data['refreshToken']?.toString();

      await Preferences.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      UserModel userModel;
      if (data['user'] != null && data['user'] is Map<String, dynamic>) {
        userModel = UserModel.fromJson(data['user'] as Map<String, dynamic>);
      } else {
        userModel = await _remoteDataSource.getCurrentUser();
      }

      await Preferences.saveUserRole(userModel.role);
      await Preferences.saveUserId(userModel.id);

      return Success(userModel.toEntity());
    } on DioException catch (e) {
      final message = extractDioErrorMessage(e, 'Failed to sign in');
      if (e.response?.statusCode == 401) {
        return FailureResult(AuthFailure(message, 401));
      }
      return FailureResult(ServerFailure(message, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final json = await _remoteDataSource.signUp(name.trim(), email.trim(), password);
      final data = (json['data'] ?? json) as Map<String, dynamic>;
      final accessToken = (data['accessToken'] ?? data['token'] ?? '').toString();
      final refreshToken = data['refreshToken']?.toString();

      if (accessToken.isNotEmpty) {
        await Preferences.saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
      }

      UserModel userModel;
      if (data['user'] != null && data['user'] is Map<String, dynamic>) {
        userModel = UserModel.fromJson(data['user'] as Map<String, dynamic>);
      } else if (accessToken.isNotEmpty) {
        userModel = await _remoteDataSource.getCurrentUser();
      } else {
        userModel = UserModel(
          id: '',
          name: name,
          email: email,
        );
      }

      if (userModel.id.isNotEmpty) {
        await Preferences.saveUserRole(userModel.role);
        await Preferences.saveUserId(userModel.id);
      }

      return Success(userModel.toEntity());
    } on DioException catch (e) {
      final message = extractDioErrorMessage(e, 'Registration failed');
      return FailureResult(ServerFailure(message, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> getCurrentUser() async {
    try {
      final userModel = await _remoteDataSource.getCurrentUser();
      await Preferences.saveUserRole(userModel.role);
      await Preferences.saveUserId(userModel.id);
      return Success(userModel.toEntity());
    } on DioException catch (e) {
      final message = extractDioErrorMessage(e, 'Failed to load user profile');
      if (e.response?.statusCode == 401) {
        return FailureResult(AuthFailure(message, 401));
      }
      return FailureResult(ServerFailure(message, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _remoteDataSource.logout();
    } catch (_) {}
    await Preferences.clearAuth();
    return const Success(null);
  }

  @override
  Future<Result<UserEntity>> updateProfile({
    String? fullName,
    String? phone,
    String? avatar,
  }) async {
    try {
      final userModel = await _remoteDataSource.updateProfile(
        fullName: fullName,
        phone: phone,
        avatar: avatar,
      );
      return Success(userModel.toEntity());
    } on DioException catch (e) {
      final message = extractDioErrorMessage(e, 'Failed to update profile');
      return FailureResult(ServerFailure(message, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _remoteDataSource.changePassword(currentPassword, newPassword);
      return const Success(null);
    } on DioException catch (e) {
      final message = extractDioErrorMessage(e, 'Failed to change password');
      return FailureResult(ServerFailure(message, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
