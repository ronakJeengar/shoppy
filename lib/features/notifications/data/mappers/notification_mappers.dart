import '../models/notification_model.dart';
import '../../domain/entities/notification_entity.dart';

extension NotificationModelMapper on NotificationModel {
  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      type: type,
      title: title,
      body: body,
      orderId: orderId,
      orderNumber: orderNumber,
      isRead: isRead,
      createdAt: createdAt,
    );
  }
}

extension NotificationEntityMapper on NotificationEntity {
  NotificationModel toModel() {
    return NotificationModel(
      id: id,
      type: type,
      title: title,
      body: body,
      orderId: orderId,
      orderNumber: orderNumber,
      isRead: isRead,
      createdAt: createdAt,
    );
  }
}

extension NotificationPaginatedModelMapper on NotificationPaginatedModel {
  NotificationPaginatedEntity toEntity() {
    return NotificationPaginatedEntity(
      notifications: notifications.map((n) => n.toEntity()).toList(),
      unreadCount: unreadCount,
      page: page,
      limit: limit,
      totalNotifications: totalNotifications,
      totalPages: totalPages,
      hasNextPage: hasNextPage,
    );
  }
}

extension NotificationPaginatedEntityMapper on NotificationPaginatedEntity {
  NotificationPaginatedModel toModel() {
    return NotificationPaginatedModel(
      notifications: notifications.map((n) => n.toModel()).toList(),
      unreadCount: unreadCount,
      page: page,
      limit: limit,
      totalNotifications: totalNotifications,
      totalPages: totalPages,
      hasNextPage: hasNextPage,
    );
  }
}
