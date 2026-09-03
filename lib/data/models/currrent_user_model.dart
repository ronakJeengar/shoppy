class NotificationPreferencesModel {
  final bool orderUpdates;
  final bool promotions;
  final bool wishlistAlerts;

  NotificationPreferencesModel({
    this.orderUpdates = true,
    this.promotions = true,
    this.wishlistAlerts = true,
  });

  factory NotificationPreferencesModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return NotificationPreferencesModel();
    return NotificationPreferencesModel(
      orderUpdates: json['orderUpdates'] ?? true,
      promotions: json['promotions'] ?? true,
      wishlistAlerts: json['wishlistAlerts'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderUpdates': orderUpdates,
      'promotions': promotions,
      'wishlistAlerts': wishlistAlerts,
    };
  }

  NotificationPreferencesModel copyWith({
    bool? orderUpdates,
    bool? promotions,
    bool? wishlistAlerts,
  }) {
    return NotificationPreferencesModel(
      orderUpdates: orderUpdates ?? this.orderUpdates,
      promotions: promotions ?? this.promotions,
      wishlistAlerts: wishlistAlerts ?? this.wishlistAlerts,
    );
  }
}

class CurrentUserModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String avatar;
  final String phone;
  final NotificationPreferencesModel notificationPreferences;

  CurrentUserModel({
    required this.id,
    required this.name,
    required this.email,
    this.role = 'CUSTOMER',
    this.avatar = '',
    this.phone = '',
    NotificationPreferencesModel? notificationPreferences,
  }) : notificationPreferences =
            notificationPreferences ?? NotificationPreferencesModel();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      '_id': id,
      'name': name,
      'fullName': name,
      'email': email,
      'role': role,
      'avatar': avatar,
      'phone': phone,
      'notificationPreferences': notificationPreferences.toJson(),
    };
  }

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) {
    return CurrentUserModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      name: (json['name'] ?? json['fullName'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      role: (json['role'] ?? 'CUSTOMER').toString(),
      avatar: (json['avatar'] ?? '').toString(),
      phone: (json['phone'] ?? '').toString(),
      notificationPreferences: NotificationPreferencesModel.fromJson(
        json['notificationPreferences'] is Map<String, dynamic>
            ? json['notificationPreferences'] as Map<String, dynamic>
            : null,
      ),
    );
  }

  CurrentUserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? avatar,
    String? phone,
    NotificationPreferencesModel? notificationPreferences,
  }) {
    return CurrentUserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      avatar: avatar ?? this.avatar,
      phone: phone ?? this.phone,
      notificationPreferences:
          notificationPreferences ?? this.notificationPreferences,
    );
  }
}
