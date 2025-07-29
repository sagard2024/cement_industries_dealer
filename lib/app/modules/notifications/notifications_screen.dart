import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/local_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
          "Notifications",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final orderData = orders[index];
          return notificationItem(orderData);
        },
      ),
    );
  }

  Widget notificationItem(Map<String, dynamic> orderData) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: blackColor.withAlpha(40),
              offset: const Offset(1.0, 1.0),
              blurRadius: 5,
              spreadRadius: 1.0)
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order Number and Date
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Order ID: ",
                            style: TextStyle(
                                color: textColor.withValues(alpha: 0.6),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "${orderData['orderNumber']}",
                            style: TextStyle(color: textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      orderData['orderDate'] ?? '',
                      style: TextStyle(color: textColor.withValues(
                          alpha: 0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "${orderData['dealerName']} has requested to place an order. Please click on this notification to view the details.",
                  style: TextStyle(color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

        ],
      ),
    ).onClick(() {
      //
      Get.toNamed(Routes.ORDER_DETAILS_SCREEN, arguments: orderData);
    });
  }
}
