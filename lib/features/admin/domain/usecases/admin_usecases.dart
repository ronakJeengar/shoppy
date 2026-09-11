import '../../../../core/utils/result.dart';
import '../entities/admin_dashboard_entity.dart';
import '../entities/admin_user_entity.dart';
import '../entities/audit_log_entity.dart';
import '../../../catalog/domain/entities/product_entity.dart';
import '../../../catalog/domain/entities/category_entity.dart';
import '../../../orders/domain/entities/order_entity.dart';
import '../../../reviews/domain/entities/review_entity.dart';
import '../repositories/admin_repository.dart';

class GetAdminDashboardMetricsUseCase {
  final AdminRepository _repository;
  GetAdminDashboardMetricsUseCase(this._repository);
  Future<Result<AdminDashboardMetricsEntity>> call() => _repository.getDashboardMetrics();
}

class GetAdminProductsUseCase {
  final AdminRepository _repository;
  GetAdminProductsUseCase(this._repository);
  Future<Result<List<ProductEntity>>> call({
    int page = 1,
    int limit = 20,
    String? search,
    String? category,
    String? status,
    bool? lowStock,
  }) => _repository.getAdminProducts(
        page: page,
        limit: limit,
        search: search,
        category: category,
        status: status,
        lowStock: lowStock,
      );
}

class GetAdminCategoriesUseCase {
  final AdminRepository _repository;
  GetAdminCategoriesUseCase(this._repository);
  Future<Result<List<CategoryEntity>>> call() => _repository.getAdminCategories();
}

class CreateAdminProductUseCase {
  final AdminRepository _repository;
  CreateAdminProductUseCase(this._repository);
  Future<Result<ProductEntity>> call(Map<String, dynamic> data) =>
      _repository.createProduct(data);
}

class UpdateAdminProductUseCase {
  final AdminRepository _repository;
  UpdateAdminProductUseCase(this._repository);
  Future<Result<ProductEntity>> call(String id, Map<String, dynamic> data) =>
      _repository.updateProduct(id, data);
}

class UpdateAdminProductStockUseCase {
  final AdminRepository _repository;
  UpdateAdminProductStockUseCase(this._repository);
  Future<Result<ProductEntity>> call(String id, int quantity, String operation) =>
      _repository.updateProductStock(id, quantity, operation);
}

class DeleteAdminProductUseCase {
  final AdminRepository _repository;
  DeleteAdminProductUseCase(this._repository);
  Future<Result<void>> call(String id) => _repository.deleteProduct(id);
}

class GetAdminOrdersUseCase {
  final AdminRepository _repository;
  GetAdminOrdersUseCase(this._repository);
  Future<Result<List<OrderEntity>>> call({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
  }) => _repository.getAdminOrders(
        page: page,
        limit: limit,
        status: status,
        search: search,
      );
}

class UpdateAdminOrderStatusUseCase {
  final AdminRepository _repository;
  UpdateAdminOrderStatusUseCase(this._repository);
  Future<Result<OrderEntity>> call(
    String id, {
    required String status,
    String? trackingNumber,
    String? carrier,
    String? note,
  }) => _repository.updateOrderStatus(
        id,
        status: status,
        trackingNumber: trackingNumber,
        carrier: carrier,
        note: note,
      );
}

class GetAdminUsersUseCase {
  final AdminRepository _repository;
  GetAdminUsersUseCase(this._repository);
  Future<Result<List<AdminUserEntity>>> call({
    int page = 1,
    int limit = 20,
    String? role,
    String? search,
  }) => _repository.getAdminUsers(
        page: page,
        limit: limit,
        role: role,
        search: search,
      );
}

class UpdateAdminUserRoleUseCase {
  final AdminRepository _repository;
  UpdateAdminUserRoleUseCase(this._repository);
  Future<Result<AdminUserEntity>> call(String id, String role) =>
      _repository.updateUserRole(id, role);
}

class ToggleAdminUserStatusUseCase {
  final AdminRepository _repository;
  ToggleAdminUserStatusUseCase(this._repository);
  Future<Result<AdminUserEntity>> call(String id, bool isActive) =>
      _repository.toggleUserStatus(id, isActive);
}

class GetAdminReviewsUseCase {
  final AdminRepository _repository;
  GetAdminReviewsUseCase(this._repository);
  Future<Result<List<AdminReviewEntity>>> call({
    int page = 1,
    int limit = 20,
    int? rating,
    String? status,
    String? search,
  }) => _repository.getAdminReviews(
        page: page,
        limit: limit,
        rating: rating,
        status: status,
        search: search,
      );
}

class UpdateAdminReviewStatusUseCase {
  final AdminRepository _repository;
  UpdateAdminReviewStatusUseCase(this._repository);
  Future<Result<bool>> call(
    String reviewId, {
    required String status,
    String? reason,
  }) => _repository.updateAdminReviewStatus(
        reviewId,
        status: status,
        reason: reason,
      );
}

class DeleteAdminReviewUseCase {
  final AdminRepository _repository;
  DeleteAdminReviewUseCase(this._repository);
  Future<Result<void>> call(String id) => _repository.deleteAdminReview(id);
}

class GetAdminAuditLogsUseCase {
  final AdminRepository _repository;
  GetAdminAuditLogsUseCase(this._repository);
  Future<Result<List<AuditLogEntity>>> call({
    int page = 1,
    int limit = 30,
    String? action,
    String? targetType,
  }) => _repository.getAuditLogs(
        page: page,
        limit: limit,
        action: action,
        targetType: targetType,
      );
}
