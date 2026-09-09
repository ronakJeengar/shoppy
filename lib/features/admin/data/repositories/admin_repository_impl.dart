import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../../../data/models/admin_dashboard_model.dart';
import '../../../../data/models/admin_user_model.dart';
import '../../../../data/models/order_model.dart';
import '../../../../data/models/product_model.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_remote_datasource.dart';

class AdminRepositoryImpl implements AdminRepository {
  final AdminRemoteDataSource _remoteDataSource;

  AdminRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<AdminDashboardMetrics>> getDashboardMetrics() async {
    try {
      final metrics = await _remoteDataSource.getDashboardMetrics();
      return Success(metrics);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load dashboard metrics');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getAdminProducts({
    int page = 1,
    int limit = 20,
    String? search,
    String? category,
    String? status,
    bool? lowStock,
  }) async {
    try {
      final res = await _remoteDataSource.getAdminProducts(
        page: page,
        limit: limit,
        search: search,
        category: category,
        status: status,
        lowStock: lowStock,
      );
      return Success(res);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load products');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<Product>> createProduct(Map<String, dynamic> data) async {
    try {
      final product = await _remoteDataSource.createProduct(data);
      return Success(product);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to create product');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<Product>> updateProduct(
      String id, Map<String, dynamic> data) async {
    try {
      final product = await _remoteDataSource.updateProduct(id, data);
      return Success(product);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update product');
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
  Future<Result<Map<String, dynamic>>> getAdminOrders({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
  }) async {
    try {
      final res = await _remoteDataSource.getAdminOrders(
        page: page,
        limit: limit,
        status: status,
        search: search,
      );
      return Success(res);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load orders');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<OrderModel>> updateOrderStatus(
    String id,
    String status, {
    String? trackingNumber,
    String? carrier,
  }) async {
    try {
      final order = await _remoteDataSource.updateOrderStatus(
        id,
        status,
        trackingNumber: trackingNumber,
        carrier: carrier,
      );
      return Success(order);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update order status');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getAdminUsers({
    int page = 1,
    int limit = 20,
    String? role,
    String? search,
  }) async {
    try {
      final res = await _remoteDataSource.getAdminUsers(
        page: page,
        limit: limit,
        role: role,
        search: search,
      );
      return Success(res);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load users');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<AdminUserModel>> updateUserRole(
      String id, String role) async {
    try {
      final user = await _remoteDataSource.updateUserRole(id, role);
      return Success(user);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update user role');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<AdminUserModel>> toggleUserStatus(
      String id, bool isActive) async {
    try {
      final user = await _remoteDataSource.toggleUserStatus(id, isActive);
      return Success(user);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update user status');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getAdminReviews({
    int page = 1,
    int limit = 20,
    int? rating,
    String? search,
  }) async {
    try {
      final res = await _remoteDataSource.getAdminReviews(
        page: page,
        limit: limit,
        rating: rating,
        search: search,
      );
      return Success(res);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load reviews');
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
  Future<Result<Map<String, dynamic>>> getAuditLogs({
    int page = 1,
    int limit = 30,
    String? action,
    String? targetType,
  }) async {
    try {
      final res = await _remoteDataSource.getAuditLogs(
        page: page,
        limit: limit,
        action: action,
        targetType: targetType,
      );
      return Success(res);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load audit logs');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
