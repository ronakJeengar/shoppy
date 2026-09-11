import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../datasources/admin_remote_datasource.dart';
import '../mappers/admin_mappers.dart';
import '../../domain/entities/admin_dashboard_entity.dart';
import '../../domain/entities/admin_user_entity.dart';
import '../../domain/entities/audit_log_entity.dart';
import '../../domain/repositories/admin_repository.dart';
import '../../../catalog/data/mappers/catalog_mappers.dart';
import '../../../catalog/domain/entities/product_entity.dart';
import '../../../catalog/domain/entities/category_entity.dart';
import '../../../orders/data/mappers/order_mappers.dart';
import '../../../orders/domain/entities/order_entity.dart';
import '../../../reviews/data/mappers/review_mappers.dart';
import '../../../reviews/domain/entities/review_entity.dart';

class AdminRepositoryImpl implements AdminRepository {
  final AdminRemoteDataSource _remoteDataSource;

  AdminRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<AdminDashboardMetricsEntity>> getDashboardMetrics() async {
    try {
      final metrics = await _remoteDataSource.getDashboardMetrics();
      return Success(metrics.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load dashboard metrics');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<ProductEntity>>> getAdminProducts({
    int page = 1,
    int limit = 20,
    String? search,
    String? category,
    String? status,
    bool? lowStock,
  }) async {
    try {
      final models = await _remoteDataSource.getAdminProducts(
        page: page,
        limit: limit,
        search: search,
        category: category,
        status: status,
        lowStock: lowStock,
      );
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load products');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<CategoryEntity>>> getAdminCategories() async {
    try {
      final models = await _remoteDataSource.getAdminCategories();
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load categories');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<ProductEntity>> createProduct(Map<String, dynamic> data) async {
    try {
      final model = await _remoteDataSource.createProduct(data);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to create product');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<ProductEntity>> updateProduct(
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      final model = await _remoteDataSource.updateProduct(id, data);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update product');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<ProductEntity>> updateProductStock(
    String id,
    int quantity,
    String operation,
  ) async {
    try {
      final model = await _remoteDataSource.updateProductStock(id, quantity, operation);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update product stock');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteProduct(String id) async {
    try {
      await _remoteDataSource.deleteProduct(id);
      return const Success(null);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to delete product');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<OrderEntity>>> getAdminOrders({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
  }) async {
    try {
      final models = await _remoteDataSource.getAdminOrders(
        page: page,
        limit: limit,
        status: status,
        search: search,
      );
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load orders');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<OrderEntity>> updateOrderStatus(
    String id, {
    required String status,
    String? trackingNumber,
    String? carrier,
    String? note,
  }) async {
    try {
      final model = await _remoteDataSource.updateOrderStatus(
        id,
        status: status,
        trackingNumber: trackingNumber,
        carrier: carrier,
        note: note,
      );
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update order status');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<AdminUserEntity>>> getAdminUsers({
    int page = 1,
    int limit = 20,
    String? role,
    String? search,
  }) async {
    try {
      final models = await _remoteDataSource.getAdminUsers(
        page: page,
        limit: limit,
        role: role,
        search: search,
      );
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load users');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<AdminUserEntity>> updateUserRole(
    String id,
    String role,
  ) async {
    try {
      final model = await _remoteDataSource.updateUserRole(id, role);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update user role');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<AdminUserEntity>> toggleUserStatus(
    String id,
    bool isActive,
  ) async {
    try {
      final model = await _remoteDataSource.toggleUserStatus(id, isActive);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update user status');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<AdminReviewEntity>>> getAdminReviews({
    int page = 1,
    int limit = 20,
    int? rating,
    String? status,
    String? search,
  }) async {
    try {
      final models = await _remoteDataSource.getAdminReviews(
        page: page,
        limit: limit,
        rating: rating,
        status: status,
        search: search,
      );
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load reviews');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<bool>> updateAdminReviewStatus(
    String reviewId, {
    required String status,
    String? reason,
  }) async {
    try {
      final success = await _remoteDataSource.updateAdminReviewStatus(
        reviewId,
        status: status,
        reason: reason,
      );
      return Success(success);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update review status');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteAdminReview(String id) async {
    try {
      await _remoteDataSource.deleteAdminReview(id);
      return const Success(null);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to delete review');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<AuditLogEntity>>> getAuditLogs({
    int page = 1,
    int limit = 30,
    String? action,
    String? targetType,
  }) async {
    try {
      final models = await _remoteDataSource.getAuditLogs(
        page: page,
        limit: limit,
        action: action,
        targetType: targetType,
      );
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load audit logs');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
