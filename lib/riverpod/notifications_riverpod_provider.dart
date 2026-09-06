import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/currrent_user_model.dart';
import 'package:shopp_app/data/models/notification_model.dart';
import 'package:shopp_app/data/repositories/notification_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';
import 'package:shopp_app/riverpod/di_providers.dart';

export 'di_providers.dart';

class NotificationsState {
  final UiState<List<NotificationModel>> notificationsState;
  final int unreadCount;
  final NotificationPreferencesModel preferences;
  final bool hasMore;
  final int currentPage;
  final String? errorMessage;

  const NotificationsState({
    required this.notificationsState,
    this.unreadCount = 0,
    required this.preferences,
    this.hasMore = true,
    this.currentPage = 1,
    this.errorMessage,
  });

  factory NotificationsState.initial() => NotificationsState(
        notificationsState: const UiState.initial(),
        preferences: NotificationPreferencesModel(),
      );

  NotificationsState copyWith({
    UiState<List<NotificationModel>>? notificationsState,
    int? unreadCount,
    NotificationPreferencesModel? preferences,
    bool? hasMore,
    int? currentPage,
    String? errorMessage,
  }) {
    return NotificationsState(
      notificationsState: notificationsState ?? this.notificationsState,
      unreadCount: unreadCount ?? this.unreadCount,
      preferences: preferences ?? this.preferences,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      errorMessage: errorMessage,
    );
  }
}

class NotificationsNotifier extends StateNotifier<NotificationsState> {
  final NotificationRepository _repository;

  NotificationsNotifier(this._repository) : super(NotificationsState.initial()) {
    loadNotifications();
    loadPreferences();
  }

  Future<void> loadNotifications({bool refresh = false}) async {
    final int targetPage = refresh ? 1 : state.currentPage;
    if (refresh) {
      state = state.copyWith(
        notificationsState: const UiState.loading(),
        currentPage: 1,
        hasMore: true,
        errorMessage: null,
      );
    } else {
      state = state.copyWith(notificationsState: const UiState.loading());
    }

    try {
      final response = await _repository.getNotifications(
        page: targetPage,
        limit: 20,
      );

      if (response.status && response.data is NotificationPaginatedResult) {
        final result = response.data as NotificationPaginatedResult;
        if (result.notifications.isEmpty && targetPage == 1) {
          state = state.copyWith(
            notificationsState:
                const UiState.empty('You have no notifications yet'),
            unreadCount: 0,
            hasMore: false,
          );
        } else {
          final List<NotificationModel> updatedList = refresh
              ? result.notifications
              : [
                  ...(state.notificationsState.dataOrNull ?? []),
                  ...result.notifications,
                ];

          state = state.copyWith(
            notificationsState: UiState.success(updatedList),
            unreadCount: result.unreadCount,
            hasMore: result.hasNextPage,
            currentPage: targetPage,
          );
        }
      } else {
        state = state.copyWith(
          notificationsState: UiState.error(response.message),
          errorMessage: response.message,
        );
      }
    } catch (e) {
      state = state.copyWith(
        notificationsState: UiState.error(e.toString()),
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      final response = await _repository.markAsRead(notificationId);
      if (response.status) {
        final currentList = state.notificationsState.dataOrNull ?? [];
        final updatedList = currentList.map((n) {
          if (n.id == notificationId && !n.isRead) {
            return n.copyWith(isRead: true);
          }
          return n;
        }).toList();

        final newUnread = (state.unreadCount - 1).clamp(0, 999);
        state = state.copyWith(
          notificationsState: UiState.success(updatedList),
          unreadCount: newUnread,
        );
      }
    } catch (_) {}
  }

  Future<void> markAllAsRead() async {
    try {
      final response = await _repository.markAllAsRead();
      if (response.status) {
        final currentList = state.notificationsState.dataOrNull ?? [];
        final updatedList = currentList.map((n) {
          return n.copyWith(isRead: true);
        }).toList();

        state = state.copyWith(
          notificationsState: UiState.success(updatedList),
          unreadCount: 0,
        );
      }
    } catch (_) {}
  }

  Future<void> loadPreferences() async {
    try {
      final response = await _repository.getPreferences();
      if (response.status && response.data is NotificationPreferencesModel) {
        state = state.copyWith(
          preferences: response.data as NotificationPreferencesModel,
        );
      }
    } catch (_) {}
  }

  Future<bool> updatePreferences(NotificationPreferencesModel prefs) async {
    try {
      final response = await _repository.updatePreferences(prefs.toJson());
      if (response.status) {
        state = state.copyWith(preferences: prefs);
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}

final notificationsStateProvider =
    StateNotifierProvider<NotificationsNotifier, NotificationsState>((ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return NotificationsNotifier(repository);
});

final unreadNotificationsCountProvider = Provider<int>((ref) {
  return ref.watch(notificationsStateProvider).unreadCount;
});
