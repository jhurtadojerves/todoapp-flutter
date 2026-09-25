import '../models/models.dart';
import '../repositories/auth_repository.dart';

class ValidatePassword {
  const ValidatePassword(this.repository);
  final AuthRepository repository;
  Future<PasswordValidationResult> call(String password) =>
      repository.validatePassword(password);
}
