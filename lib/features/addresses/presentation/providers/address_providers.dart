import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import 'package:shopp_app/core/utils/ui_state.dart';
import '../../data/datasources/address_remote_datasource.dart';
import '../../data/repositories/address_repository_impl.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/repositories/address_repository.dart';
import '../../domain/usecases/address_usecases.dart';

final addressRemoteDataSourceProvider = Provider<AddressRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return AddressRemoteDataSourceImpl(client);
});

final addressRepositoryProvider = Provider<AddressRepository>((ref) {
  final remote = ref.watch(addressRemoteDataSourceProvider);
  return AddressRepositoryImpl(remote);
});

final getAddressesUseCaseProvider = Provider<GetAddressesUseCase>((ref) {
  return GetAddressesUseCase(ref.watch(addressRepositoryProvider));
});

final createAddressUseCaseProvider = Provider<CreateAddressUseCase>((ref) {
  return CreateAddressUseCase(ref.watch(addressRepositoryProvider));
});

final updateAddressUseCaseProvider = Provider<UpdateAddressUseCase>((ref) {
  return UpdateAddressUseCase(ref.watch(addressRepositoryProvider));
});

final deleteAddressUseCaseProvider = Provider<DeleteAddressUseCase>((ref) {
  return DeleteAddressUseCase(ref.watch(addressRepositoryProvider));
});

final setDefaultAddressUseCaseProvider = Provider<SetDefaultAddressUseCase>((ref) {
  return SetDefaultAddressUseCase(ref.watch(addressRepositoryProvider));
});

class AddressNotifier extends StateNotifier<UiState<List<AddressEntity>>> {
  final GetAddressesUseCase _getAddressesUseCase;
  final CreateAddressUseCase _createAddressUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;
  final SetDefaultAddressUseCase _setDefaultAddressUseCase;

  AddressNotifier({
    required GetAddressesUseCase getAddressesUseCase,
    required CreateAddressUseCase createAddressUseCase,
    required UpdateAddressUseCase updateAddressUseCase,
    required DeleteAddressUseCase deleteAddressUseCase,
    required SetDefaultAddressUseCase setDefaultAddressUseCase,
  })  : _getAddressesUseCase = getAddressesUseCase,
        _createAddressUseCase = createAddressUseCase,
        _updateAddressUseCase = updateAddressUseCase,
        _deleteAddressUseCase = deleteAddressUseCase,
        _setDefaultAddressUseCase = setDefaultAddressUseCase,
        super(const UiState.initial()) {
    loadAddresses();
  }

  Future<void> loadAddresses() async {
    state = const UiState.loading();
    final result = await _getAddressesUseCase();
    result.fold(
      onSuccess: (list) {
        if (list.isEmpty) {
          state = const UiState.empty('No addresses saved yet');
        } else {
          state = UiState.success(list);
        }
      },
      onFailure: (failure) {
        state = UiState.error(failure.message);
      },
    );
  }

  Future<bool> addAddress(AddressEntity address) async {
    final result = await _createAddressUseCase(address);
    return result.fold(
      onSuccess: (_) {
        loadAddresses();
        return true;
      },
      onFailure: (_) => false,
    );
  }

  Future<bool> updateAddress(String id, AddressEntity address) async {
    final result = await _updateAddressUseCase(id, address);
    return result.fold(
      onSuccess: (_) {
        loadAddresses();
        return true;
      },
      onFailure: (_) => false,
    );
  }

  Future<bool> deleteAddress(String id) async {
    final result = await _deleteAddressUseCase(id);
    return result.fold(
      onSuccess: (_) {
        loadAddresses();
        return true;
      },
      onFailure: (_) => false,
    );
  }

  Future<bool> setDefault(String id) async {
    final result = await _setDefaultAddressUseCase(id);
    return result.fold(
      onSuccess: (_) {
        loadAddresses();
        return true;
      },
      onFailure: (_) => false,
    );
  }
}

final addressNotifierProvider =
    StateNotifierProvider<AddressNotifier, UiState<List<AddressEntity>>>((ref) {
  return AddressNotifier(
    getAddressesUseCase: ref.watch(getAddressesUseCaseProvider),
    createAddressUseCase: ref.watch(createAddressUseCaseProvider),
    updateAddressUseCase: ref.watch(updateAddressUseCaseProvider),
    deleteAddressUseCase: ref.watch(deleteAddressUseCaseProvider),
    setDefaultAddressUseCase: ref.watch(setDefaultAddressUseCaseProvider),
  );
});

final defaultAddressProvider = Provider<AddressEntity?>((ref) {
  final addressState = ref.watch(addressNotifierProvider);
  return addressState.whenOrNull(
    success: (addresses) {
      final defaultAddr = addresses.where((a) => a.isDefault).toList();
      if (defaultAddr.isNotEmpty) return defaultAddr.first;
      return addresses.isNotEmpty ? addresses.first : null;
    },
  );
});

final selectedAddressProvider = StateProvider<AddressEntity?>((ref) {
  return ref.watch(defaultAddressProvider);
});
