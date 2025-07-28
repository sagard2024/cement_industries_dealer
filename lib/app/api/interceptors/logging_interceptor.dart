import 'package:dio/dio.dart';
import 'package:cement_industries_dealer/app/logging/logger_factory.dart';
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra['X-Transcend-ID'] = DateTime.now().microsecondsSinceEpoch;
    LoggerFactory.getLogger('--> ${options.method} ${options.uri}');
    LoggerFactory.getLogger('X-Transcend-ID: ${options.extra['X-Transcend-ID']}');
    LoggerFactory.getLogger('\n');
    LoggerFactory.getLogger('Headers: ${options.headers.toString()}');
    LoggerFactory.getLogger('Body: ${options.data.toString()}');
    LoggerFactory.getLogger('Extras: ${options.extra.toString()}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LoggerFactory.getLogger('\n\n');
    LoggerFactory.getLogger('<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}');
    LoggerFactory.getLogger('X-Transcend-ID: ${response.requestOptions.extra['X-Transcend-ID']}');
    LoggerFactory.getLogger('\n');
    LoggerFactory.getLogger('Headers: ${response.headers.toString()}');
    LoggerFactory.getLogger('\n\n');
    LoggerFactory.getLogger('Response: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    LoggerFactory.getLogger('\n\n');
    LoggerFactory.getLogger('<-- Error: ${err.message} ${err.requestOptions.method} ${err.requestOptions.uri}');
    LoggerFactory.getLogger('X-Transcend-ID: ${err.requestOptions.extra['X-Transcend-ID']}');
    LoggerFactory.getLogger('Headers: ${err.response?.headers.toString()}');
    LoggerFactory.getLogger('Response:${err.response?.data.toString()}');
    super.onError(err, handler);
  }
}
