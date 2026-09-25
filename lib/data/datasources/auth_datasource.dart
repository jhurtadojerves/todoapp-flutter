import 'package:dio/dio.dart';
import '../../core/network/api_call.dart';
import '../../domain/models/models.dart';

class AuthDataSource {
  AuthDataSource(this.dio);
  final Dio dio;
  Options get public => Options(extra: {'authenticated': false});
  Future<TokenPair> requestToken(UserCredentials credentials) => apiCall(
    () => dio.post(
      '/api/v1/auth/token/',
      data: credentials.toJson(),
      options: public,
    ),
    (data) => TokenPair.fromJson(data as Map<String, dynamic>),
  );
  Future<TokenPair> refreshToken(String refresh) => apiCall(
    () => dio.post(
      '/api/v1/auth/token/refresh/',
      data: {'refresh': refresh},
      options: public,
    ),
    (data) {
      final json = data as Map<String, dynamic>;
      final access = json['access'] as String;
      if (access.isEmpty) throw const FormatException('Empty access token');
      return TokenPair(
        access: access,
        refresh: json['refresh'] as String? ?? refresh,
      );
    },
  );
  Future<RegisteredUser> register(RegisterCredentials credentials) => apiCall(
    () => dio.post(
      '/api/v1/users/register/',
      data: credentials.toJson(),
      options: public,
    ),
    (data) => RegisteredUser.fromJson(data as Map<String, dynamic>),
  );
  Future<PasswordValidationResult> validatePassword(String password) async {
    try {
      int? status;
      final body = await apiCall<dynamic>(() async {
        final response = await dio.post(
          '/api/v1/auth/password/validate/',
          data: {'password': password},
          options: Options(
            extra: {'authenticated': false},
            validateStatus: (s) => s == 200 || s == 204 || s == 400,
          ),
        );
        status = response.statusCode;
        return response;
      }, (data) => data);
      if (status == 400) {
        final errors = body is Map && body['password'] is List
            ? (body['password'] as List).whereType<String>().toList()
            : <String>[];
        return PasswordValidationResult(
          isValid: false,
          errors: errors.isEmpty ? ['Error al validar la contraseña'] : errors,
        );
      }
      return const PasswordValidationResult(isValid: true, errors: []);
    } catch (e) {
      return PasswordValidationResult(isValid: false, errors: [e.toString()]);
    }
  }
}
