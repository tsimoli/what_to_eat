import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = new FlutterSecureStorage();

  static Future<void> setApiToken(String token) async {
    return _storage.write(key: "token", value: token);
  }

  static Future<String> getApiToken() async {
    return _storage.read(key: "token");
  }
}
