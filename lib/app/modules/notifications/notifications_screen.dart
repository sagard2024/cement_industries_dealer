import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: blackColor.withAlpha(40),
            offset: const Offset(1.0, 1.0),
            blurRadius: 5,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Number and Date
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    orderData['orderNumber'] ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  horizontalSpace(12),
                  Text(
                    orderData['orderDate'] ?? '',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
              verticalSpace(12),

              // Dealer Name
              Row(
                children: [
                  Text(
                    'Dealer: ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      orderData['dealerName'] ?? '',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              verticalSpace(6),

              // Product Type and Quantity
              Row(
                children: [
                  Text(
                    'Product: ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Text(
                    '${orderData['productType'] ?? ''} (${orderData['quantity']} MT)',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              verticalSpace(6),

              // Vehicle Type and Source
              Row(
                children: [
                  Text(
                    'Vehicle: ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Text(
                    orderData['vehicleType'] ?? '',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              verticalSpace(6),

              Row(
                children: [
                  Text(
                    'Source: ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      orderData['preferredSource'] ?? '',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              verticalSpace(6),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expected Delivery:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        orderData['expectedDeliveryDate'] ?? '',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Order Value:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        orderData['orderValue'] ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: getOrderStatusColor(orderData['orderStatus'] ?? ''),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                (orderData['orderStatus'] ?? '').toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
