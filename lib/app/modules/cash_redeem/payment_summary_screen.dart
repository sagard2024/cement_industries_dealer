import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSummaryScreen extends StatefulWidget {
  const PaymentSummaryScreen({super.key});

  @override
  State<PaymentSummaryScreen> createState() => PaymentSummaryScreenState();
}

class PaymentSummaryScreenState extends State<PaymentSummaryScreen> {
  dynamic arguments = Get.arguments;
  num totalPoints = 0;
  num redeemPoints = 0;

  @override
  void initState() {
    super.initState();
    if (arguments != null && arguments is Map<String, dynamic>) {
      if (arguments.containsKey("totalPoints")) {
        totalPoints = arguments["totalPoints"];
      }
      if (arguments.containsKey("redeemPoints")) {
        redeemPoints = arguments["redeemPoints"];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final redeemValue = redeemPoints / 200;
    final tds = redeemValue / 20;
    final netAmount = redeemValue - tds;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
          "Payment Summary",
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
                _summaryRow("Points to be redeemed", "$redeemPoints"),
                _summaryRow("Redemption value in INR", "$redeemValue"),
                _summaryRow("TDS applicable at 20%", "-$tds"),
                _summaryRow(
                  "Remaining Points Balance",
                  "${totalPoints - redeemPoints}",
                ),
                verticalSpace(10),
                Divider(color: themeColor),
                verticalSpace(10),
                _summaryRow("Net amount to be paid", "$netAmount"),
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
                'Proceed ->',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ).onClick(() {}),
        ],
      ),
    );
  }

  Widget _summaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
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
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
