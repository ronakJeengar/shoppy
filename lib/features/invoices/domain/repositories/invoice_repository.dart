import '../../../../core/utils/result.dart';
import '../entities/invoice_entity.dart';

abstract class InvoiceRepository {
  Future<Result<InvoiceEntity>> getOrderInvoice(String orderId);
  Future<Result<String>> getOrderInvoiceHtml(String orderId);
}
