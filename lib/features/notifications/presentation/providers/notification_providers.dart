import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/utils/ui_state.dart';
import '../../data/datasources/notification_remote_datasource.dart';
import '../../data/repositories/notification_repository_impl.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../domain/usecases/notification_usecases.dart';

final notificationRemoteDataSourceProvider =
    Provider<NotificationRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return NotificationRemoteDataSourceImpl(client);
});

final notificationRepositoryProvider =
    Provider<NotificationRepository>((ref) {
  final remote = ref.watch(notificationRemoteDataSourceProvider);
  return NotificationRepositoryImpl(remote);
});

final getNotificationsUseCaseProvider =
    Provider<GetNotificationsUseCase>((ref) {
  return GetNotificationsUseCase(ref.watch(notificationRepositoryProvider));
});

final markNotificationReadUseCaseProvider =
    Provider<MarkNotificationReadUseCase>((ref) {
  return MarkNotificationReadUseCase(ref.watch(notificationRepositoryProvider));
});

final markAllNotificationsReadUseCaseProvider =
    Provider<MarkAllNotificationsReadUseCase>((ref) {
  return MarkAllNotificationsReadUseCase(
      ref.watch(notificationRepositoryProvider));
});

final getUnreadCountUseCaseProvider = Provider<GetUnreadCountUseCase>((ref) {
  return GetUnreadCountUseCase(ref.watch(notificationRepositoryProvider));
});

class NotificationNotifier
    extends StateNotifier<UiState<List<NotificationEntity>>> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final MarkNotificationReadUseCase _markReadUseCase;
  final MarkAllNotificationsReadUseCase _markAllReadUseCase;
  int _unreadCount = 0;

  NotificationNotifier({
    required GetNotificationsUseCase getNotificationsUseCase,
    required MarkNotificationReadUseCase markReadUseCase,
    required MarkAllNotificationsReadUseCase markAllReadUseCase,
  })  : _getNotificationsUseCase = getNotificationsUseCase,
        _markReadUseCase = markReadUseCase,
        _markAllReadUseCase = markAllReadUseCase,
        super(const UiState.initial()) {
    loadNotifications();
  }

  int get unreadCount => _unreadCount;

  Future<void> loadNotifications() async {
    state = const UiState.loading();
    final result = await _getNotificationsUseCase();
    result.fold(
      onSuccess: (data) {
        _unreadCount = data.unreadCount;
        if (data.notifications.isEmpty) {
          state = const UiState.empty('No notifications yet');
        } else {
          state = UiState.success(data.notifications);
        }
      },
      onFailure: (failure) {
        state = UiState.error(failure.message);
      },
    );
  }

  Future<void> markAsRead(String id) async {
    final currentList = state.dataOrNull ?? [];
    final updatedList = currentList.map((n) {
      if (n.id == id && !n.isRead) {
        if (_unreadCount > 0) _unreadCount--;
        return n.copyWith(isRead: true);
      }
      return n;
    }).toList();

    state = UiState.success(updatedList);
    await _markReadUseCase(id);
  }

  Future<void> markAllAsRead() async {
    final currentList = state.dataOrNull ?? [];
    final updatedList = currentList.map((n) => n.copyWith(isRead: true)).toList();
    _unreadCount = 0;
    state = UiState.success(updatedList);
    await _markAllReadUseCase();
  }
}

final notificationNotifierProvider = StateNotifierProvider<NotificationNotifier,
    UiState<List<NotificationEntity>>>((ref) {
  return NotificationNotifier(
    getNotificationsUseCase: ref.watch(getNotificationsUseCaseProvider),
    markReadUseCase: ref.watch(markNotificationReadUseCaseProvider),
    markAllReadUseCase: ref.watch(markAllNotificationsReadUseCaseProvider),
  );
});

final notificationUnreadCountProvider = Provider<int>((ref) {
  final notifState = ref.watch(notificationNotifierProvider);
  return notifState.whenOrNull(
        success: (list) => list.where((n) => !n.isRead).length,
      ) ??
      0;
});
