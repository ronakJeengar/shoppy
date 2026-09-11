import '../models/user_model.dart';
import '../../domain/entities/user_entity.dart';

extension UserModelMapper on UserModel {
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
}

extension UserEntityMapper on UserEntity {
  UserModel toModel() {
    return UserModel(
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
}
