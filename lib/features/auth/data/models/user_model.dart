import '../../domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String avatar;
  final String phone;
  final bool orderUpdates;
  final bool promotions;
  final bool wishlistAlerts;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.role = 'CUSTOMER',
    this.avatar = '',
    this.phone = '',
    this.orderUpdates = true,
    this.promotions = true,
    this.wishlistAlerts = true,
  });

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

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      role: role,
      avatar: avatar,
      phone: phone,
      orderUpdates: orderUpdates,
      promotions: promotions,
      wishlistAlerts: wishlistAlerts,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      role: entity.role,
      avatar: entity.avatar,
      phone: entity.phone,
      orderUpdates: entity.orderUpdates,
      promotions: entity.promotions,
      wishlistAlerts: entity.wishlistAlerts,
    );
  }
}
