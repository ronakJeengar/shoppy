import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';

@freezed
abstract class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String id,
    required String orderId,
    required String transactionId,
    @Default('SIMULATED') String provider,
    @Default('CARD') String paymentMethod,
    required double amount,
    @Default('USD') String currency,
    @Default('PENDING') String status,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      orderId: json['order']?.toString() ?? json['orderId']?.toString() ?? '',
      transactionId: json['transactionId']?.toString() ?? '',
      provider: json['provider']?.toString() ?? 'SIMULATED',
      paymentMethod: json['paymentMethod']?.toString() ?? 'CARD',
      amount:
          (json['amount'] is num) ? (json['amount'] as num).toDouble() : 0.0,
      currency: json['currency']?.toString() ?? 'USD',
      status: json['status']?.toString() ?? 'PENDING',
    );
  }
}

extension PaymentModelX on PaymentModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'transactionId': transactionId,
      'provider': provider,
      'paymentMethod': paymentMethod,
      'amount': amount,
      'currency': currency,
      'status': status,
    };
  }
}
