import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;

  static const String keyAccessToken = 'token';
  static const String keyRefreshToken = 'refreshToken';
  static const String keyRecentSearches = 'recent_searches';

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void setString(String key, String value) {
    preferences?.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    return preferences?.getString(key);
  }

  static void setBoolean(String key, bool value) {
    preferences?.setBool(key, value);
  }

  static bool? getBool(String key) {
    return preferences?.getBool(key);
  }

  static void setInt(String key, int value) {
    preferences?.setInt(key, value);
  }

  static int? getInt(String key) {
    return preferences?.getInt(key);
  }

  static void setDouble(String key, double value) {
    preferences?.setDouble(key, value);
  }

  static double? getDouble(String key) {
    return preferences?.getDouble(key);
  }

  static void remove(String key) {
    preferences?.remove(key);
  }

  static void clear() {
    preferences?.clear();
  }

  // Token management helpers
  static Future<void> saveTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    await preferences?.setString(keyAccessToken, accessToken);
    if (refreshToken != null) {
      await preferences?.setString(keyRefreshToken, refreshToken);
    }
  }

  static String? getAccessToken() {
    return preferences?.getString(keyAccessToken);
  }

  static String? getRefreshToken() {
    return preferences?.getString(keyRefreshToken);
  }

  static Future<void> clearAuth() async {
    await preferences?.remove(keyAccessToken);
    await preferences?.remove(keyRefreshToken);
  }

  // Recent Search History helpers
  static List<String> getRecentSearches() {
    return preferences?.getStringList(keyRecentSearches) ?? [];
  }

  static Future<void> addRecentSearch(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    final list = preferences?.getStringList(keyRecentSearches) ?? [];
    list.removeWhere((item) => item.toLowerCase() == trimmed.toLowerCase());
    list.insert(0, trimmed);
    if (list.length > 10) {
      list.removeRange(10, list.length);
    }
    await preferences?.setStringList(keyRecentSearches, list);
  }

  static Future<void> removeRecentSearch(String query) async {
    final list = preferences?.getStringList(keyRecentSearches) ?? [];
    list.removeWhere(
        (item) => item.toLowerCase() == query.trim().toLowerCase());
    await preferences?.setStringList(keyRecentSearches, list);
  }

  static Future<void> clearRecentSearches() async {
    await preferences?.remove(keyRecentSearches);
  }
}
