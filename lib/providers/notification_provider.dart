import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopp_app/data/models/currrent_user_model.dart';
import 'package:shopp_app/data/models/notification_model.dart';
import 'package:shopp_app/data/repositories/notification_repository.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationRepository _notificationRepository =
      NotificationRepository();

  List<NotificationModel> _notifications = [];
  int _unreadCount = 0;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _currentPage = 1;
  String? _errorMessage;
  NotificationPreferencesModel _preferences = NotificationPreferencesModel();

  List<NotificationModel> get notifications => _notifications;
  int get unreadCount => _unreadCount;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;
  String? get errorMessage => _errorMessage;
  NotificationPreferencesModel get preferences => _preferences;

  NotificationProvider() {
    loadNotifications();
    loadPreferences();
  }

  void clearNotificationState() {
    _notifications = [];
    _unreadCount = 0;
    _isLoading = false;
    _isLoadingMore = false;
    _hasMore = true;
    _currentPage = 1;
    _errorMessage = null;
    _preferences = NotificationPreferencesModel();
    notifyListeners();
  }

  Future<void> loadNotifications({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _notificationRepository.getNotifications(
        page: _currentPage,
        limit: 20,
      );

      if (response.status && response.data is NotificationPaginatedResult) {
        final result = response.data as NotificationPaginatedResult;
        _notifications = result.notifications;
        _unreadCount = result.unreadCount;
        _hasMore = result.hasNextPage;
      } else {
        _errorMessage = response.message;
        _notifications = [];
        _hasMore = false;
      }
    } catch (e) {
      log('NotificationProvider loadNotifications error: $e');
      _errorMessage = 'Could not load notifications';
      _hasMore = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreNotifications() async {
    if (_isLoading || _isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      final nextPage = _currentPage + 1;
      final response = await _notificationRepository.getNotifications(
        page: nextPage,
        limit: 20,
      );

      if (response.status && response.data is NotificationPaginatedResult) {
        final result = response.data as NotificationPaginatedResult;
        _notifications.addAll(result.notifications);
        _unreadCount = result.unreadCount;
        _currentPage = nextPage;
        _hasMore = result.hasNextPage;
      } else {
        _hasMore = false;
      }
    } catch (e) {
      log('NotificationProvider loadMoreNotifications error: $e');
      _hasMore = false;
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> refreshNotifications() async {
    await loadNotifications(refresh: true);
  }

  Future<void> markAsRead(String id) async {
    // Optimistic local update
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1 && !_notifications[index].isRead) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
      if (_unreadCount > 0) _unreadCount--;
      notifyListeners();
    }

    try {
      await _notificationRepository.markAsRead(id);
    } catch (e) {
      log('NotificationProvider markAsRead error: $e');
    }
  }

  Future<void> markAllAsRead() async {
    // Optimistic local update
    _notifications =
        _notifications.map((n) => n.copyWith(isRead: true)).toList();
    _unreadCount = 0;
    notifyListeners();

    try {
      await _notificationRepository.markAllAsRead();
    } catch (e) {
      log('NotificationProvider markAllAsRead error: $e');
    }
  }

  Future<void> loadPreferences() async {
    try {
      final response = await _notificationRepository.getPreferences();
      if (response.status && response.data is NotificationPreferencesModel) {
        _preferences = response.data as NotificationPreferencesModel;
        notifyListeners();
      }
    } catch (e) {
      log('NotificationProvider loadPreferences error: $e');
    }
  }

  Future<bool> updatePreferences({
    bool? orderUpdates,
    bool? promotions,
    bool? wishlistAlerts,
  }) async {
    final updated = _preferences.copyWith(
      orderUpdates: orderUpdates,
      promotions: promotions,
      wishlistAlerts: wishlistAlerts,
    );

    // Optimistic update
    _preferences = updated;
    notifyListeners();

    try {
      final response =
          await _notificationRepository.updatePreferences(updated.toJson());
      if (response.status && response.data is NotificationPreferencesModel) {
        _preferences = response.data as NotificationPreferencesModel;
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      log('NotificationProvider updatePreferences error: $e');
      return false;
    }
  }
}
