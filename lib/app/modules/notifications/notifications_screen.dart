import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/widget_util.dart';
import '../../constant/local_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    // Get sample order data (you can modify indices as needed)
    final Map<String, dynamic> orderData1 = orders.isNotEmpty ? orders[0] : {};
    final Map<String, dynamic> orderData2 = orders.length > 1 ? orders[1] : (orders.isNotEmpty ? orders[0] : {});

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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Type 1 Notification - Sales Registration Request
            registrationNotificationItem(orderData1, 0),

            // Type 2 Notification - Influencer Sale Registration
            reviewNotificationItem(orderData2, 1),
          ],
        ),
      ),
    );
  }

  // Type 1 - Sales Registration Request
  Widget registrationNotificationItem(Map<String, dynamic> orderData, int orderIndex) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: blackColor.withAlpha(40),
            offset: const Offset(1.0, 1.0),
            blurRadius: 5,
            spreadRadius: 1.0,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "A sales registration request is pending your approval for ${orderData['dealerName'] ?? 'Unknown Dealer'} with a volume of ${orderData['quantity'] ?? '0'}MT",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                horizontalSpace(10),
                Text(
                  orderData['orderDate'] ?? '',
                  style: TextStyle(
                    color: textColor.withValues(alpha: 0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).onClick(() {
      // Navigate with type 1 arguments
      Get.toNamed(Routes.ORDER_DETAILS_SCREEN, arguments: {
        'type': 1,
        'orderIndex': orderIndex,
        'orderData': orderData,
      });
    });
  }

  // Type 2 - Influencer Sale Registration Review
  Widget reviewNotificationItem(Map<String, dynamic> orderData, int orderIndex) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: blackColor.withAlpha(40),
            offset: const Offset(1.0, 1.0),
            blurRadius: 5,
            spreadRadius: 1.0,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'You have a new influencer registration request waiting for your review. Tap to approve or reject',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    horizontalSpace(10),
                    Text(
                      orderData['orderDate'] ?? '',
                      style: TextStyle(
                        color: textColor.withValues(alpha: 0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).onClick(() {
      // Navigate with type 2 arguments
      Get.toNamed(Routes.ORDER_DETAILS_SCREEN, arguments: {
        'type': 2,
        'orderIndex': orderIndex,
        'orderData': orderData,
      });
    });
  }
}