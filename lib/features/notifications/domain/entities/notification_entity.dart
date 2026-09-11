import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

@freezed
abstract class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String id,
    required String type,
    required String title,
    required String body,
    String? orderId,
    String? orderNumber,
    @Default(false) bool isRead,
    required DateTime createdAt,
  }) = _NotificationEntity;
}

@freezed
abstract class NotificationPaginatedEntity with _$NotificationPaginatedEntity {
  const factory NotificationPaginatedEntity({
    @Default([]) List<NotificationEntity> notifications,
    @Default(0) int unreadCount,
    @Default(1) int page,
    @Default(20) int limit,
    @Default(0) int totalNotifications,
    @Default(1) int totalPages,
    @Default(false) bool hasNextPage,
  }) = _NotificationPaginatedEntity;
}
