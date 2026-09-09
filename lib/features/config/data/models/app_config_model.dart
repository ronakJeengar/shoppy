import '../../domain/entities/app_config_entity.dart';

class AppVersionModel {
  final String minimumSupported;
  final String latestRecommended;
  final String updateUrl;
  final bool forceUpdateRequired;
  final bool optionalUpdateAvailable;

  const AppVersionModel({
    required this.minimumSupported,
    required this.latestRecommended,
    required this.updateUrl,
    required this.forceUpdateRequired,
    required this.optionalUpdateAvailable,
  });

  factory AppVersionModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const AppVersionModel(
        minimumSupported: '1.0.0',
        latestRecommended: '1.1.0',
        updateUrl: 'https://shoppy.example.com/download',
        forceUpdateRequired: false,
        optionalUpdateAvailable: false,
      );
    }
    return AppVersionModel(
      minimumSupported: json['minimumSupported']?.toString() ?? '1.0.0',
      latestRecommended: json['latestRecommended']?.toString() ?? '1.1.0',
      updateUrl: json['updateUrl']?.toString() ??
          'https://shoppy.example.com/download',
      forceUpdateRequired: json['forceUpdateRequired'] == true,
      optionalUpdateAvailable: json['optionalUpdateAvailable'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
        'minimumSupported': minimumSupported,
        'latestRecommended': latestRecommended,
        'updateUrl': updateUrl,
        'forceUpdateRequired': forceUpdateRequired,
        'optionalUpdateAvailable': optionalUpdateAvailable,
      };

  AppVersionEntity toEntity() => AppVersionEntity(
        minimumSupported: minimumSupported,
        latestRecommended: latestRecommended,
        updateUrl: updateUrl,
        forceUpdateRequired: forceUpdateRequired,
        optionalUpdateAvailable: optionalUpdateAvailable,
      );
}

class MaintenanceConfigModel {
  final bool enabled;
  final String message;

  const MaintenanceConfigModel({
    required this.enabled,
    required this.message,
  });

  factory MaintenanceConfigModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const MaintenanceConfigModel(
        enabled: false,
        message:
            'Shoppy is currently undergoing scheduled maintenance. Please check back shortly.',
      );
    }
    return MaintenanceConfigModel(
      enabled: json['enabled'] == true,
      message: json['message']?.toString() ??
          'Shoppy is currently undergoing scheduled maintenance.',
    );
  }

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'message': message,
      };

  MaintenanceConfigEntity toEntity() => MaintenanceConfigEntity(
        enabled: enabled,
        message: message,
      );
}

class FeatureFlagsModel {
  final bool wishlist;
  final bool reviews;
  final bool productVideo;
  final bool product3D;
  final bool recommendations;
  final bool aiAssistant;
  final bool notifications;
  final bool coupons;
  final bool orderTracking;

  const FeatureFlagsModel({
    required this.wishlist,
    required this.reviews,
    required this.productVideo,
    required this.product3D,
    required this.recommendations,
    required this.aiAssistant,
    required this.notifications,
    required this.coupons,
    required this.orderTracking,
  });

  factory FeatureFlagsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const FeatureFlagsModel(
        wishlist: true,
        reviews: true,
        productVideo: true,
        product3D: true,
        recommendations: true,
        aiAssistant: true,
        notifications: true,
        coupons: true,
        orderTracking: true,
      );
    }
    return FeatureFlagsModel(
      wishlist: json['wishlist'] != false,
      reviews: json['reviews'] != false,
      productVideo: json['productVideo'] != false,
      product3D: json['product3D'] != false,
      recommendations: json['recommendations'] != false,
      aiAssistant: json['aiAssistant'] != false,
      notifications: json['notifications'] != false,
      coupons: json['coupons'] != false,
      orderTracking: json['orderTracking'] != false,
    );
  }

  Map<String, dynamic> toJson() => {
        'wishlist': wishlist,
        'reviews': reviews,
        'productVideo': productVideo,
        'product3D': product3D,
        'recommendations': recommendations,
        'aiAssistant': aiAssistant,
        'notifications': notifications,
        'coupons': coupons,
        'orderTracking': orderTracking,
      };

  FeatureFlagsEntity toEntity() => FeatureFlagsEntity(
        wishlist: wishlist,
        reviews: reviews,
        productVideo: productVideo,
        product3D: product3D,
        recommendations: recommendations,
        aiAssistant: aiAssistant,
        notifications: notifications,
        coupons: coupons,
        orderTracking: orderTracking,
      );
}

class MediaConfigModel {
  final String imageBaseUrl;
  final bool videoEnabled;
  final bool threeDEnabled;
  final int maxUploadSizeMb;

  const MediaConfigModel({
    required this.imageBaseUrl,
    required this.videoEnabled,
    required this.threeDEnabled,
    required this.maxUploadSizeMb,
  });

  factory MediaConfigModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const MediaConfigModel(
        imageBaseUrl: 'https://images.unsplash.com',
        videoEnabled: true,
        threeDEnabled: true,
        maxUploadSizeMb: 10,
      );
    }
    return MediaConfigModel(
      imageBaseUrl: json['imageBaseUrl']?.toString() ??
          'https://images.unsplash.com',
      videoEnabled: json['videoEnabled'] != false,
      threeDEnabled: json['threeDEnabled'] != false,
      maxUploadSizeMb:
          int.tryParse(json['maxUploadSizeMb']?.toString() ?? '') ?? 10,
    );
  }

  Map<String, dynamic> toJson() => {
        'imageBaseUrl': imageBaseUrl,
        'videoEnabled': videoEnabled,
        'threeDEnabled': threeDEnabled,
        'maxUploadSizeMb': maxUploadSizeMb,
      };

  MediaConfigEntity toEntity() => MediaConfigEntity(
        imageBaseUrl: imageBaseUrl,
        videoEnabled: videoEnabled,
        threeDEnabled: threeDEnabled,
        maxUploadSizeMb: maxUploadSizeMb,
      );
}

class CommerceDisplayConfigModel {
  final String currency;
  final String currencySymbol;
  final List<String> supportedPaymentMethods;
  final List<String> supportedDeliveryMethods;

  const CommerceDisplayConfigModel({
    required this.currency,
    required this.currencySymbol,
    required this.supportedPaymentMethods,
    required this.supportedDeliveryMethods,
  });

  factory CommerceDisplayConfigModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const CommerceDisplayConfigModel(
        currency: 'INR',
        currencySymbol: '₹',
        supportedPaymentMethods: [
          'CARD',
          'UPI',
          'NET_BANKING',
          'WALLET',
          'COD'
        ],
        supportedDeliveryMethods: [
          'STANDARD',
          'EXPRESS',
          'OVERNIGHT'
        ],
      );
    }
    return CommerceDisplayConfigModel(
      currency: json['currency']?.toString() ?? 'INR',
      currencySymbol: json['currencySymbol']?.toString() ?? '₹',
      supportedPaymentMethods: (json['supportedPaymentMethods'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          const ['CARD', 'UPI', 'NET_BANKING', 'WALLET', 'COD'],
      supportedDeliveryMethods: (json['supportedDeliveryMethods'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          const ['STANDARD', 'EXPRESS', 'OVERNIGHT'],
    );
  }

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'currencySymbol': currencySymbol,
        'supportedPaymentMethods': supportedPaymentMethods,
        'supportedDeliveryMethods': supportedDeliveryMethods,
      };

  CommerceDisplayConfigEntity toEntity() => CommerceDisplayConfigEntity(
        currency: currency,
        currencySymbol: currencySymbol,
        supportedPaymentMethods: supportedPaymentMethods,
        supportedDeliveryMethods: supportedDeliveryMethods,
      );
}

class HomeSectionModel {
  final String id;
  final String name;
  final bool enabled;
  final int order;

  const HomeSectionModel({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
  });

  factory HomeSectionModel.fromJson(Map<String, dynamic> json) {
    return HomeSectionModel(
      id: json['id']?.toString() ?? 'unknown',
      name: json['name']?.toString() ?? 'Section',
      enabled: json['enabled'] != false,
      order: int.tryParse(json['order']?.toString() ?? '0') ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'enabled': enabled,
        'order': order,
      };

  HomeSectionEntity toEntity() => HomeSectionEntity(
        id: id,
        name: name,
        enabled: enabled,
        order: order,
      );
}

class UiConfigModel {
  final List<HomeSectionModel> homeSections;
  final bool showOffers;
  final bool showRecommendations;

  const UiConfigModel({
    required this.homeSections,
    required this.showOffers,
    required this.showRecommendations,
  });

  factory UiConfigModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const UiConfigModel(
        homeSections: [
          HomeSectionModel(
              id: 'hero_banner', name: 'Hero Banner', enabled: true, order: 1),
          HomeSectionModel(
              id: 'categories', name: 'Categories', enabled: true, order: 2),
          HomeSectionModel(
              id: 'trending', name: 'Trending Now', enabled: true, order: 3),
          HomeSectionModel(
              id: 'recommendations',
              name: 'Recommended For You',
              enabled: true,
              order: 4),
          HomeSectionModel(
              id: 'featured_collection',
              name: 'Featured Products',
              enabled: true,
              order: 5),
          HomeSectionModel(
              id: 'offers',
              name: 'Special Deals & Offers',
              enabled: true,
              order: 6),
        ],
        showOffers: true,
        showRecommendations: true,
      );
    }
    final rawSections = json['homeSections'] as List?;
    final sections = rawSections != null
        ? rawSections
            .whereType<Map<String, dynamic>>()
            .map((e) => HomeSectionModel.fromJson(e))
            .toList()
        : const [
            HomeSectionModel(
                id: 'hero_banner', name: 'Hero Banner', enabled: true, order: 1),
            HomeSectionModel(
                id: 'categories', name: 'Categories', enabled: true, order: 2),
            HomeSectionModel(
                id: 'trending', name: 'Trending Now', enabled: true, order: 3),
            HomeSectionModel(
                id: 'recommendations',
                name: 'Recommended For You',
                enabled: true,
                order: 4),
            HomeSectionModel(
                id: 'featured_collection',
                name: 'Featured Products',
                enabled: true,
                order: 5),
            HomeSectionModel(
                id: 'offers',
                name: 'Special Deals & Offers',
                enabled: true,
                order: 6),
          ];

    return UiConfigModel(
      homeSections: sections,
      showOffers: json['showOffers'] != false,
      showRecommendations: json['showRecommendations'] != false,
    );
  }

  Map<String, dynamic> toJson() => {
        'homeSections': homeSections.map((e) => e.toJson()).toList(),
        'showOffers': showOffers,
        'showRecommendations': showRecommendations,
      };

  UiConfigEntity toEntity() => UiConfigEntity(
        homeSections: homeSections.map((e) => e.toEntity()).toList(),
        showOffers: showOffers,
        showRecommendations: showRecommendations,
      );
}

class SupportInfoModel {
  final String contactEmail;
  final String supportUrl;
  final String termsUrl;
  final String privacyUrl;
  final String helpUrl;

  const SupportInfoModel({
    required this.contactEmail,
    required this.supportUrl,
    required this.termsUrl,
    required this.privacyUrl,
    required this.helpUrl,
  });

  factory SupportInfoModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const SupportInfoModel(
        contactEmail: 'support@shoppy.com',
        supportUrl: 'https://shoppy.example.com/support',
        termsUrl: 'https://shoppy.example.com/terms',
        privacyUrl: 'https://shoppy.example.com/privacy',
        helpUrl: 'https://shoppy.example.com/help',
      );
    }
    return SupportInfoModel(
      contactEmail: json['contactEmail']?.toString() ?? 'support@shoppy.com',
      supportUrl: json['supportUrl']?.toString() ??
          'https://shoppy.example.com/support',
      termsUrl:
          json['termsUrl']?.toString() ?? 'https://shoppy.example.com/terms',
      privacyUrl: json['privacyUrl']?.toString() ??
          'https://shoppy.example.com/privacy',
      helpUrl: json['helpUrl']?.toString() ?? 'https://shoppy.example.com/help',
    );
  }

  Map<String, dynamic> toJson() => {
        'contactEmail': contactEmail,
        'supportUrl': supportUrl,
        'termsUrl': termsUrl,
        'privacyUrl': privacyUrl,
        'helpUrl': helpUrl,
      };

  SupportInfoEntity toEntity() => SupportInfoEntity(
        contactEmail: contactEmail,
        supportUrl: supportUrl,
        termsUrl: termsUrl,
        privacyUrl: privacyUrl,
        helpUrl: helpUrl,
      );
}

class AppConfigModel {
  final String configVersion;
  final String environment;
  final AppVersionModel appVersion;
  final MaintenanceConfigModel maintenance;
  final FeatureFlagsModel features;
  final MediaConfigModel media;
  final CommerceDisplayConfigModel commerce;
  final UiConfigModel ui;
  final SupportInfoModel support;
  final DateTime? serverTime;

  const AppConfigModel({
    required this.configVersion,
    required this.environment,
    required this.appVersion,
    required this.maintenance,
    required this.features,
    required this.media,
    required this.commerce,
    required this.ui,
    required this.support,
    this.serverTime,
  });

  factory AppConfigModel.fromJson(Map<String, dynamic> json) {
    return AppConfigModel(
      configVersion: json['configVersion']?.toString() ?? '2026.09.01.1',
      environment: json['environment']?.toString() ?? 'development',
      appVersion: AppVersionModel.fromJson(
          json['appVersion'] as Map<String, dynamic>?),
      maintenance: MaintenanceConfigModel.fromJson(
          json['maintenance'] as Map<String, dynamic>?),
      features: FeatureFlagsModel.fromJson(
          json['features'] as Map<String, dynamic>?),
      media: MediaConfigModel.fromJson(json['media'] as Map<String, dynamic>?),
      commerce: CommerceDisplayConfigModel.fromJson(
          json['commerce'] as Map<String, dynamic>?),
      ui: UiConfigModel.fromJson(json['ui'] as Map<String, dynamic>?),
      support:
          SupportInfoModel.fromJson(json['support'] as Map<String, dynamic>?),
      serverTime: json['serverTime'] != null
          ? DateTime.tryParse(json['serverTime'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'configVersion': configVersion,
        'environment': environment,
        'appVersion': appVersion.toJson(),
        'maintenance': maintenance.toJson(),
        'features': features.toJson(),
        'media': media.toJson(),
        'commerce': commerce.toJson(),
        'ui': ui.toJson(),
        'support': support.toJson(),
        if (serverTime != null) 'serverTime': serverTime!.toIso8601String(),
      };

  AppConfigEntity toEntity() => AppConfigEntity(
        configVersion: configVersion,
        environment: environment,
        appVersion: appVersion.toEntity(),
        maintenance: maintenance.toEntity(),
        features: features.toEntity(),
        media: media.toEntity(),
        commerce: commerce.toEntity(),
        ui: ui.toEntity(),
        support: support.toEntity(),
        serverTime: serverTime,
      );

  factory AppConfigModel.fromEntity(AppConfigEntity entity) => AppConfigModel(
        configVersion: entity.configVersion,
        environment: entity.environment,
        appVersion: AppVersionModel(
          minimumSupported: entity.appVersion.minimumSupported,
          latestRecommended: entity.appVersion.latestRecommended,
          updateUrl: entity.appVersion.updateUrl,
          forceUpdateRequired: entity.appVersion.forceUpdateRequired,
          optionalUpdateAvailable: entity.appVersion.optionalUpdateAvailable,
        ),
        maintenance: MaintenanceConfigModel(
          enabled: entity.maintenance.enabled,
          message: entity.maintenance.message,
        ),
        features: FeatureFlagsModel(
          wishlist: entity.features.wishlist,
          reviews: entity.features.reviews,
          productVideo: entity.features.productVideo,
          product3D: entity.features.product3D,
          recommendations: entity.features.recommendations,
          aiAssistant: entity.features.aiAssistant,
          notifications: entity.features.notifications,
          coupons: entity.features.coupons,
          orderTracking: entity.features.orderTracking,
        ),
        media: MediaConfigModel(
          imageBaseUrl: entity.media.imageBaseUrl,
          videoEnabled: entity.media.videoEnabled,
          threeDEnabled: entity.media.threeDEnabled,
          maxUploadSizeMb: entity.media.maxUploadSizeMb,
        ),
        commerce: CommerceDisplayConfigModel(
          currency: entity.commerce.currency,
          currencySymbol: entity.commerce.currencySymbol,
          supportedPaymentMethods: entity.commerce.supportedPaymentMethods,
          supportedDeliveryMethods: entity.commerce.supportedDeliveryMethods,
        ),
        ui: UiConfigModel(
          homeSections: entity.ui.homeSections
              .map((e) => HomeSectionModel(
                    id: e.id,
                    name: e.name,
                    enabled: e.enabled,
                    order: e.order,
                  ))
              .toList(),
          showOffers: entity.ui.showOffers,
          showRecommendations: entity.ui.showRecommendations,
        ),
        support: SupportInfoModel(
          contactEmail: entity.support.contactEmail,
          supportUrl: entity.support.supportUrl,
          termsUrl: entity.support.termsUrl,
          privacyUrl: entity.support.privacyUrl,
          helpUrl: entity.support.helpUrl,
        ),
        serverTime: entity.serverTime,
      );
}
