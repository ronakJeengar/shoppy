import 'package:flutter/foundation.dart';

@immutable
class AppVersionEntity {
  final String minimumSupported;
  final String latestRecommended;
  final String updateUrl;
  final bool forceUpdateRequired;
  final bool optionalUpdateAvailable;

  const AppVersionEntity({
    this.minimumSupported = '1.0.0',
    this.latestRecommended = '1.1.0',
    this.updateUrl = 'https://shoppy.example.com/download',
    this.forceUpdateRequired = false,
    this.optionalUpdateAvailable = false,
  });

  AppVersionEntity copyWith({
    String? minimumSupported,
    String? latestRecommended,
    String? updateUrl,
    bool? forceUpdateRequired,
    bool? optionalUpdateAvailable,
  }) {
    return AppVersionEntity(
      minimumSupported: minimumSupported ?? this.minimumSupported,
      latestRecommended: latestRecommended ?? this.latestRecommended,
      updateUrl: updateUrl ?? this.updateUrl,
      forceUpdateRequired: forceUpdateRequired ?? this.forceUpdateRequired,
      optionalUpdateAvailable:
          optionalUpdateAvailable ?? this.optionalUpdateAvailable,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppVersionEntity &&
          runtimeType == other.runtimeType &&
          minimumSupported == other.minimumSupported &&
          latestRecommended == other.latestRecommended &&
          updateUrl == other.updateUrl &&
          forceUpdateRequired == other.forceUpdateRequired &&
          optionalUpdateAvailable == other.optionalUpdateAvailable;

  @override
  int get hashCode => Object.hash(
        minimumSupported,
        latestRecommended,
        updateUrl,
        forceUpdateRequired,
        optionalUpdateAvailable,
      );
}

@immutable
class MaintenanceConfigEntity {
  final bool enabled;
  final String message;

  const MaintenanceConfigEntity({
    this.enabled = false,
    this.message =
        'Shoppy is currently undergoing scheduled maintenance. Please check back shortly.',
  });

  MaintenanceConfigEntity copyWith({
    bool? enabled,
    String? message,
  }) {
    return MaintenanceConfigEntity(
      enabled: enabled ?? this.enabled,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaintenanceConfigEntity &&
          runtimeType == other.runtimeType &&
          enabled == other.enabled &&
          message == other.message;

  @override
  int get hashCode => Object.hash(enabled, message);
}

@immutable
class FeatureFlagsEntity {
  final bool wishlist;
  final bool reviews;
  final bool productVideo;
  final bool product3D;
  final bool recommendations;
  final bool aiAssistant;
  final bool notifications;
  final bool coupons;
  final bool orderTracking;

  const FeatureFlagsEntity({
    this.wishlist = true,
    this.reviews = true,
    this.productVideo = true,
    this.product3D = true,
    this.recommendations = true,
    this.aiAssistant = true,
    this.notifications = true,
    this.coupons = true,
    this.orderTracking = true,
  });

  FeatureFlagsEntity copyWith({
    bool? wishlist,
    bool? reviews,
    bool? productVideo,
    bool? product3D,
    bool? recommendations,
    bool? aiAssistant,
    bool? notifications,
    bool? coupons,
    bool? orderTracking,
  }) {
    return FeatureFlagsEntity(
      wishlist: wishlist ?? this.wishlist,
      reviews: reviews ?? this.reviews,
      productVideo: productVideo ?? this.productVideo,
      product3D: product3D ?? this.product3D,
      recommendations: recommendations ?? this.recommendations,
      aiAssistant: aiAssistant ?? this.aiAssistant,
      notifications: notifications ?? this.notifications,
      coupons: coupons ?? this.coupons,
      orderTracking: orderTracking ?? this.orderTracking,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeatureFlagsEntity &&
          runtimeType == other.runtimeType &&
          wishlist == other.wishlist &&
          reviews == other.reviews &&
          productVideo == other.productVideo &&
          product3D == other.product3D &&
          recommendations == other.recommendations &&
          aiAssistant == other.aiAssistant &&
          notifications == other.notifications &&
          coupons == other.coupons &&
          orderTracking == other.orderTracking;

  @override
  int get hashCode => Object.hash(
        wishlist,
        reviews,
        productVideo,
        product3D,
        recommendations,
        aiAssistant,
        notifications,
        coupons,
        orderTracking,
      );
}

@immutable
class MediaConfigEntity {
  final String imageBaseUrl;
  final bool videoEnabled;
  final bool threeDEnabled;
  final int maxUploadSizeMb;

  const MediaConfigEntity({
    this.imageBaseUrl = 'https://images.unsplash.com',
    this.videoEnabled = true,
    this.threeDEnabled = true,
    this.maxUploadSizeMb = 10,
  });

  MediaConfigEntity copyWith({
    String? imageBaseUrl,
    bool? videoEnabled,
    bool? threeDEnabled,
    int? maxUploadSizeMb,
  }) {
    return MediaConfigEntity(
      imageBaseUrl: imageBaseUrl ?? this.imageBaseUrl,
      videoEnabled: videoEnabled ?? this.videoEnabled,
      threeDEnabled: threeDEnabled ?? this.threeDEnabled,
      maxUploadSizeMb: maxUploadSizeMb ?? this.maxUploadSizeMb,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaConfigEntity &&
          runtimeType == other.runtimeType &&
          imageBaseUrl == other.imageBaseUrl &&
          videoEnabled == other.videoEnabled &&
          threeDEnabled == other.threeDEnabled &&
          maxUploadSizeMb == other.maxUploadSizeMb;

  @override
  int get hashCode => Object.hash(
        imageBaseUrl,
        videoEnabled,
        threeDEnabled,
        maxUploadSizeMb,
      );
}

@immutable
class CommerceDisplayConfigEntity {
  final String currency;
  final String currencySymbol;
  final List<String> supportedPaymentMethods;
  final List<String> supportedDeliveryMethods;

  const CommerceDisplayConfigEntity({
    this.currency = 'INR',
    this.currencySymbol = '₹',
    this.supportedPaymentMethods = const [
      'CARD',
      'UPI',
      'NET_BANKING',
      'WALLET',
      'COD'
    ],
    this.supportedDeliveryMethods = const [
      'STANDARD',
      'EXPRESS',
      'OVERNIGHT'
    ],
  });

  CommerceDisplayConfigEntity copyWith({
    String? currency,
    String? currencySymbol,
    List<String>? supportedPaymentMethods,
    List<String>? supportedDeliveryMethods,
  }) {
    return CommerceDisplayConfigEntity(
      currency: currency ?? this.currency,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      supportedPaymentMethods:
          supportedPaymentMethods ?? this.supportedPaymentMethods,
      supportedDeliveryMethods:
          supportedDeliveryMethods ?? this.supportedDeliveryMethods,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommerceDisplayConfigEntity &&
          runtimeType == other.runtimeType &&
          currency == other.currency &&
          currencySymbol == other.currencySymbol &&
          listEquals(supportedPaymentMethods, other.supportedPaymentMethods) &&
          listEquals(supportedDeliveryMethods, other.supportedDeliveryMethods);

  @override
  int get hashCode => Object.hash(
        currency,
        currencySymbol,
        Object.hashAll(supportedPaymentMethods),
        Object.hashAll(supportedDeliveryMethods),
      );
}

@immutable
class HomeSectionEntity {
  final String id;
  final String name;
  final bool enabled;
  final int order;

  const HomeSectionEntity({
    required this.id,
    required this.name,
    this.enabled = true,
    required this.order,
  });

  String get title => name;

  HomeSectionEntity copyWith({
    String? id,
    String? name,
    bool? enabled,
    int? order,
  }) {
    return HomeSectionEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      enabled: enabled ?? this.enabled,
      order: order ?? this.order,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeSectionEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          enabled == other.enabled &&
          order == other.order;

  @override
  int get hashCode => Object.hash(id, name, enabled, order);
}

@immutable
class UiConfigEntity {
  final List<HomeSectionEntity> homeSections;
  final bool showOffers;
  final bool showRecommendations;

  const UiConfigEntity({
    this.homeSections = const [
      HomeSectionEntity(
          id: 'hero_banner', name: 'Hero Banner', enabled: true, order: 1),
      HomeSectionEntity(
          id: 'categories', name: 'Categories', enabled: true, order: 2),
      HomeSectionEntity(
          id: 'trending', name: 'Trending Now', enabled: true, order: 3),
      HomeSectionEntity(
          id: 'recommendations',
          name: 'Recommended For You',
          enabled: true,
          order: 4),
      HomeSectionEntity(
          id: 'featured_collection',
          name: 'Featured Products',
          enabled: true,
          order: 5),
      HomeSectionEntity(
          id: 'offers',
          name: 'Special Deals & Offers',
          enabled: true,
          order: 6),
    ],
    this.showOffers = true,
    this.showRecommendations = true,
  });

  UiConfigEntity copyWith({
    List<HomeSectionEntity>? homeSections,
    bool? showOffers,
    bool? showRecommendations,
  }) {
    return UiConfigEntity(
      homeSections: homeSections ?? this.homeSections,
      showOffers: showOffers ?? this.showOffers,
      showRecommendations: showRecommendations ?? this.showRecommendations,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UiConfigEntity &&
          runtimeType == other.runtimeType &&
          listEquals(homeSections, other.homeSections) &&
          showOffers == other.showOffers &&
          showRecommendations == other.showRecommendations;

  @override
  int get hashCode => Object.hash(
        Object.hashAll(homeSections),
        showOffers,
        showRecommendations,
      );
}

@immutable
class SupportInfoEntity {
  final String contactEmail;
  final String supportUrl;
  final String termsUrl;
  final String privacyUrl;
  final String helpUrl;

  const SupportInfoEntity({
    this.contactEmail = 'support@shoppy.com',
    this.supportUrl = 'https://shoppy.example.com/support',
    this.termsUrl = 'https://shoppy.example.com/terms',
    this.privacyUrl = 'https://shoppy.example.com/privacy',
    this.helpUrl = 'https://shoppy.example.com/help',
  });

  SupportInfoEntity copyWith({
    String? contactEmail,
    String? supportUrl,
    String? termsUrl,
    String? privacyUrl,
    String? helpUrl,
  }) {
    return SupportInfoEntity(
      contactEmail: contactEmail ?? this.contactEmail,
      supportUrl: supportUrl ?? this.supportUrl,
      termsUrl: termsUrl ?? this.termsUrl,
      privacyUrl: privacyUrl ?? this.privacyUrl,
      helpUrl: helpUrl ?? this.helpUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SupportInfoEntity &&
          runtimeType == other.runtimeType &&
          contactEmail == other.contactEmail &&
          supportUrl == other.supportUrl &&
          termsUrl == other.termsUrl &&
          privacyUrl == other.privacyUrl &&
          helpUrl == other.helpUrl;

  @override
  int get hashCode => Object.hash(
        contactEmail,
        supportUrl,
        termsUrl,
        privacyUrl,
        helpUrl,
      );
}

@immutable
class AppConfigEntity {
  final String configVersion;
  final String environment;
  final AppVersionEntity appVersion;
  final MaintenanceConfigEntity maintenance;
  final FeatureFlagsEntity features;
  final MediaConfigEntity media;
  final CommerceDisplayConfigEntity commerce;
  final UiConfigEntity ui;
  final SupportInfoEntity support;
  final DateTime? serverTime;

  const AppConfigEntity({
    this.configVersion = '2026.09.01.1',
    this.environment = 'development',
    this.appVersion = const AppVersionEntity(),
    this.maintenance = const MaintenanceConfigEntity(),
    this.features = const FeatureFlagsEntity(),
    this.media = const MediaConfigEntity(),
    this.commerce = const CommerceDisplayConfigEntity(),
    this.ui = const UiConfigEntity(),
    this.support = const SupportInfoEntity(),
    this.serverTime,
  });

  static const AppConfigEntity defaultConfig = AppConfigEntity();

  AppConfigEntity copyWith({
    String? configVersion,
    String? environment,
    AppVersionEntity? appVersion,
    MaintenanceConfigEntity? maintenance,
    FeatureFlagsEntity? features,
    MediaConfigEntity? media,
    CommerceDisplayConfigEntity? commerce,
    UiConfigEntity? ui,
    SupportInfoEntity? support,
    DateTime? serverTime,
  }) {
    return AppConfigEntity(
      configVersion: configVersion ?? this.configVersion,
      environment: environment ?? this.environment,
      appVersion: appVersion ?? this.appVersion,
      maintenance: maintenance ?? this.maintenance,
      features: features ?? this.features,
      media: media ?? this.media,
      commerce: commerce ?? this.commerce,
      ui: ui ?? this.ui,
      support: support ?? this.support,
      serverTime: serverTime ?? this.serverTime,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppConfigEntity &&
          runtimeType == other.runtimeType &&
          configVersion == other.configVersion &&
          environment == other.environment &&
          appVersion == other.appVersion &&
          maintenance == other.maintenance &&
          features == other.features &&
          media == other.media &&
          commerce == other.commerce &&
          ui == other.ui &&
          support == other.support &&
          serverTime == other.serverTime;

  @override
  int get hashCode => Object.hash(
        configVersion,
        environment,
        appVersion,
        maintenance,
        features,
        media,
        commerce,
        ui,
        support,
        serverTime,
      );
}
