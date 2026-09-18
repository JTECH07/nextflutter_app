import 'package:nextflutter_app/data/datasources/auth_datasource.dart';
import 'package:nextflutter_app/data/datasources/auth_local_datasource.dart';
import 'package:nextflutter_app/data/datasources/auth_remote_datasource.dart';

class AuthRepository implements AuthDatasource {
  final AuthRemoteDatasource _remote;
  final AuthLocalDatasource _local;

  AuthRepository(this._remote, this._local);

  @override
  Future<bool> login(String email, String password) async {
    final success = await _remote.login(email, password);
    if (success) {
      // Token will be saved by interceptor
    }
    return success;
  }

  @override
  Future<bool> register(String email, String password) async {
    return await _remote.register(email, password);
  }

  @override
  Future<void> logout() async {
    await _local.clearToken();
    await _remote.logout();
  }

  @override
  Future<bool> checkAuthStatus() async {
    final hasToken = await _local.getToken() != null;
    if (!hasToken) return false;
    return await _remote.checkAuthStatus();
  }
}