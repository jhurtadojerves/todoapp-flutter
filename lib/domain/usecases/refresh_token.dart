import '../models/models.dart';
import '../repositories/auth_repository.dart';

class RefreshToken {
  const RefreshToken(this.repository);
  final AuthRepository repository;
  Future<TokenPair> call(String refresh) => repository.refreshToken(refresh);
}
