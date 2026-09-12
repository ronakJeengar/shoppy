import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_entity.freezed.dart';

@freezed
abstract class PaymentEntity with _$PaymentEntity {
  const factory PaymentEntity({
    required String id,
    required String orderId,
    required String transactionId,
    @Default('SIMULATED') String provider,
    @Default('CARD') String paymentMethod,
    required double amount,
    @Default('INR') String currency,
    @Default('PENDING') String status,
  }) = _PaymentEntity;
}
