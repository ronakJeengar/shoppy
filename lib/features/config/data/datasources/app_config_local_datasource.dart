import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/storage_keys.dart';
import '../../../../core/preferences.dart';
import '../models/app_config_model.dart';

abstract class AppConfigLocalDataSource {
  AppConfigModel? getCachedConfig();
  Future<void> saveConfig(AppConfigModel model);
  String? getCachedEtag();
  Future<void> saveEtag(String etag);
}

class AppConfigLocalDataSourceImpl implements AppConfigLocalDataSource {
  final SharedPreferences? _prefs;

  AppConfigLocalDataSourceImpl({SharedPreferences? prefs})
      : _prefs = prefs ?? Preferences.preferences;

  @override
  AppConfigModel? getCachedConfig() {
    try {
      final prefs = _prefs ?? Preferences.preferences;
      final raw = prefs?.getString(StorageKeys.appConfig);
      if (raw != null && raw.isNotEmpty) {
        final decoded = jsonDecode(raw) as Map<String, dynamic>;
        return AppConfigModel.fromJson(decoded);
      }
    } catch (_) {
      // Corrupt cache fails gracefully
    }
    return null;
  }

  @override
  Future<void> saveConfig(AppConfigModel model) async {
    try {
      final prefs = _prefs ?? Preferences.preferences;
      final jsonStr = jsonEncode(model.toJson());
      await prefs?.setString(StorageKeys.appConfig, jsonStr);
    } catch (_) {}
  }

  @override
  String? getCachedEtag() {
    final prefs = _prefs ?? Preferences.preferences;
    return prefs?.getString(StorageKeys.appConfigEtag);
  }

  @override
  Future<void> saveEtag(String etag) async {
    final prefs = _prefs ?? Preferences.preferences;
    await prefs?.setString(StorageKeys.appConfigEtag, etag);
  }
}
