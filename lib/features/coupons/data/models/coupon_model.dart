import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_model.freezed.dart';

@freezed
abstract class AppliedCouponModel with _$AppliedCouponModel {
  const factory AppliedCouponModel({
    required String code,
    @Default('') String name,
    @Default('') String description,
    @Default('PERCENTAGE') String discountType,
    @Default(0.0) double discountValue,
    @Default(0.0) double discountAmount,
    DateTime? expiresAt,
  }) = _AppliedCouponModel;

  factory AppliedCouponModel.fromJson(Map<String, dynamic> json) {
    return AppliedCouponModel(
      code: json['code']?.toString().toUpperCase() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      discountType: json['discountType']?.toString() ?? 'PERCENTAGE',
      discountValue: (json['discountValue'] is num)
          ? (json['discountValue'] as num).toDouble()
          : 0.0,
      discountAmount: (json['discountAmount'] is num)
          ? (json['discountAmount'] as num).toDouble()
          : 0.0,
      expiresAt: json['expiresAt'] != null
          ? DateTime.tryParse(json['expiresAt'].toString())
          : null,
    );
  }
}

@freezed
abstract class CouponModel with _$CouponModel {
  const factory CouponModel({
    required String code,
    required String name,
    @Default('') String description,
    required String discountType,
    required double discountValue,
    @Default(0.0) double minimumOrderValue,
    double? maximumDiscountAmount,
    DateTime? expiresAt,
    @Default(true) bool isActive,
    @Default(false) bool firstOrderOnly,
  }) = _CouponModel;

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      code: json['code']?.toString().toUpperCase() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      discountType: json['discountType']?.toString() ?? 'PERCENTAGE',
      discountValue: (json['discountValue'] is num)
          ? (json['discountValue'] as num).toDouble()
          : 0.0,
      minimumOrderValue: (json['minimumOrderValue'] is num)
          ? (json['minimumOrderValue'] as num).toDouble()
          : 0.0,
      maximumDiscountAmount: (json['maximumDiscountAmount'] is num)
          ? (json['maximumDiscountAmount'] as num).toDouble()
          : null,
      expiresAt: json['expiresAt'] != null
          ? DateTime.tryParse(json['expiresAt'].toString())
          : null,
      isActive: json['isActive'] == true || json['isActive'] == null,
      firstOrderOnly: json['firstOrderOnly'] == true,
    );
  }
}
