import 'package:dio/dio.dart';

abstract class API {
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParameters,
  });

  Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic> headers,
    dynamic body,
  });
}
