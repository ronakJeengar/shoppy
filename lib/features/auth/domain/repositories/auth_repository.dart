import '../../../../core/utils/result.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<Result<UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Result<UserEntity>> getCurrentUser();

  Future<Result<void>> logout();

  Future<Result<UserEntity>> updateProfile({
    String? fullName,
    String? phone,
    String? avatar,
  });

  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
