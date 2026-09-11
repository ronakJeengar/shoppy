import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_dashboard_entity.freezed.dart';

@freezed
abstract class AdminRecentOrderEntity with _$AdminRecentOrderEntity {
  const factory AdminRecentOrderEntity({
    required String id,
    required String orderNumber,
    required String customerName,
    required String customerEmail,
    required double totalAmount,
    required String status,
    required int itemsCount,
    required DateTime createdAt,
  }) = _AdminRecentOrderEntity;
}

@freezed
abstract class AdminDashboardMetricsEntity with _$AdminDashboardMetricsEntity {
  const factory AdminDashboardMetricsEntity({
    required int totalUsers,
    required int totalProducts,
    required int totalOrders,
    required double totalRevenue,
    required int lowStockProducts,
    @Default({}) Map<String, int> ordersByStatus,
    @Default([]) List<AdminRecentOrderEntity> recentOrders,
  }) = _AdminDashboardMetricsEntity;
}
