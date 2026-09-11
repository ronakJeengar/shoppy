import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String type,
    required String title,
    required String body,
    String? orderId,
    String? orderNumber,
    @Default(false) bool isRead,
    required DateTime createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];
    String? parsedOrderId;
    String? parsedOrderNumber;

    if (rawData is Map<String, dynamic>) {
      parsedOrderId = rawData['orderId']?.toString();
      parsedOrderNumber = rawData['orderNumber']?.toString();
    }

    DateTime parsedDate = DateTime.now();
    if (json['createdAt'] != null) {
      parsedDate = DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now();
    }

    return NotificationModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      type: json['type']?.toString() ?? 'SYSTEM',
      title: json['title']?.toString() ?? 'Notification',
      body: json['body']?.toString() ?? '',
      orderId: parsedOrderId,
      orderNumber: parsedOrderNumber,
      isRead: json['isRead'] == true,
      createdAt: parsedDate,
    );
  }
}

extension NotificationModelX on NotificationModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      '_id': id,
      'type': type,
      'title': title,
      'body': body,
      'data': {
        if (orderId != null) 'orderId': orderId,
        if (orderNumber != null) 'orderNumber': orderNumber,
      },
      'isRead': isRead,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

@freezed
abstract class NotificationPaginatedModel with _$NotificationPaginatedModel {
  const factory NotificationPaginatedModel({
    @Default([]) List<NotificationModel> notifications,
    @Default(0) int unreadCount,
    @Default(1) int page,
    @Default(20) int limit,
    @Default(0) int totalNotifications,
    @Default(1) int totalPages,
    @Default(false) bool hasNextPage,
  }) = _NotificationPaginatedModel;

  factory NotificationPaginatedModel.fromJson(Map<String, dynamic> json) {
    final rawList = json['notifications'] ?? json['items'] ?? [];
    final List<NotificationModel> list = [];
    if (rawList is List) {
      for (final item in rawList) {
        if (item is Map<String, dynamic>) {
          list.add(NotificationModel.fromJson(item));
        }
      }
    }

    final pagination = json['pagination'] as Map<String, dynamic>?;
    final int page = pagination?['page'] is int
        ? pagination!['page'] as int
        : (int.tryParse(pagination?['page']?.toString() ?? '1') ?? 1);
    final int limit = pagination?['limit'] is int
        ? pagination!['limit'] as int
        : (int.tryParse(pagination?['limit']?.toString() ?? '20') ?? 20);
    final int total = pagination?['total'] is int
        ? pagination!['total'] as int
        : (int.tryParse(pagination?['total']?.toString() ?? '0') ?? list.length);
    final int pages = pagination?['pages'] is int
        ? pagination!['pages'] as int
        : (int.tryParse(pagination?['pages']?.toString() ?? '1') ?? 1);

    return NotificationPaginatedModel(
      notifications: list,
      unreadCount: json['unreadCount'] is int
          ? json['unreadCount'] as int
          : (int.tryParse(json['unreadCount']?.toString() ?? '0') ?? 0),
      page: page,
      limit: limit,
      totalNotifications: total,
      totalPages: pages,
      hasNextPage: page < pages,
    );
  }
}
