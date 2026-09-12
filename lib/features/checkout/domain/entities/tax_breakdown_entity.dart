import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_breakdown_entity.freezed.dart';

@freezed
abstract class TaxBreakdownEntity with _$TaxBreakdownEntity {
  const TaxBreakdownEntity._();

  const factory TaxBreakdownEntity({
    @Default(0.0) double taxableAmount,
    @Default(0.0) double cgst,
    @Default(0.0) double sgst,
    @Default(0.0) double igst,
    @Default(0.0) double totalTax,
    @Default(false) bool isInterState,
    @Default('KARNATAKA') String originState,
    @Default('') String customerState,
  }) = _TaxBreakdownEntity;
}
