import 'package:dio/dio.dart';
import 'package:nextflutter_app/data/datasources/auth_datasource.dart';

class AuthRemoteDatasource implements AuthDatasource {
  final Dio dio;

  AuthRemoteDatasource(this.dio);

  @override
  Future<bool> login(String email, String password) async {
    final response = await dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    return (response.data['success'] ?? false) as bool;
  }

  @override
  Future<bool> register(String email, String password) async {
    final response = await dio.post('/auth/register', data: {
      'email': email,
      'password': password,
    });
    return (response.data['success'] ?? false) as bool;
  }

  @override
  Future<void> logout() async {
    await dio.post('/auth/logout');
  }

  @override
  Future<bool> checkAuthStatus() async {
    try {
      final response = await dio.get('/auth/me');
      return (response.data['success'] ?? false) as bool;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<String?> getToken() async {
    // Remote datasource doesn't store tokens locally
    return null;
  }
}