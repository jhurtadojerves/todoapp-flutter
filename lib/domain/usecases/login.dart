import '../models/models.dart';
import '../repositories/auth_repository.dart';

class Login {
  const Login(this.repository);
  final AuthRepository repository;
  Future<TokenPair> call(UserCredentials credentials) =>
      repository.signIn(credentials);
}
