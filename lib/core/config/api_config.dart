import 'package:flutter/foundation.dart';

class ApiConfig {
  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8080',
  );
  static const timeoutMs = int.fromEnvironment(
    'API_TIMEOUT_MS',
    defaultValue: 15000,
  );
  static void validate({String url = baseUrl, bool release = kReleaseMode}) {
    final uri = Uri.tryParse(url);
    if (uri == null ||
        !uri.hasAuthority ||
        uri.userInfo.isNotEmpty ||
        (uri.scheme != 'https' &&
            (release ||
                uri.scheme != 'http' ||
                !['10.0.2.2', 'localhost', '127.0.0.1'].contains(uri.host)))) {
      throw StateError(
        'API_BASE_URL debe usar HTTPS (HTTP local solo en desarrollo).',
      );
    }
  }
}
