import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;

  static const String keyAccessToken = 'token';
  static const String keyRefreshToken = 'refreshToken';

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
}
