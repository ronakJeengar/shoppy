import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_dashboard_model.freezed.dart';

@freezed
abstract class AdminRecentOrderModel with _$AdminRecentOrderModel {
  const factory AdminRecentOrderModel({
    required String id,
    required String orderNumber,
    required String customerName,
    required String customerEmail,
    required double totalAmount,
    required String status,
    required int itemsCount,
    required DateTime createdAt,
  }) = _AdminRecentOrderModel;

  factory AdminRecentOrderModel.fromJson(Map<String, dynamic> json) {
    return AdminRecentOrderModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      orderNumber: json['orderNumber']?.toString() ?? 'ORD-000',
      customerName: json['customerName']?.toString() ?? 'Customer',
      customerEmail: json['customerEmail']?.toString() ?? '',
      totalAmount: (json['totalAmount'] is num)
          ? (json['totalAmount'] as num).toDouble()
          : 0.0,
      status: json['status']?.toString() ?? 'CONFIRMED',
      itemsCount: (json['itemsCount'] is num)
          ? (json['itemsCount'] as num).toInt()
          : 0,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}

extension AdminRecentOrderModelX on AdminRecentOrderModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderNumber': orderNumber,
      'customerName': customerName,
      'customerEmail': customerEmail,
      'totalAmount': totalAmount,
      'status': status,
      'itemsCount': itemsCount,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

@freezed
abstract class AdminDashboardMetricsModel with _$AdminDashboardMetricsModel {
  const factory AdminDashboardMetricsModel({
    required int totalUsers,
    required int totalProducts,
    required int totalOrders,
    required double totalRevenue,
    required int lowStockProducts,
    @Default({}) Map<String, int> ordersByStatus,
    @Default([]) List<AdminRecentOrderModel> recentOrders,
  }) = _AdminDashboardMetricsModel;

  factory AdminDashboardMetricsModel.fromJson(Map<String, dynamic> json) {
    final statusMap = <String, int>{};
    if (json['ordersByStatus'] is Map<String, dynamic>) {
      final rawStatus = json['ordersByStatus'] as Map<String, dynamic>;
      rawStatus.forEach((key, value) {
        if (value is num) {
          statusMap[key] = value.toInt();
        }
      });
    }

    final recentList = <AdminRecentOrderModel>[];
    if (json['recentOrders'] is List) {
      for (final item in json['recentOrders'] as List) {
        if (item is Map<String, dynamic>) {
          recentList.add(AdminRecentOrderModel.fromJson(item));
        }
      }
    }

    return AdminDashboardMetricsModel(
      totalUsers: (json['totalUsers'] is num)
          ? (json['totalUsers'] as num).toInt()
          : 0,
      totalProducts: (json['totalProducts'] is num)
          ? (json['totalProducts'] as num).toInt()
          : 0,
      totalOrders: (json['totalOrders'] is num)
          ? (json['totalOrders'] as num).toInt()
          : 0,
      totalRevenue: (json['totalRevenue'] is num)
          ? (json['totalRevenue'] as num).toDouble()
          : 0.0,
      lowStockProducts: (json['lowStockProducts'] is num)
          ? (json['lowStockProducts'] as num).toInt()
          : 0,
      ordersByStatus: statusMap,
      recentOrders: recentList,
    );
  }
}

extension AdminDashboardMetricsModelX on AdminDashboardMetricsModel {
  Map<String, dynamic> toJson() {
    return {
      'totalUsers': totalUsers,
      'totalProducts': totalProducts,
      'totalOrders': totalOrders,
      'totalRevenue': totalRevenue,
      'lowStockProducts': lowStockProducts,
      'ordersByStatus': ordersByStatus,
      'recentOrders': recentOrders.map((o) => o.toJson()).toList(),
    };
  }
}

typedef AdminRecentOrder = AdminRecentOrderModel;
typedef AdminDashboardMetrics = AdminDashboardMetricsModel;
