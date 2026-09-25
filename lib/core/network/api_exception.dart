sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
  @override
  String toString() => message;
}

class NetworkError extends AppException {
  const NetworkError()
    : super('No se pudo conectar con el servidor. Revisa tu conexión.');
}

class TimeoutError extends AppException {
  const TimeoutError()
    : super('La solicitud tardó demasiado. Inténtalo de nuevo.');
}

class ServerError extends AppException {
  const ServerError() : super('El servidor devolvió una respuesta inesperada.');
}

class ApiError extends AppException {
  const ApiError(super.message, this.statusCode);
  final int? statusCode;
}
