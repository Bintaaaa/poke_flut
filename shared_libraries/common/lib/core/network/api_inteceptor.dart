import 'dart:convert';
import 'dart:developer';

import 'package:dependencies/dio/dio.dart';

class ApiInterceptor extends Interceptor {
  Future<Map<String, dynamic>> _defaultHeders() async {
    Map<String, dynamic> headers = {};

    headers['Content-Type'] = 'application/json';
    headers['Accept'] = 'application/json';

    return headers;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final prettyString = const JsonEncoder.withIndent(' ').convert(
      response.data,
    );
    log(
      'Status Code: ${response.statusCode}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Response : $prettyString\n',
    );
    return handler.next(response);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final headers = await _defaultHeders();
      options.headers.addAll(headers);

      final requestBody =
          const JsonEncoder.withIndent('  ').convert(options.data);
      final queryParameters =
          const JsonEncoder.withIndent('  ').convert(options.queryParameters);
      log(
        'Request URL : ${options.uri}\n'
        '----------------------------------------------------------------------\n'
        'Header: ${options.headers}\n'
        '----------------------------------------------------------------------\n'
        'Request Body: $requestBody\n'
        '----------------------------------------------------------------------\n'
        'Request Query Parameters: $queryParameters\n'
        '----------------------------------------------------------------------\n'
        'Method: ${options.method}\n',
      );
      return handler.next(options);
    } catch (e) {
      final queryParameters =
          const JsonEncoder.withIndent('  ').convert(options.queryParameters);
      log(
        'Request URL : ${options.uri}\n'
        '----------------------------------------------------------------------\n'
        'Header: ${options.headers}\n'
        '----------------------------------------------------------------------\n'
        'Request Body: cannot read request body\n'
        '----------------------------------------------------------------------\n'
        'Request Query Parameters: $queryParameters\n'
        '----------------------------------------------------------------------\n'
        'Method: ${options.method}\n',
      );
      return handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Dio Error : $err, ${err.response}');
    return handler.next(err);
  }
}
