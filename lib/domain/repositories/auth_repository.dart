import '../models/models.dart';

abstract interface class AuthRepository {
  Future<TokenPair> signIn(UserCredentials credentials);
  Future<TokenPair> refreshToken(String refresh);
  Future<RegisteredUser> register(RegisterCredentials credentials);
  Future<PasswordValidationResult> validatePassword(String password);
}
