import 'package:freezed_annotation/freezed_annotation.dart';

part 'campaign_model.freezed.dart';

@freezed
abstract class CampaignCtaActionModel with _$CampaignCtaActionModel {
  const factory CampaignCtaActionModel({
    @Default('HOME') String type,
    @Default('') String value,
  }) = _CampaignCtaActionModel;

  factory CampaignCtaActionModel.fromJson(Map<String, dynamic> json) {
    return CampaignCtaActionModel(
      type: json['type']?.toString().toUpperCase() ?? 'HOME',
      value: json['value']?.toString() ?? '',
    );
  }
}

@freezed
abstract class CampaignModel with _$CampaignModel {
  const factory CampaignModel({
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
    CampaignCtaActionModel? ctaAction,
    String? couponCode,
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,
  }) = _CampaignModel;

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    final rawAction = json['ctaAction'];
    CampaignCtaActionModel? action;
    if (rawAction is Map<String, dynamic>) {
      action = CampaignCtaActionModel.fromJson(rawAction);
    } else if (json['targetType'] != null) {
      action = CampaignCtaActionModel(
        type: json['targetType'].toString().toUpperCase(),
        value: json['targetId']?.toString() ?? '',
      );
    }

    final rawMetadata = json['metadata'];
    final meta = rawMetadata is Map<String, dynamic>
        ? rawMetadata
        : (rawMetadata is Map ? Map<String, dynamic>.from(rawMetadata) : <String, dynamic>{});

    return CampaignModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      subtitle: json['subtitle']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      bannerImage: json['bannerImage']?.toString() ?? '',
      mobileImage: json['mobileImage']?.toString() ?? json['bannerImage']?.toString() ?? '',
      desktopImage: json['desktopImage']?.toString() ?? json['bannerImage']?.toString() ?? '',
      campaignType: json['campaignType']?.toString().toUpperCase() ?? 'GENERAL',
      startAt: json['startAt'] != null ? DateTime.tryParse(json['startAt'].toString()) : null,
      endAt: json['endAt'] != null ? DateTime.tryParse(json['endAt'].toString()) : null,
      isActive: json['isActive'] != false,
      priority: (json['priority'] is num) ? (json['priority'] as num).toInt() : 0,
      displayOrder: (json['displayOrder'] is num) ? (json['displayOrder'] as num).toInt() : 0,
      targetType: json['targetType']?.toString().toUpperCase() ?? 'HOME',
      targetId: json['targetId']?.toString() ?? '',
      ctaLabel: json['ctaLabel']?.toString() ?? 'Shop Now',
      ctaAction: action,
      couponCode: json['couponCode']?.toString().toUpperCase(),
      metadata: meta,
    );
  }
}
