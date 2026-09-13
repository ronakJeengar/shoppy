import '../../../../core/utils/result.dart';
import '../entities/invoice_entity.dart';
import '../repositories/invoice_repository.dart';

class GetOrderInvoiceUseCase {
  final InvoiceRepository _repository;

  GetOrderInvoiceUseCase(this._repository);

  Future<Result<InvoiceEntity>> call(String orderId) {
    return _repository.getOrderInvoice(orderId);
  }
}

class GetOrderInvoiceHtmlUseCase {
  final InvoiceRepository _repository;

  GetOrderInvoiceHtmlUseCase(this._repository);

  Future<Result<String>> call(String orderId) {
    return _repository.getOrderInvoiceHtml(orderId);
  }
}
