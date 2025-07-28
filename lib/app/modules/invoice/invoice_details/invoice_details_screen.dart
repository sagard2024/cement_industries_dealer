import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/modules/receipt/receipt_details/receipt_details_screen.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() => InvoiceDetailsScreenState();
}

class InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  Map<String, dynamic> result = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("Invoice", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(color: cardBackColor, borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpace(15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(Icons.sticky_note_2, size: 20),
                        const SizedBox(width: 10),
                        Text(
                          "Summary",
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(15),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 15), child: const DottedDivider()),
                  verticalSpace(15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Order No.",
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${result["orderId"]}',
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Order Date",
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          result["orderDate"],
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Customer Name",
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          result["customerName"],
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(15),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 15), child: const DottedDivider()),
                  verticalSpace(15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Order Amount",
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "₹${result["totalAmount"]}",
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart, size: 20),
                        const SizedBox(width: 10),
                        Text(
                          "Product Details",
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(15),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 15), child: const DottedDivider()),
                  verticalSpace(15),
                  ...result["items"].map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            e["productId"],
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Qty.${e["quantity"]}",
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(Icons.fire_truck, size: 20),
                        const SizedBox(width: 10),
                        Text(
                          "Shipment Details",
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(15),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 15), child: const DottedDivider()),
                  verticalSpace(15),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result["shippingAddress"]["street"],
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "${result["shippingAddress"]["city"]}, ${result["shippingAddress"]["zip"]}",
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(15),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Center(
              child: Text(
                "Email Invoice",
                style: TextStyle(color: whiteColor, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: LocaleKeys.hanken),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
