import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../api.dart';

abstract class BaseClient extends API {
  final Dio _dio;
  static const String jsonContentType = "application/json; charset=utf-8";

  BaseClient({
    required String baseUrl,
    Duration timeout = const Duration(seconds: 8),
    Dio? dio,
  }) : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: baseUrl,
                receiveDataWhenStatusError: true,
                contentType: jsonContentType,
                sendTimeout: timeout,
                connectTimeout: timeout,
                receiveTimeout: timeout,
              ),
            ) {
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );
  }

  @override
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    ResponseType responseType = ResponseType.json,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          responseType: responseType,
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body = const {},
  }) async {
    try {
      final Response<dynamic> response = await _dio.post(
        path,
        options: Options(
          headers: headers,
          responseType: ResponseType.json,
        ),
        queryParameters: queryParameters,
        data: body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
