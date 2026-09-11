import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_remote_datasource.dart';
import '../mappers/notification_mappers.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;

  NotificationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<NotificationPaginatedEntity>> getNotifications({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final model = await _remoteDataSource.getNotifications(page, limit);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load notifications');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> markAsRead(String id) async {
    try {
      await _remoteDataSource.markAsRead(id);
      return const Success(null);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to mark notification as read');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> markAllAsRead() async {
    try {
      await _remoteDataSource.markAllAsRead();
      return const Success(null);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to mark all as read');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<int>> getUnreadCount() async {
    try {
      final count = await _remoteDataSource.getUnreadCount();
      return Success(count);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to get unread count');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
