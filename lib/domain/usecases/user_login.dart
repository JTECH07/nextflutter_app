import 'package:nextflutter_app/data/repositories/auth_repository.dart';

class UserLogin {
  final AuthRepository repository;
  final String email;
  final String password;
  UserLogin(this.repository, this.email, this.password);
  Future<bool> call() async => repository.login(email, password);
}