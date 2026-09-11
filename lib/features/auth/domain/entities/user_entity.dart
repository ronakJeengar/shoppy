import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required String id,
    required String name,
    required String email,
    @Default('CUSTOMER') String role,
    @Default('') String avatar,
    @Default('') String phone,
    @Default(true) bool orderUpdates,
    @Default(true) bool promotions,
    @Default(true) bool wishlistAlerts,
  }) = _UserEntity;

  bool get isAdmin => role.toUpperCase() == 'ADMIN';
}
