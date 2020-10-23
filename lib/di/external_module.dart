import 'package:dio/dio.dart';
import 'package:flutter_base/di/container_module.dart';

void getExternal() {
  Dio dio = Dio();
  BaseOptions options =
      BaseOptions(connectTimeout: 10 * 1000, receiveTimeout: 30 * 1000);
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    requestBody: true,
  ));
  dio.options = options;
  get.registerLazySingleton<Dio>(() => dio);
}
