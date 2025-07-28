import 'package:dio/dio.dart';
import 'package:cement_industries_dealer/app/api/interceptors/loader_interceptor.dart';
import 'package:cement_industries_dealer/app/api/interceptors/logging_interceptor.dart';
import 'package:cement_industries_dealer/app/api/interceptors/token_interceptor.dart';

class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();
  late Dio _dio;

  factory DioSingleton() {
    return _singleton;
  }

  DioSingleton._internal() {
    _dio = Dio();
    _dio.options.connectTimeout = const Duration(minutes: 5);
    _dio.options.receiveTimeout = const Duration(minutes: 5);
    dio.interceptors.add(LoaderInterceptor());
    dio.interceptors.add(TokenInterceptor());
    dio.interceptors.add(LoggingInterceptor());
  }

  Dio get dio {
    return _dio;
  }
}
