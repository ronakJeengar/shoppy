class NotificationModel {
  final String id;
  final String type;
  final String title;
  final String body;
  final String? orderId;
  final String? orderNumber;
  final bool isRead;
  final DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    this.orderId,
    this.orderNumber,
    this.isRead = false,
    required this.createdAt,
  });

  NotificationModel copyWith({
    String? id,
    String? type,
    String? title,
    String? body,
    String? orderId,
    String? orderNumber,
    bool? isRead,
    DateTime? createdAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      body: body ?? this.body,
      orderId: orderId ?? this.orderId,
      orderNumber: orderNumber ?? this.orderNumber,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }

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
