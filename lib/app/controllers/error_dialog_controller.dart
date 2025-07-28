import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
class ErrorDialogController extends GetxController {
  bool errorDialogVisible = false;

  Future<void> showErrorDialog(String message) async {
    if (!errorDialogVisible) {
      errorDialogVisible = true;
      Get.defaultDialog(
        title: 'Error',
        content: Text(
          message,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        barrierDismissible: false,
        titleStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ).then((value) => errorDialogVisible = false);
    }
  }
}
