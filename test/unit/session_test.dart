import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todoapp_flutter/domain/models/models.dart';
import 'package:todoapp_flutter/domain/repositories/auth_repository.dart';
import 'package:todoapp_flutter/presentation/providers/dependencies.dart';
import 'package:todoapp_flutter/presentation/providers/session_provider.dart';
import '../widget_test.dart' show MemoryTokens;

class MockAuth extends Mock implements AuthRepository {}

void main() {
  const pair = TokenPair(access: 'access', refresh: 'refresh');
  const credentials = UserCredentials(
    email: 'u@example.com',
    password: 'secret',
  );
  const registration = RegisterCredentials(
    username: 'user',
    email: 'u@example.com',
    password: 'secret',
    firstName: '',
    lastName: '',
  );
  late ProviderContainer container;
  late MockAuth auth;
  late MemoryTokens storage;
  setUp(() {
    auth = MockAuth();
    storage = MemoryTokens();
    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(auth),
        tokenStorageProvider.overrideWithValue(storage),
      ],
    );
  });
  tearDown(() => container.dispose());
  test('sin tokens no hay sesión', () async {
    expect(await container.read(sessionProvider.future), null);
  });
  test('restaura ambos tokens', () async {
    storage.pair = (access: 'access', refresh: 'refresh');
    expect(await container.read(sessionProvider.future), pair);
  });
  test('login persiste', () async {
    await container.read(sessionProvider.future);
    when(() => auth.signIn(credentials)).thenAnswer((_) async => pair);
    await container
        .read(sessionProvider.notifier)
        .login(credentials.email, credentials.password);
    expect(container.read(sessionProvider).value, pair);
    expect(storage.pair?.refresh, 'refresh');
  });
  test('registro hace login automático', () async {
    await container.read(sessionProvider.future);
    when(() => auth.register(registration)).thenAnswer(
      (_) async => const RegisteredUser(
        username: 'user',
        email: 'u@example.com',
        firstName: null,
        lastName: null,
      ),
    );
    when(() => auth.signIn(credentials)).thenAnswer((_) async => pair);
    await container.read(sessionProvider.notifier).register(registration);
    verifyInOrder([
      () => auth.register(registration),
      () => auth.signIn(credentials),
    ]);
    expect(storage.pair?.access, 'access');
  });
  test('logout limpia memoria y disco', () async {
    storage.pair = (access: 'access', refresh: 'refresh');
    await container.read(sessionProvider.future);
    await container.read(sessionProvider.notifier).logout();
    expect(storage.pair, null);
    expect(container.read(sessionProvider).value, null);
  });
  test('refresh comparte llamada', () async {
    storage.pair = (access: 'access', refresh: 'refresh');
    await container.read(sessionProvider.future);
    final pending = Completer<TokenPair>();
    when(() => auth.refreshToken('refresh')).thenAnswer((_) => pending.future);
    final notifier = container.read(sessionProvider.notifier);
    final a = notifier.refresh(), b = notifier.refresh();
    pending.complete(const TokenPair(access: 'new', refresh: 'rotated'));
    expect(await Future.wait([a, b]), ['new', 'new']);
    verify(() => auth.refreshToken('refresh')).called(1);
    expect(storage.pair?.refresh, 'rotated');
  });
  test('refresh fallido borra tokens', () async {
    storage.pair = (access: 'access', refresh: 'refresh');
    await container.read(sessionProvider.future);
    when(() => auth.refreshToken('refresh')).thenThrow(Exception('Expired'));
    expect(await container.read(sessionProvider.notifier).refresh(), null);
    expect(storage.pair, null);
  });
  test('401 con sesión activa avisa sesión expirada', () async {
    storage.pair = (access: 'access', refresh: 'refresh');
    await container.read(sessionProvider.future);
    when(() => auth.refreshToken('refresh')).thenThrow(Exception('Expired'));
    final dio = container.read(apiClientProvider);
    DioAdapter(dio: dio).onGet('/x', (s) => s.reply(401, {}));
    await expectLater(dio.get('/x'), throwsA(isA<DioException>()));
    expect(container.read(sessionExpiredProvider), 1);
    expect(storage.pair, null);
  });
  test('401 tras logout no avisa sesión expirada', () async {
    await container.read(sessionProvider.future);
    final dio = container.read(apiClientProvider);
    DioAdapter(dio: dio).onGet('/x', (s) => s.reply(401, {}));
    await expectLater(dio.get('/x'), throwsA(isA<DioException>()));
    expect(container.read(sessionExpiredProvider), 0);
  });
  test('refresh tardío no restaura sesión cerrada', () async {
    storage.pair = (access: 'access', refresh: 'refresh');
    await container.read(sessionProvider.future);
    final pending = Completer<TokenPair>();
    when(() => auth.refreshToken('refresh')).thenAnswer((_) => pending.future);
    final notifier = container.read(sessionProvider.notifier);
    final refresh = notifier.refresh();
    await notifier.logout();
    pending.complete(pair);
    expect(await refresh, null);
    expect(storage.pair, null);
  });
}
