import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/flash_sale_model.dart';

abstract class FlashSaleRemoteDataSource {
  Future<List<FlashSaleModel>> getActiveFlashSales({int limit = 10});
  Future<List<FlashSaleModel>> getUpcomingFlashSales({int limit = 10});
  Future<FlashSaleModel> getFlashSaleById(String id);
  Future<FlashSaleItemModel?> getProductFlashSale(String productId);
}

class FlashSaleRemoteDataSourceImpl implements FlashSaleRemoteDataSource {
  final ApiClient _client;

  FlashSaleRemoteDataSourceImpl(this._client);

  @override
  Future<List<FlashSaleModel>> getActiveFlashSales({int limit = 10}) async {
    final response = await _client.get(
      Urls.flashSalesActive,
      queryParameters: {'limit': limit},
    );

    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data);

    DateTime? serverTime;
    if (map is Map<String, dynamic> && map['serverTime'] != null) {
      serverTime = DateTime.tryParse(map['serverTime'].toString());
    }

    final rawList = map is Map<String, dynamic>
        ? (map['flashSales'] ?? map['items'] ?? [])
        : (map is List ? map : []);

    final List<FlashSaleModel> sales = [];
    if (rawList is List) {
      for (final item in rawList) {
        if (item is Map<String, dynamic>) {
          sales.add(FlashSaleModel.fromJson(item, serverTime: serverTime));
        }
      }
    }
    return sales;
  }

  @override
  Future<List<FlashSaleModel>> getUpcomingFlashSales({int limit = 10}) async {
    final response = await _client.get(
      Urls.flashSalesUpcoming,
      queryParameters: {'limit': limit},
    );

    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data);

    DateTime? serverTime;
    if (map is Map<String, dynamic> && map['serverTime'] != null) {
      serverTime = DateTime.tryParse(map['serverTime'].toString());
    }

    final rawList = map is Map<String, dynamic>
        ? (map['flashSales'] ?? map['items'] ?? [])
        : (map is List ? map : []);

    final List<FlashSaleModel> sales = [];
    if (rawList is List) {
      for (final item in rawList) {
        if (item is Map<String, dynamic>) {
          sales.add(FlashSaleModel.fromJson(item, serverTime: serverTime));
        }
      }
    }
    return sales;
  }

  @override
  Future<FlashSaleModel> getFlashSaleById(String id) async {
    final response = await _client.get(Urls.flashSaleDetail(id));
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data);
    return FlashSaleModel.fromJson(map as Map<String, dynamic>);
  }

  @override
  Future<FlashSaleItemModel?> getProductFlashSale(String productId) async {
    final response = await _client.get(Urls.productFlashSale(productId));
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data);

    if (map is Map<String, dynamic>) {
      final isFlash = map['isFlashSale'] == true;
      final flashSaleData = map['flashSale'];
      if (isFlash && flashSaleData is Map<String, dynamic>) {
        final merged = Map<String, dynamic>.from(flashSaleData);
        if (map['serverTime'] != null && merged['serverTime'] == null) {
          merged['serverTime'] = map['serverTime'];
        }
        return FlashSaleItemModel.fromJson(merged);
      }
    }
    return null;
  }
}
