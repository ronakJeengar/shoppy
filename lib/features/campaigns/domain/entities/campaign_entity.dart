import 'package:freezed_annotation/freezed_annotation.dart';

part 'campaign_entity.freezed.dart';

@freezed
abstract class CampaignCtaActionEntity with _$CampaignCtaActionEntity {
  const factory CampaignCtaActionEntity({
    @Default('HOME') String type,
    @Default('') String value,
  }) = _CampaignCtaActionEntity;
}

@freezed
abstract class CampaignEntity with _$CampaignEntity {
  const factory CampaignEntity({
    required String id,
    required String title,
    @Default('') String subtitle,
    @Default('') String description,
    required String bannerImage,
    @Default('') String mobileImage,
    @Default('') String desktopImage,
    @Default('GENERAL') String campaignType,
    DateTime? startAt,
    DateTime? endAt,
    @Default(true) bool isActive,
    @Default(0) int priority,
    @Default(0) int displayOrder,
    @Default('HOME') String targetType,
    @Default('') String targetId,
    @Default('Shop Now') String ctaLabel,
    CampaignCtaActionEntity? ctaAction,
    String? couponCode,
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,
  }) = _CampaignEntity;
}
