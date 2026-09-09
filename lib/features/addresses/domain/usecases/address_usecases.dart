import '../../../../core/utils/result.dart';
import '../entities/address_entity.dart';
import '../repositories/address_repository.dart';

class GetAddressesUseCase {
  final AddressRepository _repository;

  GetAddressesUseCase(this._repository);

  Future<Result<List<AddressEntity>>> call() => _repository.getAddresses();
}

class CreateAddressUseCase {
  final AddressRepository _repository;

  CreateAddressUseCase(this._repository);

  Future<Result<AddressEntity>> call(AddressEntity address) =>
      _repository.createAddress(address);
}

class UpdateAddressUseCase {
  final AddressRepository _repository;

  UpdateAddressUseCase(this._repository);

  Future<Result<AddressEntity>> call(String id, AddressEntity address) =>
      _repository.updateAddress(id, address);
}

class DeleteAddressUseCase {
  final AddressRepository _repository;

  DeleteAddressUseCase(this._repository);

  Future<Result<void>> call(String id) => _repository.deleteAddress(id);
}

class SetDefaultAddressUseCase {
  final AddressRepository _repository;

  SetDefaultAddressUseCase(this._repository);

  Future<Result<void>> call(String id) => _repository.setDefaultAddress(id);
}
