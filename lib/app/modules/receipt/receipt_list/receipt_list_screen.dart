import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class ReceiptListScreen extends StatefulWidget {
  const ReceiptListScreen({super.key});

  @override
  State<StatefulWidget> createState() => ReceiptListScreenState();
}

class ReceiptListScreenState extends State<ReceiptListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("Payment Receipts", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        children: [
          verticalSpace(7),
          ...receiptList.map(
            (e) => Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // border: Border.all(color: themeColor),
                boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Transaction ID: ",
                                    style: TextStyle(color: textColor.withValues(alpha: 0.6), fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                  TextSpan(
                                    text: "${e["transactionId"]}",
                                    style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              e["date"],
                              style: TextStyle(color: textColor.withValues(alpha: 0.6), fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        verticalSpace(5),
                        Text("₹${e["amount"]}", style: TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  // Divider(color: themeColor, height: 1),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(color: cardBackColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: themeColor),
                              color: whiteColor,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                      color: themeColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontFamily: LocaleKeys.hanken,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).onClick(() => Get.toNamed(Routes.RECEIPT_DETAILS_SCREEN, arguments: e)),
                        ),
                        horizontalSpace(15),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(8))),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontFamily: LocaleKeys.hanken,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).onClick(() {}),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(7),
        ],
      ),
    );
  }
}
