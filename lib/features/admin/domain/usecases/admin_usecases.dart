import '../../../../core/utils/result.dart';
import '../../../../data/models/admin_dashboard_model.dart';
import '../../../../data/models/admin_user_model.dart';
import '../../../../data/models/order_model.dart';
import '../../../../data/models/product_model.dart';
import '../repositories/admin_repository.dart';

class GetAdminDashboardMetricsUseCase {
  final AdminRepository _repository;
  GetAdminDashboardMetricsUseCase(this._repository);
  Future<Result<AdminDashboardMetrics>> call() => _repository.getDashboardMetrics();
}

class GetAdminProductsUseCase {
  final AdminRepository _repository;
  GetAdminProductsUseCase(this._repository);
  Future<Result<Map<String, dynamic>>> call({
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

class CreateAdminProductUseCase {
  final AdminRepository _repository;
  CreateAdminProductUseCase(this._repository);
  Future<Result<Product>> call(Map<String, dynamic> data) =>
      _repository.createProduct(data);
}

class UpdateAdminProductUseCase {
  final AdminRepository _repository;
  UpdateAdminProductUseCase(this._repository);
  Future<Result<Product>> call(String id, Map<String, dynamic> data) =>
      _repository.updateProduct(id, data);
}

class DeleteAdminProductUseCase {
  final AdminRepository _repository;
  DeleteAdminProductUseCase(this._repository);
  Future<Result<void>> call(String id) => _repository.deleteProduct(id);
}

class GetAdminOrdersUseCase {
  final AdminRepository _repository;
  GetAdminOrdersUseCase(this._repository);
  Future<Result<Map<String, dynamic>>> call({
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
  Future<Result<OrderModel>> call(
    String id,
    String status, {
    String? trackingNumber,
    String? carrier,
  }) => _repository.updateOrderStatus(
        id,
        status,
        trackingNumber: trackingNumber,
        carrier: carrier,
      );
}

class GetAdminUsersUseCase {
  final AdminRepository _repository;
  GetAdminUsersUseCase(this._repository);
  Future<Result<Map<String, dynamic>>> call({
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
  Future<Result<AdminUserModel>> call(String id, String role) =>
      _repository.updateUserRole(id, role);
}

class ToggleAdminUserStatusUseCase {
  final AdminRepository _repository;
  ToggleAdminUserStatusUseCase(this._repository);
  Future<Result<AdminUserModel>> call(String id, bool isActive) =>
      _repository.toggleUserStatus(id, isActive);
}

class GetAdminReviewsUseCase {
  final AdminRepository _repository;
  GetAdminReviewsUseCase(this._repository);
  Future<Result<Map<String, dynamic>>> call({
    int page = 1,
    int limit = 20,
    int? rating,
    String? search,
  }) => _repository.getAdminReviews(
        page: page,
        limit: limit,
        rating: rating,
        search: search,
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
  Future<Result<Map<String, dynamic>>> call({
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
