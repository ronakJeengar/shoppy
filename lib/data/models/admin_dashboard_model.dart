class AdminRecentOrder {
  final String id;
  final String orderNumber;
  final String customerName;
  final String customerEmail;
  final double totalAmount;
  final String status;
  final int itemsCount;
  final DateTime createdAt;

  AdminRecentOrder({
    required this.id,
    required this.orderNumber,
    required this.customerName,
    required this.customerEmail,
    required this.totalAmount,
    required this.status,
    required this.itemsCount,
    required this.createdAt,
  });

  factory AdminRecentOrder.fromJson(Map<String, dynamic> json) {
    return AdminRecentOrder(
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

class AdminDashboardMetrics {
  final int totalUsers;
  final int totalProducts;
  final int totalOrders;
  final double totalRevenue;
  final int lowStockProducts;
  final Map<String, int> ordersByStatus;
  final List<AdminRecentOrder> recentOrders;

  AdminDashboardMetrics({
    required this.totalUsers,
    required this.totalProducts,
    required this.totalOrders,
    required this.totalRevenue,
    required this.lowStockProducts,
    required this.ordersByStatus,
    required this.recentOrders,
  });

  factory AdminDashboardMetrics.fromJson(Map<String, dynamic> json) {
    final statusMap = <String, int>{};
    if (json['ordersByStatus'] is Map<String, dynamic>) {
      final rawStatus = json['ordersByStatus'] as Map<String, dynamic>;
      rawStatus.forEach((key, value) {
        if (value is num) {
          statusMap[key] = value.toInt();
        }
      });
    }

    final recentList = <AdminRecentOrder>[];
    if (json['recentOrders'] is List) {
      for (final item in json['recentOrders'] as List) {
        if (item is Map<String, dynamic>) {
          recentList.add(AdminRecentOrder.fromJson(item));
        }
      }
    }

    return AdminDashboardMetrics(
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
