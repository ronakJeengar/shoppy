import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/invoice_model.dart';

abstract class InvoiceRemoteDataSource {
  Future<InvoiceModel> getOrderInvoice(String orderId);
  Future<String> getOrderInvoiceHtml(String orderId);
}

class InvoiceRemoteDataSourceImpl implements InvoiceRemoteDataSource {
  final ApiClient _client;

  InvoiceRemoteDataSourceImpl(this._client);

  @override
  Future<InvoiceModel> getOrderInvoice(String orderId) async {
    final response = await _client.get(Urls.orderInvoice(orderId));
    final data = response.data;
    final map = data is Map<String, dynamic> ? (data['data'] ?? data) : data;

    if (map is Map<String, dynamic>) {
      return InvoiceModel.fromJson(map);
    }

    throw Exception('Invalid invoice response format');
  }

  @override
  Future<String> getOrderInvoiceHtml(String orderId) async {
    final response = await _client.get(
      Urls.orderInvoiceHtml(orderId),
    );
    return response.data.toString();
  }
}
