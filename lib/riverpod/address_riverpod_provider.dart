import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/address_model.dart';
import 'package:shopp_app/data/repositories/address_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';
import 'package:shopp_app/riverpod/di_providers.dart';

export 'di_providers.dart';

class AddressState {
  final UiState<List<AddressModel>> addressesState;
  final AddressModel? selectedAddress;
  final String? errorMessage;

  const AddressState({
    required this.addressesState,
    this.selectedAddress,
    this.errorMessage,
  });

  factory AddressState.initial() => const AddressState(
        addressesState: UiState.initial(),
      );

  AddressState copyWith({
    UiState<List<AddressModel>>? addressesState,
    AddressModel? selectedAddress,
    bool clearSelected = false,
    String? errorMessage,
  }) {
    return AddressState(
      addressesState: addressesState ?? this.addressesState,
      selectedAddress:
          clearSelected ? null : (selectedAddress ?? this.selectedAddress),
      errorMessage: errorMessage,
    );
  }
}

class AddressNotifier extends StateNotifier<AddressState> {
  final AddressRepository _repository;

  AddressNotifier(this._repository) : super(AddressState.initial()) {
    loadAddresses();
  }

  Future<void> loadAddresses() async {
    state = state.copyWith(
      addressesState: const UiState.loading(),
      errorMessage: null,
    );

    try {
      final response = await _repository.getAddresses();
      if (response.status && response.data is List<AddressModel>) {
        final list = response.data as List<AddressModel>;
        if (list.isEmpty) {
          state = state.copyWith(
            addressesState: const UiState.empty('No addresses saved yet'),
            clearSelected: true,
          );
        } else {
          final defaultAddr = list.firstWhere(
            (a) => a.isDefault,
            orElse: () => list.first,
          );
          state = state.copyWith(
            addressesState: UiState.success(list),
            selectedAddress: defaultAddr,
          );
        }
      } else {
        state = state.copyWith(
          addressesState: UiState.error(response.message),
          errorMessage: response.message,
        );
      }
    } catch (e) {
      state = state.copyWith(
        addressesState: UiState.error(e.toString()),
        errorMessage: e.toString(),
      );
    }
  }

  void selectAddress(AddressModel address) {
    state = state.copyWith(selectedAddress: address);
  }

  Future<bool> createAddress(AddressModel address) async {
    try {
      final response = await _repository.createAddress(address.toJson());
      if (response.status) {
        await loadAddresses();
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> updateAddress(String id, AddressModel address) async {
    try {
      final response = await _repository.updateAddress(id, address.toJson());
      if (response.status) {
        await loadAddresses();
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> deleteAddress(String id) async {
    try {
      final response = await _repository.deleteAddress(id);
      if (response.status) {
        await loadAddresses();
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}

final addressStateProvider =
    StateNotifierProvider<AddressNotifier, AddressState>((ref) {
  final repository = ref.watch(addressRepositoryProvider);
  return AddressNotifier(repository);
});

final selectedAddressProvider = Provider<AddressModel?>((ref) {
  return ref.watch(addressStateProvider).selectedAddress;
});
