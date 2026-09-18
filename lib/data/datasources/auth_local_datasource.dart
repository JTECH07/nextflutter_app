import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthLocalDatasource {
  late final Box _box;

  AuthLocalDatasource() {
    Hive.initFlutter();
    _box = Hive.box('auth');
  }

  Future<void> saveToken(String token) async {
    await _box.put('token', token);
  }

  Future<String?> getToken() async {
    return _box.get('token');
  }

  Future<void> clearToken() async {
    await _box.clear();
  }
}