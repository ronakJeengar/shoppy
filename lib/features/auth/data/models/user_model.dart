import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String name,
    required String email,
    @Default('CUSTOMER') String role,
    @Default('') String avatar,
    @Default('') String phone,
    @Default(true) bool orderUpdates,
    @Default(true) bool promotions,
    @Default(true) bool wishlistAlerts,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final prefs = json['notificationPreferences'] as Map<String, dynamic>?;
    return UserModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      name: (json['name'] ?? json['fullName'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      role: (json['role'] ?? 'CUSTOMER').toString(),
      avatar: (json['avatar'] ?? '').toString(),
      phone: (json['phone'] ?? '').toString(),
      orderUpdates: prefs?['orderUpdates'] ?? true,
      promotions: prefs?['promotions'] ?? true,
      wishlistAlerts: prefs?['wishlistAlerts'] ?? true,
    );
  }
}

extension UserModelX on UserModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      '_id': id,
      'name': name,
      'email': email,
      'role': role,
      'avatar': avatar,
      'phone': phone,
      'notificationPreferences': {
        'orderUpdates': orderUpdates,
        'promotions': promotions,
        'wishlistAlerts': wishlistAlerts,
      },
    };
  }
}

typedef CurrentUserModel = UserModel;
