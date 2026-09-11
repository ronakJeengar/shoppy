import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/network/api_client.dart';
import '../models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<NotificationPaginatedModel> getNotifications(int page, int limit);
  Future<void> markAsRead(String id);
  Future<void> markAllAsRead();
  Future<int> getUnreadCount();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiClient _client;

  NotificationRemoteDataSourceImpl(this._client);

  @override
  Future<NotificationPaginatedModel> getNotifications(
      int page, int limit) async {
    final response = await _client.get(
      Urls.notifications,
      queryParameters: {'page': page, 'limit': limit},
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return NotificationPaginatedModel.fromJson(map);
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
