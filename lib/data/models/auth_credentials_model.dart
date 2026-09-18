class AuthCredentialsModel {
  final String email;
  final String password;

  AuthCredentialsModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}