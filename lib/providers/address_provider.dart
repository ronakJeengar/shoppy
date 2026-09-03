import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopp_app/data/models/address_model.dart';
import 'package:shopp_app/data/repositories/address_repository.dart';

class AddressProvider extends ChangeNotifier {
  final AddressRepository _addressRepository = AddressRepository();

  List<AddressModel> _addresses = [];
  AddressModel? _selectedAddress;
  bool _isLoading = false;
  String? _errorMessage;

  List<AddressModel> get addresses => _addresses;
  AddressModel? get selectedAddress => _selectedAddress;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AddressProvider() {
    loadAddresses();
  }

  void clearAddressState() {
    _addresses = [];
    _selectedAddress = null;
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }

  void selectAddress(AddressModel address) {
    _selectedAddress = address;
    notifyListeners();
  }

  Future<void> loadAddresses() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _addressRepository.getAddresses();
      if (response.status && response.data is List<AddressModel>) {
        _addresses = response.data as List<AddressModel>;

        // Set default selected address
        if (_addresses.isNotEmpty) {
          final defaultAddr = _addresses.firstWhere(
            (a) => a.isDefault,
            orElse: () => _addresses.first,
          );
          _selectedAddress = defaultAddr;
        } else {
          _selectedAddress = null;
        }
      } else {
        _errorMessage = response.message;
        _addresses = [];
        _selectedAddress = null;
      }
    } catch (e) {
      log('AddressProvider loadAddresses error: $e');
      _errorMessage = 'Could not load delivery addresses';
      _addresses = [];
      _selectedAddress = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addAddress(Map<String, dynamic> addressData) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _addressRepository.createAddress(addressData);
      if (response.status && response.data is AddressModel) {
        final newAddress = response.data as AddressModel;
        await loadAddresses();
        _selectedAddress = newAddress;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('AddressProvider addAddress error: $e');
      _errorMessage = 'Failed to add address';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateAddress(
    String id,
    Map<String, dynamic> addressData,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _addressRepository.updateAddress(id, addressData);
      if (response.status) {
        await loadAddresses();
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('AddressProvider updateAddress error: $e');
      _errorMessage = 'Failed to update address';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteAddress(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _addressRepository.deleteAddress(id);
      if (response.status) {
        await loadAddresses();
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('AddressProvider deleteAddress error: $e');
      _errorMessage = 'Failed to delete address';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
