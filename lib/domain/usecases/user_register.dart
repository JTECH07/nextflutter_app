import 'package:nextflutter_app/data/repositories/auth_repository.dart';

class UserRegister {
  final AuthRepository repository;
  final String email;
  final String password;
  UserRegister(this.repository, this.email, this.password);
  Future<bool> call() async => repository.register(email, password);
}