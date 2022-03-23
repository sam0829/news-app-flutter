import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Base class of RestClient
abstract class RestClient {
  final String baseUrl;
  late Dio _dio;

  RestClient({
    required this.baseUrl,
    Interceptor? interceptor,
  }) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20000,
      receiveTimeout: 30000,
      headers: {Headers.acceptHeader: "application/json"},
      followRedirects: false,
    );

    _dio = Dio(options);

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio.interceptors.addAll([
      if (interceptor != null) interceptor,
      if (kDebugMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
    ]);
  }

  Dio dio() => _dio;
}
