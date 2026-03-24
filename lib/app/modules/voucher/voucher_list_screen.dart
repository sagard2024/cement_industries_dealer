import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoucherListScreen extends StatefulWidget {
  const VoucherListScreen({super.key});

  @override
  State<StatefulWidget> createState() => VoucherListScreenState();
}

class VoucherListScreenState extends State<VoucherListScreen> {
  final List<Map<String, dynamic>> _vouchers = [
    {
      "name": "Amazon Gift Voucher",
      "brand": "Amazon",
      "points": 3000,
      "validity": "31 Dec 2026",
    },
    {
      "name": "Flipkart Gift Voucher",
      "brand": "Flipkart",
      "points": 2500,
      "validity": "31 Dec 2026",
    },
    {
      "name": "Fuel Voucher",
      "brand": "IndianOil",
      "points": 2000,
      "validity": "30 Nov 2026",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
          "Voucher List",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          verticalSpace(15),
          ..._vouchers.map(
            (item) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: themeColor),
                color: cardBackColor,
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
                    "${item["name"]}",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalSpace(4),
                  Text(
                    "${item["brand"]}",
                    style: TextStyle(
                      color: textColor.withValues(alpha: 0.7),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Validity: ${item["validity"]}",
                    style: TextStyle(
                      color: textColor.withValues(alpha: 0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${item["points"]} pts",
                        style: TextStyle(
                          color: themeColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        child: Text(
                          "Redeem",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ).onClick(() {
                        Map<String, String> arguments = {"title": "Vouchers"};
                        Get.toNamed(
                          Routes.PLACE_ORDER_SCREEN,
                          arguments: arguments,
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
