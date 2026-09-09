import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/repositories/address_repository.dart';
import '../datasources/address_remote_datasource.dart';
import '../mappers/address_mappers.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource _remoteDataSource;

  AddressRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<List<AddressEntity>>> getAddresses() async {
    try {
      final models = await _remoteDataSource.getAddresses();
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load delivery addresses');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<AddressEntity>> createAddress(AddressEntity address) async {
    try {
      final model = await _remoteDataSource.createAddress(address.toJson());
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to add address');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<AddressEntity>> updateAddress(
      String id, AddressEntity address) async {
    try {
      final model = await _remoteDataSource.updateAddress(id, address.toJson());
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update address');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteAddress(String id) async {
    try {
      await _remoteDataSource.deleteAddress(id);
      return const Success(null);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to delete address');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> setDefaultAddress(String id) async {
    try {
      await _remoteDataSource.setDefaultAddress(id);
      return const Success(null);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to set default address');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
