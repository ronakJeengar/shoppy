import '../../../../core/utils/result.dart';
import '../entities/address_entity.dart';

abstract class AddressRepository {
  Future<Result<List<AddressEntity>>> getAddresses();
  Future<Result<AddressEntity>> createAddress(AddressEntity address);
  Future<Result<AddressEntity>> updateAddress(String id, AddressEntity address);
  Future<Result<void>> deleteAddress(String id);
  Future<Result<void>> setDefaultAddress(String id);
}
