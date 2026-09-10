/// Centralized asset paths for icons, illustrations, animations, and static media.
abstract final class AppAssets {
  static const String basePath = 'assets';
  static const String iconsPath = '$basePath/icons';
  static const String imagesPath = '$basePath/images';
  static const String illustrationsPath = '$basePath/illustrations';

  // Icon subcategory paths
  static const String iconsNavigationPath = '$iconsPath/navigation';
  static const String iconsCommercePath = '$iconsPath/commerce';
  static const String iconsAccountPath = '$iconsPath/account';
  static const String iconsActionsPath = '$iconsPath/actions';
  static const String iconsStatusPath = '$iconsPath/status';
  static const String iconsOrdersPath = '$iconsPath/orders';
  static const String iconsMediaPath = '$iconsPath/media';
  static const String iconsFiltersPath = '$iconsPath/filters';
  static const String iconsAdminPath = '$iconsPath/admin';
  static const String iconsProductPath = '$iconsPath/product';
  static const String iconsNotificationsPath = '$iconsPath/notifications';

  // Static Fallbacks & Placeholders
  static const String logo = '$imagesPath/logo.png';
  static const String placeholder = '$imagesPath/placeholder.png';
}
