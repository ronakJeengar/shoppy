import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/tax_breakdown_entity.dart';

part 'tax_breakdown_model.freezed.dart';

@freezed
abstract class TaxBreakdownModel with _$TaxBreakdownModel {
  const TaxBreakdownModel._();

  const factory TaxBreakdownModel({
    @Default(0.0) double taxableAmount,
    @Default(0.0) double cgst,
    @Default(0.0) double sgst,
    @Default(0.0) double igst,
    @Default(0.0) double totalTax,
    @Default(false) bool isInterState,
    @Default('KARNATAKA') String originState,
    @Default('') String customerState,
  }) = _TaxBreakdownModel;

  factory TaxBreakdownModel.fromJson(Map<String, dynamic> json) {
    return TaxBreakdownModel(
      taxableAmount: (json['taxableAmount'] is num)
          ? (json['taxableAmount'] as num).toDouble()
          : 0.0,
      cgst: (json['cgst'] is num) ? (json['cgst'] as num).toDouble() : 0.0,
      sgst: (json['sgst'] is num) ? (json['sgst'] as num).toDouble() : 0.0,
      igst: (json['igst'] is num) ? (json['igst'] as num).toDouble() : 0.0,
      totalTax: (json['totalTax'] is num)
          ? (json['totalTax'] as num).toDouble()
          : 0.0,
      isInterState: json['isInterState'] == true,
      originState: json['originState']?.toString() ?? 'KARNATAKA',
      customerState: json['customerState']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taxableAmount': taxableAmount,
      'cgst': cgst,
      'sgst': sgst,
      'igst': igst,
      'totalTax': totalTax,
      'isInterState': isInterState,
      'originState': originState,
      'customerState': customerState,
    };
  }

  TaxBreakdownEntity toEntity() {
    return TaxBreakdownEntity(
      taxableAmount: taxableAmount,
      cgst: cgst,
      sgst: sgst,
      igst: igst,
      totalTax: totalTax,
      isInterState: isInterState,
      originState: originState,
      customerState: customerState,
    );
  }

  static TaxBreakdownModel fromEntity(TaxBreakdownEntity entity) {
    return TaxBreakdownModel(
      taxableAmount: entity.taxableAmount,
      cgst: entity.cgst,
      sgst: entity.sgst,
      igst: entity.igst,
      totalTax: entity.totalTax,
      isInterState: entity.isInterState,
      originState: entity.originState,
      customerState: entity.customerState,
    );
  }
}
