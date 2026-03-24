import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedeemOptionDialog extends StatefulWidget {
  const RedeemOptionDialog({super.key});

  @override
  State<StatefulWidget> createState() => RedeemOptionDialogState();
}

class RedeemOptionDialogState extends State<RedeemOptionDialog> {
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: cardBackColor,
            ),
            child: Icon(Icons.clear_rounded, size: 16, color: themeColor),
          ).onClick(() {
            Get.back();
          }),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Redeem Options",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              verticalSpace(10),
              line(height: 1, width: MediaQuery.of(context).size.width),
              verticalSpace(10),
              _optionButton(
                title: "Redeem Products",
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.PRODUCT_LIST_SCREEN);
                },
              ),
              _optionButton(
                title: "Redeem Voucher",
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.VOUCHER_LIST_SCREEN);
                },
              ),
              _optionButton(
                title: "Redeem Cash",
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.REDEEM_POINTS_SCREEN);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _optionButton({required String title, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: themeColor,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ).onClick(onTap);
  }
}
