import 'dart:async';

import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/controllers/cart_controller.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: backgroundColor, statusBarIconBrightness: Brightness.dark),
    );
    CartController().clearCart();
    Timer(const Duration(milliseconds: 1500), () async {
      Get.offAndToNamed(Routes.HOME_SCREEN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              shaderCallback:
                  (bounds) =>
                      LinearGradient(colors: [Colors.blue, Colors.purple]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                "Cement",
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteColor, fontSize: 50, fontWeight: FontWeight.w800, height: 1),
              ),
            ),
            Text(
              "Industries",
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontSize: 39, fontWeight: FontWeight.w600, height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
