abstract class AuthDatasource {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password);
  Future<void> logout();
  Future<bool> checkAuthStatus();
  Future<String?> getToken();
}