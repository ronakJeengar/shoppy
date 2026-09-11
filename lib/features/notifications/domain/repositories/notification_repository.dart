import '../../../../core/utils/result.dart';
import '../entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<Result<NotificationPaginatedEntity>> getNotifications({
    int page = 1,
    int limit = 20,
  });

  Future<Result<void>> markAsRead(String id);
  Future<Result<void>> markAllAsRead();
  Future<Result<int>> getUnreadCount();
}
