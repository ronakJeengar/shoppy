import '../../../../core/utils/result.dart';
import '../repositories/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository _repository;

  GetNotificationsUseCase(this._repository);

  Future<Result<NotificationPaginatedEntity>> call({
    int page = 1,
    int limit = 20,
  }) {
    return _repository.getNotifications(page: page, limit: limit);
  }
}

class MarkNotificationReadUseCase {
  final NotificationRepository _repository;

  MarkNotificationReadUseCase(this._repository);

  Future<Result<void>> call(String id) => _repository.markAsRead(id);
}

class MarkAllNotificationsReadUseCase {
  final NotificationRepository _repository;

  MarkAllNotificationsReadUseCase(this._repository);

  Future<Result<void>> call() => _repository.markAllAsRead();
}

class GetUnreadCountUseCase {
  final NotificationRepository _repository;

  GetUnreadCountUseCase(this._repository);

  Future<Result<int>> call() => _repository.getUnreadCount();
}
