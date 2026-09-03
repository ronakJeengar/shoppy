import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/currrent_user_model.dart';
import 'package:shopp_app/data/models/notification_model.dart';

class NotificationPaginatedResult {
  final List<NotificationModel> notifications;
  final int unreadCount;
  final int page;
  final int limit;
  final int totalNotifications;
  final int totalPages;
  final bool hasNextPage;

  NotificationPaginatedResult({
    required this.notifications,
    required this.unreadCount,
    required this.page,
    required this.limit,
    required this.totalNotifications,
    required this.totalPages,
    required this.hasNextPage,
  });
}

class NotificationRepository {
  final Api _api = Api();

  Future<ApiResponse> getNotifications({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _api.getRequest(
        Urls.notifications,
        queryParameters: {'page': page, 'limit': limit},
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final data = apiResponse.data as Map<String, dynamic>;
        final rawList = data['notifications'] as List? ?? [];
        final List<NotificationModel> list = [];
        for (final item in rawList) {
          if (item is Map<String, dynamic>) {
            list.add(NotificationModel.fromJson(item));
          }
        }

        final result = NotificationPaginatedResult(
          notifications: list,
          unreadCount: (data['unreadCount'] is num)
              ? (data['unreadCount'] as num).toInt()
              : 0,
          page: (data['page'] is num) ? (data['page'] as num).toInt() : page,
          limit: (data['limit'] is num) ? (data['limit'] as num).toInt() : limit,
          totalNotifications: (data['totalNotifications'] is num)
              ? (data['totalNotifications'] as num).toInt()
              : list.length,
          totalPages: (data['totalPages'] is num)
              ? (data['totalPages'] as num).toInt()
              : 1,
          hasNextPage: data['hasNextPage'] == true,
        );

        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: result,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('NotificationRepository getNotifications DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load notifications',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('NotificationRepository getNotifications error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> markAsRead(String id) async {
    try {
      final response =
          await _api.patchRequest('${Urls.notifications}/$id/read');
      final apiResponse = ApiResponse.fromJson(response.data);
      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final notif = NotificationModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: notif,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('NotificationRepository markAsRead error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to mark notification read',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> markAllAsRead() async {
    try {
      final response =
          await _api.postRequest('${Urls.notifications}/read-all');
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('NotificationRepository markAllAsRead error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to mark all as read',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> registerDeviceToken(
    String deviceToken, {
    String platform = 'ANDROID',
  }) async {
    try {
      final response = await _api.postRequest(
        Urls.notificationDevices,
        data: {'deviceToken': deviceToken, 'platform': platform},
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('NotificationRepository registerDeviceToken error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to register device',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> unregisterDeviceToken(String deviceToken) async {
    try {
      final response = await _api.deleteRequest(
        '${Urls.notificationDevices}/$deviceToken',
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('NotificationRepository unregisterDeviceToken error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to unregister device',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> getPreferences() async {
    try {
      final response =
          await _api.getRequest(Urls.notificationPreferences);
      final apiResponse = ApiResponse.fromJson(response.data);
      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final prefs = NotificationPreferencesModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: prefs,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('NotificationRepository getPreferences error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to get preferences',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> updatePreferences(Map<String, dynamic> data) async {
    try {
      final response = await _api.patchRequest(
        Urls.notificationPreferences,
        data: data,
      );
      final apiResponse = ApiResponse.fromJson(response.data);
      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final prefs = NotificationPreferencesModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: prefs,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('NotificationRepository updatePreferences error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to update preferences',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }
}
