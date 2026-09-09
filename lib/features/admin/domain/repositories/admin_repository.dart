import '../../../../core/utils/result.dart';
import '../../../../data/models/admin_dashboard_model.dart';
import '../../../../data/models/admin_user_model.dart';
import '../../../../data/models/order_model.dart';
import '../../../../data/models/product_model.dart';

abstract class AdminRepository {
  Future<Result<AdminDashboardMetrics>> getDashboardMetrics();

  Future<Result<Map<String, dynamic>>> getAdminProducts({
    int page = 1,
    int limit = 20,
    String? search,
    String? category,
    String? status,
    bool? lowStock,
  });

  Future<Result<Product>> createProduct(Map<String, dynamic> data);
  Future<Result<Product>> updateProduct(String id, Map<String, dynamic> data);
  Future<Result<void>> deleteProduct(String id);

  Future<Result<Map<String, dynamic>>> getAdminOrders({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
  });

  Future<Result<OrderModel>> updateOrderStatus(
    String id,
    String status, {
    String? trackingNumber,
    String? carrier,
  });

  Future<Result<Map<String, dynamic>>> getAdminUsers({
    int page = 1,
    int limit = 20,
    String? role,
    String? search,
  });

  Future<Result<AdminUserModel>> updateUserRole(String id, String role);
  Future<Result<AdminUserModel>> toggleUserStatus(String id, bool isActive);

  Future<Result<Map<String, dynamic>>> getAdminReviews({
    int page = 1,
    int limit = 20,
    int? rating,
    String? search,
  });

  Future<Result<void>> deleteAdminReview(String id);

  Future<Result<Map<String, dynamic>>> getAuditLogs({
    int page = 1,
    int limit = 30,
    String? action,
    String? targetType,
  });
}
