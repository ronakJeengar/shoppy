class PaymentModel {
  final String id;
  final String orderId;
  final String transactionId;
  final String provider;
  final String paymentMethod;
  final double amount;
  final String currency;
  final String status;

  PaymentModel({
    required this.id,
    required this.orderId,
    required this.transactionId,
    required this.provider,
    required this.paymentMethod,
    required this.amount,
    this.currency = 'USD',
    required this.status,
  });

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
