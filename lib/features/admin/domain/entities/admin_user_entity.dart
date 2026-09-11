import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_user_entity.freezed.dart';

@freezed
abstract class AdminUserEntity with _$AdminUserEntity {
  const factory AdminUserEntity({
    required String id,
    required String fullName,
    required String email,
    required String username,
    @Default('') String phone,
    required String role,
    @Default(true) bool isActive,
    required DateTime createdAt,
  }) = _AdminUserEntity;
}
