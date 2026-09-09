import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> signIn(String email, String password);
  Future<Map<String, dynamic>> signUp(String name, String email, String password);
  Future<UserModel> getCurrentUser();
  Future<void> logout();
  Future<UserModel> updateProfile({String? fullName, String? phone, String? avatar});
  Future<void> changePassword(String currentPassword, String newPassword);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final response = await _client.post(
      Urls.signIn,
      data: {'email': email, 'password': password},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> signUp(
      String name, String email, String password) async {
    final response = await _client.post(
      Urls.signUp,
      data: {'name': name, 'email': email, 'password': password},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await _client.get(Urls.currentUser);
    final data = response.data as Map<String, dynamic>;
    final userMap = data['data'] ?? data['user'] ?? data;
    return UserModel.fromJson(userMap as Map<String, dynamic>);
  }

  @override
  Future<void> logout() async {
    try {
      await _client.post(Urls.logout);
    } catch (_) {
      // Allow local logout even if network fails
    }
  }

  @override
  Future<UserModel> updateProfile({
    String? fullName,
    String? phone,
    String? avatar,
  }) async {
    final response = await _client.patch(
      Urls.profile,
      data: {
        if (fullName != null) 'fullName': fullName,
        if (phone != null) 'phone': phone,
        if (avatar != null) 'avatar': avatar,
      },
    );
    final data = response.data as Map<String, dynamic>;
    final userMap = data['data'] ?? data['user'] ?? data;
    return UserModel.fromJson(userMap as Map<String, dynamic>);
  }

  @override
  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    await _client.post(
      Urls.changePassword,
      data: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
    );
  }
}
