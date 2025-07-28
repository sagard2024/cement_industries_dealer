import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';

class LoaderController extends GetxController {
  static LoaderController get instance => Get.find<LoaderController>();
  var isLoading = false;

  Future<void> showLoader() async {
    if (!isLoading) {
      isLoading = true;
      Get.dialog(
        Center(child: SpinKitFadingCircle(color: themeColor, size: 50.0)),
        barrierDismissible: false,
      ).then((value) => isLoading = false);
    }
  }

  void hideLoader() {
    if (isLoading) Get.back();
    isLoading = false;
  }
}
