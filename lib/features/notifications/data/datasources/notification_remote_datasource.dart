import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/network/api_client.dart';
import 'package:shopp_app/data/models/notification_model.dart';
import '../../domain/repositories/notification_repository.dart';

abstract class NotificationRemoteDataSource {
  Future<NotificationPaginatedEntity> getNotifications(int page, int limit);
  Future<void> markAsRead(String id);
  Future<void> markAllAsRead();
  Future<int> getUnreadCount();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiClient _client;

  NotificationRemoteDataSourceImpl(this._client);

  @override
  Future<NotificationPaginatedEntity> getNotifications(
      int page, int limit) async {
    final response = await _client.get(
      Urls.notifications,
      queryParameters: {'page': page, 'limit': limit},
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    final rawList = map['notifications'] as List? ?? [];
    final List<NotificationModel> list = [];
    for (final item in rawList) {
      if (item is Map<String, dynamic>) {
        list.add(NotificationModel.fromJson(item));
      }
    }

    return NotificationPaginatedEntity(
      notifications: list,
      unreadCount: (map['unreadCount'] is num)
          ? (map['unreadCount'] as num).toInt()
          : 0,
      page: (map['page'] is num) ? (map['page'] as num).toInt() : page,
      limit: (map['limit'] is num) ? (map['limit'] as num).toInt() : limit,
      totalNotifications: (map['totalNotifications'] is num)
          ? (map['totalNotifications'] as num).toInt()
          : list.length,
      totalPages: (map['totalPages'] is num)
          ? (map['totalPages'] as num).toInt()
          : 1,
      hasNextPage: map['hasNextPage'] == true,
    );
  }

  @override
  Future<void> markAsRead(String id) async {
    await _client.patch('${Urls.notifications}/$id/read');
  }

  @override
  Future<void> markAllAsRead() async {
    await _client.post('${Urls.notifications}/read-all');
  }

  @override
  Future<int> getUnreadCount() async {
    final paginated = await getNotifications(1, 1);
    return paginated.unreadCount;
  }
}
