import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nextflutter_app/data/datasources/auth_datasource.dart';
import 'package:nextflutter_app/data/datasources/hive_auth_datasource.dart';

class AuthProvider extends ChangeNotifier {
  final AuthDatasource _datasource;
  bool _isAuthenticated = false;

  AuthProvider(this._datasource) {
    _initialize();
  }

  Future<void> _initialize() async {
    final hasToken = await _datasource.getToken() != null;
    _isAuthenticated = hasToken;
    notifyListeners();
  }

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String email, String password) async {
    final success = await _datasource.login(email, password);
    if (success) {
      _isAuthenticated = true;
      notifyListeners();
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<void> register(String email, String password) async {
    final success = await _datasource.register(email, password);
    if (success) {
      _isAuthenticated = true;
      notifyListeners();
    } else {
      throw Exception('Registration failed');
    }
  }

  Future<void> logout() async {
    await _datasource.logout();
    _isAuthenticated = false;
    notifyListeners();
  }
}