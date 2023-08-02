import 'package:common/core/network/dio_handler.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:dependencies/get_it/get_it.dart';

class RegisterCoreModule {
  RegisterCoreModule() {
    _registCore();
  }

  _registCore() {
    sl.registerLazySingleton<Dio>(() => sl<DioHandler>().dio);
    sl.registerLazySingleton<DioHandler>(
      () => DioHandler(),
    );
  }
}
