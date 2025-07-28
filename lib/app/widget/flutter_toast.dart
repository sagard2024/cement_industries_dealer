import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';

abstract class FlutterToastX {
  static void withoutContextErrorToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: whiteColor,
      fontSize: 14,
    );
  }

  static void showErrorToastBottom(BuildContext context, String text) async {
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.red,
        // border: Border.all(color: dividerColor, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           Icon(Icons.warning_rounded, color: whiteColor),
          const SizedBox(width: 6.0),
          Expanded(
              child: Text(text,
                  style:  TextStyle(color: whiteColor, fontWeight: FontWeight.w700,  height: 1.2, fontSize: 14),
                  maxLines: 5,
                  // textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

  static void showSuccessToastBottom(BuildContext context, String text, {int duration = 4}) async {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: Colors.green[900]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           Icon(Icons.check_circle, color: whiteColor),
          const SizedBox(width: 6.0),
          Expanded(
              child: Text(text,
                  style:  TextStyle(color: whiteColor, fontWeight: FontWeight.w700,  height: 1.2, fontSize: 14),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: duration),
    );
  }

  static void showSuccessToastTop(BuildContext context, String text, {int duration = 4}) async {
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: Colors.green[900]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           Icon(Icons.check_circle, color: whiteColor),
          const SizedBox(width: 6.0),
          Expanded(
              child: Text(text,
                  style:  TextStyle(color: whiteColor, fontWeight: FontWeight.w700, height: 1.2, fontSize: 14),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: duration),
    );
  }

  static void showToastCenter(String text) async {
    Fluttertoast.showToast(
        msg: text, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, backgroundColor: Colors.grey, timeInSecForIosWeb: 1, fontSize: 14);
  }

  static void showToastB(String text) async {
    Fluttertoast.showToast(
        msg: text, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, fontSize: 14);
  }

  static void showErrorToastB(String text) async {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        fontSize: 14);
  }
}
