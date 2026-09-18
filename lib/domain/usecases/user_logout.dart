import 'package:nextflutter_app/data/repositories/auth_repository.dart';

class UserLogout {
  final AuthRepository repository;
  UserLogout(this.repository);
  Future<void> call() async => await repository.logout();
}