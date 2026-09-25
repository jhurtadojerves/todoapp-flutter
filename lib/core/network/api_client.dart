import 'package:dio/dio.dart';
import '../config/api_config.dart';

Dio createDio() => Dio(
  BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    connectTimeout: const Duration(milliseconds: ApiConfig.timeoutMs),
    receiveTimeout: const Duration(milliseconds: ApiConfig.timeoutMs),
    sendTimeout: const Duration(milliseconds: ApiConfig.timeoutMs),
  ),
);
