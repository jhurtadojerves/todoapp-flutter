import 'package:dio/dio.dart';

/// Refresh uses a separate Dio. Queued errors reuse the token already refreshed
/// by the first request; this also avoids refreshing twice after token rotation.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required this.dio,
    required this.accessToken,
    required this.refresh,
    required this.onUnauthorized,
  });
  final Dio dio;
  final String? Function() accessToken;
  final Future<String?> Function() refresh;
  final Future<void> Function() onUnauthorized;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra['authenticated'] != false && accessToken() != null) {
      options.headers['Authorization'] = 'Bearer ${accessToken()}';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final error = err;
    final request = error.requestOptions;
    if (error.response?.statusCode != 401 ||
        request.extra['authenticated'] == false) {
      handler.next(error);
      return;
    }
    if (request.extra['retried'] == true) {
      handler.next(error);
      return;
    }
    try {
      final current = accessToken();
      final token =
          current != null &&
              request.headers['Authorization'] != 'Bearer $current'
          ? current
          : await refresh();
      if (token == null) {
        await onUnauthorized();
        handler.next(error);
        return;
      }
      request.headers['Authorization'] = 'Bearer $token';
      request.extra['retried'] = true;
      // Bypass this queued interceptor on the retry to avoid a queue deadlock.
      final retry = Dio(dio.options)..httpClientAdapter = dio.httpClientAdapter;
      try {
        handler.resolve(await retry.fetch<dynamic>(request));
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) await onUnauthorized();
        handler.next(e);
      }
    } catch (_) {
      handler.next(error);
    }
  }
}
