import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nextflutter_app/data/datasources/auth_datasource.dart';
import 'auth_local_datasource.dart';

class HiveAuthDatasource extends AuthLocalDatasource implements AuthDatasource {
  @override
  Future<void> saveToken(String token) async {
    await super.saveToken(token);
  }

  @override
  Future<String?> getToken() async {
    return await super.getToken();
  }

  @override
  Future<void> logout() async {
    await super.clearToken();
  }

  @override
  Future<bool> login(String email, String password) {
    // Not implemented for local datasource
    return Future.value(false);
  }

  @override
  Future<bool> register(String email, String password) {
    // Not implemented for local datasource
    return Future.value(false);
  }

  @override
  Future<bool> checkAuthStatus() async {
    final hasToken = await getToken() != null;
    return hasToken;
  }
}