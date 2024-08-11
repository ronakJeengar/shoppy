import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void setString(String key, String value) {
    preferences!.setString(key, value);
  }

  static Future<String?> getString(String key) async{
    return preferences!.getString(key);
  }

  static void setBoolean(String key, bool value) {
    preferences!.setBool(key, value);
  }

  static bool? getBool(String key) {
    return preferences!.getBool(key);
  }

  static void setInt(String key, int value) {
    preferences!.setInt(key, value);
  }

  static int? getInt(String key) {
    return preferences!.getInt(key);
  }

  static void setDouble(String key, double value) {
    preferences!.setDouble(key, value);
  }

  static double? getDouble(String key) {
    return preferences!.getDouble(key);
  }

  static void remove(String key) {
    preferences!.remove(key);
  }

  static void clear() {
    preferences!.clear();
  }
}
