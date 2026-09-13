import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/invoice_remote_datasource.dart';
import '../../data/repositories/invoice_repository_impl.dart';
import '../../domain/entities/invoice_entity.dart';
import '../../domain/repositories/invoice_repository.dart';
import '../../domain/usecases/get_order_invoice_usecase.dart';

final invoiceRemoteDataSourceProvider = Provider<InvoiceRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return InvoiceRemoteDataSourceImpl(client);
});

final invoiceRepositoryProvider = Provider<InvoiceRepository>((ref) {
  final remote = ref.watch(invoiceRemoteDataSourceProvider);
  return InvoiceRepositoryImpl(remote);
});

final getOrderInvoiceUseCaseProvider = Provider<GetOrderInvoiceUseCase>((ref) {
  final repo = ref.watch(invoiceRepositoryProvider);
  return GetOrderInvoiceUseCase(repo);
});

final getOrderInvoiceHtmlUseCaseProvider = Provider<GetOrderInvoiceHtmlUseCase>((ref) {
  final repo = ref.watch(invoiceRepositoryProvider);
  return GetOrderInvoiceHtmlUseCase(repo);
});

final orderInvoiceProvider = FutureProvider.family<InvoiceEntity, String>((ref, orderId) async {
  final useCase = ref.watch(getOrderInvoiceUseCaseProvider);
  final result = await useCase(orderId);

  return result.fold(
    onSuccess: (invoice) => invoice,
    onFailure: (failure) => throw Exception(failure.message),
  );
});

final orderInvoiceHtmlProvider = FutureProvider.family<String, String>((ref, orderId) async {
  final useCase = ref.watch(getOrderInvoiceHtmlUseCaseProvider);
  final result = await useCase(orderId);

  return result.fold(
    onSuccess: (html) => html,
    onFailure: (failure) => throw Exception(failure.message),
  );
});
