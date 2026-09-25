import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/secure_storage.dart';
import '../../core/utils/jwt.dart';
import '../../core/network/api_client.dart';
import '../../data/datasources/auth_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/models/models.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/register.dart';
import '../../domain/usecases/refresh_token.dart';
import '../../domain/usecases/validate_password.dart';

final tokenStorageProvider = Provider<TokenStorage>(
  (ref) => SecureTokenStorage(),
);
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = createDio();
  ref.onDispose(() => dio.close());
  return AuthRepositoryImpl(AuthDataSource(dio));
});
final sessionProvider = AsyncNotifierProvider<SessionNotifier, TokenPair?>(
  SessionNotifier.new,
);
final loginUseCaseProvider = Provider(
  (ref) => Login(ref.watch(authRepositoryProvider)),
);
final registerUseCaseProvider = Provider(
  (ref) => Register(ref.watch(authRepositoryProvider)),
);
final refreshTokenUseCaseProvider = Provider(
  (ref) => RefreshToken(ref.watch(authRepositoryProvider)),
);
final validatePasswordUseCaseProvider = Provider(
  (ref) => ValidatePassword(ref.watch(authRepositoryProvider)),
);
final userIdProvider = Provider<int?>((ref) {
  final token = ref.watch(sessionProvider).value;
  return token == null ? null : userIdFromJwt(token.access);
});

final sessionExpiredProvider = NotifierProvider<SessionExpiredNotifier, int>(
  SessionExpiredNotifier.new,
);

class SessionExpiredNotifier extends Notifier<int> {
  @override
  int build() => 0;
  void notify() => state++;
}

class SessionNotifier extends AsyncNotifier<TokenPair?> {
  Future<String?>? _inFlight;
  int _generation = 0;
  Future<void> _storageTail = Future.value();
  Future<void> _storageAction(Future<void> Function() action) {
    final result = _storageTail.then((_) => action());
    _storageTail = result.then<void>(
      (_) {},
      onError: (Object _, StackTrace _) {},
    );
    return result;
  }

  Future<bool> _commit(TokenPair pair, int generation) async {
    final storage = ref.read(tokenStorageProvider);
    var committed = false;
    await _storageAction(() async {
      if (!ref.mounted || generation != _generation) return;
      await storage.write(pair.access, pair.refresh);
      if (!ref.mounted || generation != _generation) return;
      state = AsyncData(pair);
      committed = true;
    });
    return committed;
  }

  @override
  Future<TokenPair?> build() async {
    final pair = await ref.read(tokenStorageProvider).read();
    return pair == null
        ? null
        : TokenPair(access: pair.access, refresh: pair.refresh);
  }

  Future<void> login(String email, String password) async {
    final generation = ++_generation;
    final pair = await ref.read(loginUseCaseProvider)(
      UserCredentials(email: email.trim(), password: password),
    );
    if (generation != _generation) return;
    await _commit(pair, generation);
  }

  Future<void> register(RegisterCredentials credentials) async {
    final generation = _generation;
    await ref.read(registerUseCaseProvider)(credentials);
    if (!ref.mounted || generation != _generation) return;
    await login(credentials.email, credentials.password);
  }

  Future<void> logout() async {
    ++_generation;
    state = const AsyncData(null);
    final storage = ref.read(tokenStorageProvider);
    await _storageAction(storage.clear);
  }

  Future<String?> refresh() =>
      _inFlight ??= _refresh().whenComplete(() => _inFlight = null);
  Future<String?> _refresh() async {
    final pair = state.value;
    if (pair == null) return null;
    final generation = _generation;
    try {
      final updated = await ref.read(refreshTokenUseCaseProvider)(pair.refresh);
      if (generation != _generation) return null;
      return await _commit(updated, generation) ? updated.access : null;
    } catch (_) {
      if (generation == _generation) await logout();
      return null;
    }
  }
}
