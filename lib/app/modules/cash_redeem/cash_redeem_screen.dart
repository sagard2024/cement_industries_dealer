import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/app/widget/flutter_toast.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CashRedeemScreen extends StatefulWidget {
  const CashRedeemScreen({super.key});

  @override
  State<CashRedeemScreen> createState() => CashRedeemScreenState();
}

class CashRedeemScreenState extends State<CashRedeemScreen> {
  num points = 200000;
  TextEditingController pointController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
          "Cash Redeem",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: cardBackColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: themeColor),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withAlpha(40),
                  offset: const Offset(1.0, 1.0),
                  blurRadius: 5,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Balance",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "$points pts",
                  style: TextStyle(
                    color: themeColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                verticalSpace(20),
                Text(
                  "Your Bank Details",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpace(5),
                _bankRow("Name", "Sukwinder Singh"),
                _bankRow("Type", "Saving"),
                _bankRow("A/C No.", "XXXXXX1356"),
              ],
            ),
          ),
          verticalSpace(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: pointController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Enter Points',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1000 Pts = Rs 200",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Redeem All",
                  style: TextStyle(
                    color: themeColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: themeColor,
                  ),
                ).onClick(() => pointController.text = "$points"),
              ],
            ),
          ),
          verticalSpace(20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: Center(
              child: Text(
                'Redeem Points ->',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ).onClick(_onRedeemTap),
        ],
      ),
    );
  }

  Widget _bankRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor.withValues(alpha: 0.5),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _onRedeemTap() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (pointController.text.trim().isEmpty) {
      FlutterToastX.showErrorToastBottom(
        context,
        "Please enter the number of points to redeem.",
      );
      return;
    }

    final inputPoints = num.parse(pointController.text);
    if (inputPoints < 1000) {
      FlutterToastX.showErrorToastBottom(
        context,
        "Minimum redeemable points is 1000.",
      );
      return;
    }
    if (inputPoints > points) {
      FlutterToastX.showErrorToastBottom(
        context,
        "You do not have enough points to redeem.",
      );
      return;
    }

    Get.toNamed(
      Routes.PAYMENT_SUMMARY_SCREEN,
      arguments: {"redeemPoints": inputPoints, "totalPoints": points},
    );
  }
}
