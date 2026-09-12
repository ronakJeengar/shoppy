import '../../domain/entities/campaign_entity.dart';
import '../models/campaign_model.dart';

extension CampaignCtaActionModelMapper on CampaignCtaActionModel {
  CampaignCtaActionEntity toEntity() {
    return CampaignCtaActionEntity(
      type: type,
      value: value,
    );
  }
}

extension CampaignCtaActionEntityMapper on CampaignCtaActionEntity {
  CampaignCtaActionModel toModel() {
    return CampaignCtaActionModel(
      type: type,
      value: value,
    );
  }
}

extension CampaignModelMapper on CampaignModel {
  CampaignEntity toEntity() {
    return CampaignEntity(
      id: id,
      title: title,
      subtitle: subtitle,
      description: description,
      bannerImage: bannerImage,
      mobileImage: mobileImage,
      desktopImage: desktopImage,
      campaignType: campaignType,
      startAt: startAt,
      endAt: endAt,
      isActive: isActive,
      priority: priority,
      displayOrder: displayOrder,
      targetType: targetType,
      targetId: targetId,
      ctaLabel: ctaLabel,
      ctaAction: ctaAction?.toEntity(),
      couponCode: couponCode,
      metadata: metadata,
    );
  }
}

extension CampaignEntityMapper on CampaignEntity {
  CampaignModel toModel() {
    return CampaignModel(
      id: id,
      title: title,
      subtitle: subtitle,
      description: description,
      bannerImage: bannerImage,
      mobileImage: mobileImage,
      desktopImage: desktopImage,
      campaignType: campaignType,
      startAt: startAt,
      endAt: endAt,
      isActive: isActive,
      priority: priority,
      displayOrder: displayOrder,
      targetType: targetType,
      targetId: targetId,
      ctaLabel: ctaLabel,
      ctaAction: ctaAction?.toModel(),
      couponCode: couponCode,
      metadata: metadata,
    );
  }
}
