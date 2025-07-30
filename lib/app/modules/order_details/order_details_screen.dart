import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // Get arguments from GetX navigation
    final arguments = Get.arguments;
    final int displayType = arguments?['type'] ?? 1; // Default to type 1
    final int orderIndex = arguments?['orderIndex'] ?? 0; // Default to first order

    // Get the order data based on index
    final Map<String, dynamic> orderData = orders.isNotEmpty ? orders[orderIndex] : {};

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
          "Order Details",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: displayType == 1 ? cardType1(orderData) : cardType2(orderData),
    );
  }

  Widget cardType1(Map<String, dynamic> orderData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderData['dealerName'] ?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              verticalSpace(12),
              // Product Type and Quantity
              Row(
                children: [
                  Text(
                    'Product: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${orderData['productType'] ?? ''} (${orderData['quantity'] ?? ''}MT)',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              verticalSpace(6),
              _buildActionButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget cardType2(Map<String, dynamic> orderData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Row(
                children: [
                  Text(
                    'Name: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      orderData['dealerName'] ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(8),

              // City
              Row(
                children: [
                  Text(
                    'City: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      orderData['city'] ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(8),

              // Area Office
              Row(
                children: [
                  Text(
                    'Area Office: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      orderData['areaOffice'] ?? 'N/A',
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(8),

              // Phone Number
              Row(
                children: [
                  Text(
                    'Phone: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      orderData['phoneNo'] ?? 'N/A',
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(12),

              _buildActionButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                child: Text(
                  "Reject",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ).onClick(() {
              // Handle reject action
              print("Order rejected");
            }),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                child: Text(
                  "Approve",
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ).onClick(() {
              // Handle approve action
              print("Order approved");
            }),
          ),
        ],
      ),
    );
  }
}