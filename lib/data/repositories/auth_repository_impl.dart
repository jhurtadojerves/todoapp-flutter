import '../../domain/models/models.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.source);
  final AuthDataSource source;
  @override
  Future<TokenPair> signIn(UserCredentials credentials) =>
      source.requestToken(credentials);
  @override
  Future<TokenPair> refreshToken(String refresh) =>
      source.refreshToken(refresh);
  @override
  Future<RegisteredUser> register(RegisterCredentials credentials) =>
      source.register(credentials);
  @override
  Future<PasswordValidationResult> validatePassword(String password) =>
      source.validatePassword(password);
}
