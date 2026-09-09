import '../../../../core/utils/result.dart';
import '../../../../data/models/notification_model.dart';

class NotificationPaginatedEntity {
  final List<NotificationModel> notifications;
  final int unreadCount;
  final int page;
  final int limit;
  final int totalNotifications;
  final int totalPages;
  final bool hasNextPage;

  const NotificationPaginatedEntity({
    required this.notifications,
    required this.unreadCount,
    required this.page,
    required this.limit,
    required this.totalNotifications,
    required this.totalPages,
    required this.hasNextPage,
  });
}

abstract class NotificationRepository {
  Future<Result<NotificationPaginatedEntity>> getNotifications({
    int page = 1,
    int limit = 20,
  });

  Future<Result<void>> markAsRead(String id);
  Future<Result<void>> markAllAsRead();
  Future<Result<int>> getUnreadCount();
}
