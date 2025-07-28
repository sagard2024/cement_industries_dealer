import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class RetailerOptionDialog extends StatefulWidget {
  const RetailerOptionDialog({super.key});

  @override
  State<StatefulWidget> createState() => RetailerOptionDialogState();
}

class RetailerOptionDialogState extends State<RetailerOptionDialog> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: -50,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(shape: BoxShape.circle, color: cardBackColor),
            child: Icon(Icons.clear_rounded, size: 16, color: themeColor),
          ).onClick(() {
            Get.back();
          }),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Retailers",
                  style: TextStyle(color: textColor, fontSize: 20, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700),
                ),
              ),
              verticalSpace(10),
              line(height: 1, width: MediaQuery.of(context).size.width),
              verticalSpace(10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                  child: Text(
                    'Order from Retailers',
                    style: TextStyle(color: whiteColor, fontSize: 16, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w500),
                  ),
                ),
              ).onClick(() {
                Get.back();
                Get.toNamed(Routes.ORDER_RETAILER_LIST_SCREEN);
              }),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                  child: Text(
                    'Top 5 Retailers',
                    style: TextStyle(color: whiteColor, fontSize: 16, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w500),
                  ),
                ),
              ).onClick(() {
                Get.back();
                Get.toNamed(Routes.TOP_RETAILER_SCREEN);
              }),
            ],
          ),
        ),
      ],
    );
  }

  void safeSetState(VoidCallback callback) {
    if (mounted) {
      setState(callback);
    }
  }
}
