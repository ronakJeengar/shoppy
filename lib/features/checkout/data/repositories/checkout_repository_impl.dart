import 'package:dio/dio.dart';
import 'package:shopp_app/core/errors/failures.dart';
import 'package:shopp_app/core/utils/result.dart';
import 'package:shopp_app/features/checkout/data/mappers/checkout_mappers.dart';
import 'package:shopp_app/features/checkout/domain/entities/checkout_entity.dart';
import 'package:shopp_app/features/checkout/domain/entities/payment_entity.dart';
import 'package:shopp_app/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:shopp_app/features/orders/data/mappers/order_mappers.dart';
import 'package:shopp_app/features/orders/data/models/order_model.dart';
import 'package:shopp_app/features/orders/domain/entities/order_entity.dart';
import '../datasources/checkout_remote_datasource.dart';
import '../models/payment_model.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutRemoteDataSource _remoteDataSource;

  CheckoutRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<CheckoutValidationEntity>> validateCheckout(
    String addressId, {
    String shippingMethod = 'STANDARD',
  }) async {
    try {
      final model =
          await _remoteDataSource.validateCheckout(addressId, shippingMethod);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to validate checkout');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> createOrder({
    required String addressId,
    String shippingMethod = 'STANDARD',
    String paymentMethod = 'CARD',
    String? idempotencyKey,
  }) async {
    try {
      final data = await _remoteDataSource.createOrder(
        addressId: addressId,
        shippingMethod: shippingMethod,
        paymentMethod: paymentMethod,
        idempotencyKey: idempotencyKey,
      );
      final order = OrderModel.fromJson(data['order'] as Map<String, dynamic>);
      PaymentModel? payment;
      if (data['payment'] is Map<String, dynamic>) {
        payment = PaymentModel.fromJson(data['payment'] as Map<String, dynamic>);
      }
      return Success({'order': order.toEntity(), 'payment': payment?.toEntity()});
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to create order');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<PaymentEntity>> processPayment({
    required String orderId,
    required String paymentMethod,
    String? idempotencyKey,
    bool simulateSuccess = true,
  }) async {
    try {
      final payment = await _remoteDataSource.processPayment(
        orderId: orderId,
        paymentMethod: paymentMethod,
        idempotencyKey: idempotencyKey,
        simulateSuccess: simulateSuccess,
      );
      return Success(payment.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Payment processing failed');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<OrderEntity>> confirmOrder({
    required String orderId,
    required String paymentId,
  }) async {
    try {
      final order = await _remoteDataSource.confirmOrder(
        orderId: orderId,
        paymentId: paymentId,
      );
      return Success(order.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Order confirmation failed');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
