import '../models/models.dart';
import '../repositories/auth_repository.dart';

class Register {
  const Register(this.repository);
  final AuthRepository repository;
  Future<RegisteredUser> call(RegisterCredentials credentials) =>
      repository.register(credentials);
}
