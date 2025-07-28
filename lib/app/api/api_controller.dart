import 'dart:io';

import 'package:dio/dio.dart';
import 'package:cement_industries_dealer/app/api/dio_http_client.dart';

class ApiController {
  var tag = 'ApiController';
  static const String LOADING_STATE = 'loading-state';
  static const String IS_RESET = 'isReset';
  static const String LOADING_TITLE = 'loading-title';
  static const String LOADING_TYPE = 'loading-type';
  static final ApiController _instance = ApiController._internal();
  Dio dio = DioSingleton().dio;

  ApiController._internal();

  factory ApiController() {
    return _instance;
  }

  Future<Response> post(String url, {Map<String, dynamic>? headers, body, encoding, payload, extras}) async {
    Map<String, dynamic> headersMap = {};
    if (headers != null) headersMap.addAll(headers);
    Response response = await dio.post(
      url,
      data: body,
      queryParameters: payload,
      options: Options(contentType: ContentType.json.toString(), method: 'POST', headers: headersMap, extra: extras),
    );
    return response;
  }

  Future<Response> postFromUrlEncoded(String url, {Map<String, dynamic>? headers, body, encoding, payload, extras}) async {
    Map<String, dynamic> headersMap = {};
    if (headers != null) headersMap.addAll(headers);
    Response response = await dio.post(
      url,
      data: body,
      queryParameters: payload,
      options: Options(contentType: 'application/x-www-form-urlencoded', method: 'POST', headers: headersMap, extra: extras),
    );
    return response;
  }

  Future<Response> multipartPost(String url, {Map<String, dynamic>? headers, body, encoding, payload, extras}) async {
    Map<String, dynamic> headersMap = {};
    if (headers != null) headersMap.addAll(headers);
    Response response = await dio.post(
      url,
      data: body,
      queryParameters: payload,
      options: Options(contentType: 'multipart/form-data', method: 'POST', headers: headersMap, extra: extras),
    );
    return response;
  }

  Future<Response> put(String url, {Map<String, dynamic>? headers, body, encoding, payload}) async {
    Map<String, dynamic> headersMap = {};
    if (headers != null) headersMap.addAll(headers);
    Response response = await dio.put(
      url,
      data: body,
      queryParameters: payload,
      options: Options(
        contentType: ContentType.json.toString(),
        method: 'POST',
        headers: headersMap,
      ),
    );
    return response;
  }

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? headers, body, encoding, payload, extras}) async {
    Map<String, dynamic> headerMap = {};
    if (headers != null) headerMap.addAll(headers);
    Response response = await dio.get(
      url,
      queryParameters: payload,
      options: Options(
        contentType: ContentType.json.toString(),
        method: 'GET',
        headers: headerMap,
        extra: extras,
      ),
    );
    return response;
  }

  Future<Response<dynamic>> delete(String url, {Map<String, dynamic>? headers, body, encoding, payload, extras}) async {
    Map<String, dynamic> headerMap = {};
    if (headers != null) headerMap.addAll(headers);
    extras ??= {'loading-state': true};
    Response response = await dio.delete(
      url,
      queryParameters: payload,
      options: Options(
        contentType: ContentType.json.toString(),
        method: 'GET',
        headers: headerMap,
        extra: extras,
      ),
    );
    return response;
  }

  Future<Response> download(String url, {Map<String, dynamic>? headers, body, encoding, payload, extras}) async {
    Map<String, dynamic> headerMap = {};
    if (headers != null) headerMap.addAll(headers);
    extras ??= {'loading-state': true};
    Response response = await dio.get(
      url,
      queryParameters: payload,
      options: Options(
        responseType: ResponseType.bytes,
        contentType: ContentType.json.toString(),
        followRedirects: false,
        method: 'GET',
        extra: extras,
        headers: headerMap,
      ),
    );
    return response;
  }
}
