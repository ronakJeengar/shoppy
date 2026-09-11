import '../../../../core/utils/result.dart';
import '../entities/admin_dashboard_entity.dart';
import '../entities/admin_user_entity.dart';
import '../entities/audit_log_entity.dart';
import '../../../catalog/domain/entities/product_entity.dart';
import '../../../catalog/domain/entities/category_entity.dart';
import '../../../orders/domain/entities/order_entity.dart';
import '../../../reviews/domain/entities/review_entity.dart';

abstract class AdminRepository {
  Future<Result<AdminDashboardMetricsEntity>> getDashboardMetrics();

  Future<Result<List<ProductEntity>>> getAdminProducts({
    int page = 1,
    int limit = 20,
    String? search,
    String? category,
    String? status,
    bool? lowStock,
  });

  Future<Result<List<CategoryEntity>>> getAdminCategories();

  Future<Result<ProductEntity>> createProduct(Map<String, dynamic> data);
  Future<Result<ProductEntity>> updateProduct(String id, Map<String, dynamic> data);
  Future<Result<ProductEntity>> updateProductStock(String id, int quantity, String operation);
  Future<Result<void>> deleteProduct(String id);

  Future<Result<List<OrderEntity>>> getAdminOrders({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
  });

  Future<Result<OrderEntity>> updateOrderStatus(
    String id, {
    required String status,
    String? trackingNumber,
    String? carrier,
    String? note,
  });

  Future<Result<List<AdminUserEntity>>> getAdminUsers({
    int page = 1,
    int limit = 20,
    String? role,
    String? search,
  });

  Future<Result<AdminUserEntity>> updateUserRole(String id, String role);
  Future<Result<AdminUserEntity>> toggleUserStatus(String id, bool isActive);

  Future<Result<List<AdminReviewEntity>>> getAdminReviews({
    int page = 1,
    int limit = 20,
    int? rating,
    String? status,
    String? search,
  });

  Future<Result<bool>> updateAdminReviewStatus(
    String reviewId, {
    required String status,
    String? reason,
  });

  Future<Result<void>> deleteAdminReview(String id);

  Future<Result<List<AuditLogEntity>>> getAuditLogs({
    int page = 1,
    int limit = 30,
    String? action,
    String? targetType,
  });
}
