import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_user_model.freezed.dart';

@freezed
abstract class AdminUserModel with _$AdminUserModel {
  const factory AdminUserModel({
    required String id,
    required String fullName,
    required String email,
    required String username,
    @Default('') String phone,
    required String role,
    @Default(true) bool isActive,
    required DateTime createdAt,
  }) = _AdminUserModel;

  factory AdminUserModel.fromJson(Map<String, dynamic> json) {
    return AdminUserModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      fullName: json['fullName']?.toString() ?? json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      username: json['username']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      role: json['role']?.toString() ?? 'CUSTOMER',
      isActive: json['isActive'] != false,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}

extension AdminUserModelX on AdminUserModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'username': username,
      'phone': phone,
      'role': role,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

typedef AdminUser = AdminUserModel;
