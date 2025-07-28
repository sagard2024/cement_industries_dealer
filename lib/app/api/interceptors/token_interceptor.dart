import 'dart:io';

import 'package:dio/dio.dart';
import 'package:cement_industries_dealer/app/constant/app_version.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['appversion'] = appVersionCode;
    options.headers['device_type'] = Platform.isIOS ? 'IOS' : 'ANDROID';
    return super.onRequest(options, handler);
  }
}
