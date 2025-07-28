import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:cement_industries_dealer/app/api/api_controller.dart';
import 'package:cement_industries_dealer/app/controllers/loader_controller.dart';

class LoaderInterceptor extends Interceptor {
  final LoaderController _loaderController = Get.find();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final extra = options.extra;
    bool loadingState = true;
    if (extra.containsKey(ApiController.LOADING_STATE)) loadingState = extra[ApiController.LOADING_STATE];
    if (loadingState) {
      _loaderController.showLoader();
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final extra = response.requestOptions.extra;
    bool loadingState = true;
    if (extra.containsKey(ApiController.LOADING_STATE)) loadingState = extra[ApiController.LOADING_STATE];
    if (loadingState) _loaderController.hideLoader();
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    _loaderController.hideLoader();
    super.onError(err, handler);
  }
}
