import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class Urls {
  static String get baseUrl {
    if (kIsWeb) return "http://localhost:8000/api/v1/";
    try {
      if (Platform.isAndroid) return "http://10.0.2.2:8000/api/v1/";
    } catch (_) {}
    return "http://localhost:8000/api/v1/";
  }

  static const String signUp = "auth/register";
  static const String signIn = "auth/login";
  static const String currentUser = "auth/me";
}
