import 'package:dio/dio.dart';
import 'api_exception.dart';

String errorMessage(dynamic body, int? status) {
  if (body is Map) {
    if (body['detail'] is String) return body['detail'] as String;
    for (final value in body.values) {
      if (value is List && value.isNotEmpty && value.first is String) {
        return value.first as String;
      }
      if (value is String) return value;
    }
  }
  return switch (status) {
    401 => 'Credenciales inválidas o sesión expirada.',
    403 => 'No tienes permiso para realizar esta acción.',
    404 => 'No se encontró el recurso solicitado.',
    429 => 'Demasiadas solicitudes. Inténtalo más tarde.',
    _ => 'No se pudo completar la solicitud.',
  };
}

Future<T> apiCall<T>(
  Future<Response<dynamic>> Function() request,
  T Function(dynamic) decode,
) async {
  try {
    final response = await request();
    try {
      return decode(response.data);
    } catch (_) {
      throw const ServerError();
    }
  } on DioException catch (error) {
    if ([
      DioExceptionType.connectionTimeout,
      DioExceptionType.receiveTimeout,
      DioExceptionType.sendTimeout,
    ].contains(error.type)) {
      throw const TimeoutError();
    }
    if (error.response == null) throw const NetworkError();
    final status = error.response?.statusCode;
    if (status != null && status >= 500) throw const ServerError();
    throw ApiError(errorMessage(error.response?.data, status), status);
  }
}
