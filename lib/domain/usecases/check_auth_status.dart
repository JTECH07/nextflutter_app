import 'package:nextflutter_app/data/repositories/auth_repository.dart';

class CheckAuthStatus {
  final AuthRepository repository;
  CheckAuthStatus(this.repository);
  Future<bool> call() async => repository.checkAuthStatus();
}