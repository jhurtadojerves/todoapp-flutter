import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todoapp_flutter/core/storage/secure_storage.dart';

class MockSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockSecureStorage storage;
  late SecureTokenStorage tokens;
  setUp(() {
    storage = MockSecureStorage();
    tokens = SecureTokenStorage(storage);
    when(() => storage.delete(key: 'access')).thenAnswer((_) async {});
    when(() => storage.delete(key: 'refresh')).thenAnswer((_) async {});
  });
  for (final missing in ['access', 'refresh']) {
    test('sesión incompleta sin $missing se limpia', () async {
      when(
        () => storage.read(key: 'access'),
      ).thenAnswer((_) async => missing == 'access' ? null : 'a');
      when(
        () => storage.read(key: 'refresh'),
      ).thenAnswer((_) async => missing == 'refresh' ? null : 'r');
      expect(await tokens.read(), null);
      verify(() => storage.delete(key: 'access')).called(1);
      verify(() => storage.delete(key: 'refresh')).called(1);
    });
  }
  test('ambos tokens válidos se restauran', () async {
    when(() => storage.read(key: 'access')).thenAnswer((_) async => 'a');
    when(() => storage.read(key: 'refresh')).thenAnswer((_) async => 'r');
    expect(await tokens.read(), (access: 'a', refresh: 'r'));
    verifyNever(() => storage.delete(key: 'access'));
  });
  test('fallo en escritura no deja pareja parcial', () async {
    when(
      () => storage.write(key: 'refresh', value: 'r'),
    ).thenAnswer((_) async {});
    when(
      () => storage.write(key: 'access', value: 'a'),
    ).thenThrow(Exception('Disk'));
    await expectLater(tokens.write('a', 'r'), throwsException);
    verify(() => storage.delete(key: 'access')).called(1);
    verify(() => storage.delete(key: 'refresh')).called(1);
  });
}
