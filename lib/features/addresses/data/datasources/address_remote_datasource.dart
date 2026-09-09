import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../../../../data/models/address_model.dart';

abstract class AddressRemoteDataSource {
  Future<List<AddressModel>> getAddresses();
  Future<AddressModel> createAddress(Map<String, dynamic> data);
  Future<AddressModel> updateAddress(String id, Map<String, dynamic> data);
  Future<void> deleteAddress(String id);
  Future<void> setDefaultAddress(String id);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final ApiClient _client;

  AddressRemoteDataSourceImpl(this._client);

  @override
  Future<List<AddressModel>> getAddresses() async {
    final response = await _client.get(Urls.addresses);
    final data = response.data;
    final list = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as List? ?? [];
    return list
        .map((item) => AddressModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<AddressModel> createAddress(Map<String, dynamic> data) async {
    final response = await _client.post(Urls.addresses, data: data);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return AddressModel.fromJson(map);
  }

  @override
  Future<AddressModel> updateAddress(String id, Map<String, dynamic> data) async {
    final response = await _client.patch('${Urls.addresses}/$id', data: data);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return AddressModel.fromJson(map);
  }

  @override
  Future<void> deleteAddress(String id) async {
    await _client.delete('${Urls.addresses}/$id');
  }

  @override
  Future<void> setDefaultAddress(String id) async {
    await _client.post('${Urls.addresses}/$id/default');
  }
}
