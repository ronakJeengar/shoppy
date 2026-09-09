import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/storage_keys.dart';

abstract class LocalStorageService {
  Future<void> saveTokens({required String accessToken, String? refreshToken});
  String? getAccessToken();
  String? getRefreshToken();
  Future<void> saveUserRole(String role);
  String? getUserRole();
  bool get isAdmin;
  Future<void> saveUserId(String id);
  String? getUserId();
  Future<void> clearAuth();
  List<String> getRecentSearches();
  Future<void> addRecentSearch(String query);
  Future<void> removeRecentSearch(String query);
  Future<void> clearRecentSearches();
  Future<void> setString(String key, String value);
  String? getString(String key);
  Future<void> setBool(String key, bool value);
  bool? getBool(String key);
  Future<void> remove(String key);
  Future<void> clear();
}

class SharedPreferencesService implements LocalStorageService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  @override
  Future<void> saveTokens({required String accessToken, String? refreshToken}) async {
    await _prefs.setString(StorageKeys.accessToken, accessToken);
    if (refreshToken != null) {
      await _prefs.setString(StorageKeys.refreshToken, refreshToken);
    }
  }

  @override
  String? getAccessToken() => _prefs.getString(StorageKeys.accessToken);

  @override
  String? getRefreshToken() => _prefs.getString(StorageKeys.refreshToken);

  @override
  Future<void> saveUserRole(String role) async {
    await _prefs.setString(StorageKeys.userRole, role);
  }

  @override
  String? getUserRole() => _prefs.getString(StorageKeys.userRole);

  @override
  bool get isAdmin => (getUserRole() ?? '').toUpperCase() == 'ADMIN';

  @override
  Future<void> saveUserId(String id) async {
    await _prefs.setString(StorageKeys.userId, id);
  }

  @override
  String? getUserId() => _prefs.getString(StorageKeys.userId);

  @override
  Future<void> clearAuth() async {
    await _prefs.remove(StorageKeys.accessToken);
    await _prefs.remove(StorageKeys.refreshToken);
    await _prefs.remove(StorageKeys.userRole);
    await _prefs.remove(StorageKeys.userId);
  }

  @override
  List<String> getRecentSearches() {
    return _prefs.getStringList(StorageKeys.recentSearches) ?? [];
  }

  @override
  Future<void> addRecentSearch(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;
    final list = _prefs.getStringList(StorageKeys.recentSearches) ?? [];
    list.removeWhere((item) => item.toLowerCase() == trimmed.toLowerCase());
    list.insert(0, trimmed);
    if (list.length > 10) {
      list.removeRange(10, list.length);
    }
    await _prefs.setStringList(StorageKeys.recentSearches, list);
  }

  @override
  Future<void> removeRecentSearch(String query) async {
    final list = _prefs.getStringList(StorageKeys.recentSearches) ?? [];
    list.removeWhere((item) => item.toLowerCase() == query.trim().toLowerCase());
    await _prefs.setStringList(StorageKeys.recentSearches, list);
  }

  @override
  Future<void> clearRecentSearches() async {
    await _prefs.remove(StorageKeys.recentSearches);
  }

  @override
  Future<void> setString(String key, String value) => _prefs.setString(key, value);

  @override
  String? getString(String key) => _prefs.getString(key);

  @override
  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);

  @override
  bool? getBool(String key) => _prefs.getBool(key);

  @override
  Future<void> remove(String key) => _prefs.remove(key);

  @override
  Future<void> clear() => _prefs.clear();
}

/// Provider for SharedPreferences instance (overridden in bootstrap/main).
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden in ProviderScope');
});

/// Provider for LocalStorageService.
final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesService(prefs);
});
