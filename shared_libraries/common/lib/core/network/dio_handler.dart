import 'package:common/core/constans/constan_values.dart';
import 'package:common/core/network/api_inteceptor.dart';
import 'package:dependencies/dio/dio.dart';

class DioHandler {
  Dio get dio => _createDio();

  Dio _createDio() {
    final dio = Dio();

    const Duration duration = Duration(
      milliseconds: 20000,
    );

    dio
      ..options.baseUrl = ConstanValues.apiConstans.baseUrl
      ..options.connectTimeout = duration
      ..options.receiveTimeout = duration;

    dio.interceptors.add(
      ApiInterceptor(),
    );

    return dio;
  }
}
