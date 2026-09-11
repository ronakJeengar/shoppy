import '../models/admin_dashboard_model.dart';
import '../models/admin_user_model.dart';
import '../models/audit_log_model.dart';
import '../../domain/entities/admin_dashboard_entity.dart';
import '../../domain/entities/admin_user_entity.dart';
import '../../domain/entities/audit_log_entity.dart';

extension AdminRecentOrderModelMapper on AdminRecentOrderModel {
  AdminRecentOrderEntity toEntity() {
    return AdminRecentOrderEntity(
      id: id,
      orderNumber: orderNumber,
      customerName: customerName,
      customerEmail: customerEmail,
      totalAmount: totalAmount,
      status: status,
      itemsCount: itemsCount,
      createdAt: createdAt,
    );
  }
}

extension AdminRecentOrderEntityMapper on AdminRecentOrderEntity {
  AdminRecentOrderModel toModel() {
    return AdminRecentOrderModel(
      id: id,
      orderNumber: orderNumber,
      customerName: customerName,
      customerEmail: customerEmail,
      totalAmount: totalAmount,
      status: status,
      itemsCount: itemsCount,
      createdAt: createdAt,
    );
  }
}

extension AdminDashboardMetricsModelMapper on AdminDashboardMetricsModel {
  AdminDashboardMetricsEntity toEntity() {
    return AdminDashboardMetricsEntity(
      totalUsers: totalUsers,
      totalProducts: totalProducts,
      totalOrders: totalOrders,
      totalRevenue: totalRevenue,
      lowStockProducts: lowStockProducts,
      ordersByStatus: ordersByStatus,
      recentOrders: recentOrders.map((o) => o.toEntity()).toList(),
    );
  }
}

extension AdminDashboardMetricsEntityMapper on AdminDashboardMetricsEntity {
  AdminDashboardMetricsModel toModel() {
    return AdminDashboardMetricsModel(
      totalUsers: totalUsers,
      totalProducts: totalProducts,
      totalOrders: totalOrders,
      totalRevenue: totalRevenue,
      lowStockProducts: lowStockProducts,
      ordersByStatus: ordersByStatus,
      recentOrders: recentOrders.map((o) => o.toModel()).toList(),
    );
  }
}

extension AdminUserModelMapper on AdminUserModel {
  AdminUserEntity toEntity() {
    return AdminUserEntity(
      id: id,
      fullName: fullName,
      email: email,
      username: username,
      phone: phone,
      role: role,
      isActive: isActive,
      createdAt: createdAt,
    );
  }
}

extension AdminUserEntityMapper on AdminUserEntity {
  AdminUserModel toModel() {
    return AdminUserModel(
      id: id,
      fullName: fullName,
      email: email,
      username: username,
      phone: phone,
      role: role,
      isActive: isActive,
      createdAt: createdAt,
    );
  }
}

extension AuditLogModelMapper on AuditLogModel {
  AuditLogEntity toEntity() {
    return AuditLogEntity(
      id: id,
      action: action,
      adminEmail: adminEmail,
      resourceType: resourceType,
      resourceId: resourceId,
      details: details,
      createdAt: createdAt,
    );
  }
}

extension AuditLogEntityMapper on AuditLogEntity {
  AuditLogModel toModel() {
    return AuditLogModel(
      id: id,
      action: action,
      adminEmail: adminEmail,
      resourceType: resourceType,
      resourceId: resourceId,
      details: details,
      createdAt: createdAt,
    );
  }
}
