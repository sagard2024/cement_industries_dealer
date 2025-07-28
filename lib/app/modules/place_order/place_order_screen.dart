import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/EventModel.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/controllers/cart_controller.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<StatefulWidget> createState() => PlaceOrderScreenState();
}

class PlaceOrderScreenState extends State<PlaceOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("Cart", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        children: [
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Products", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          verticalSpace(10),
          ...CartController().cartProduct.map(
            (e) => Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: cardBackColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(e["imageUrl"], width: 70, height: 70, fit: BoxFit.contain),
                  ),
                  horizontalSpace(20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${e["name"]}", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600, height: 1)),
                        Text(
                          "${e["brand"]}",
                          style: TextStyle(color: textColor.withValues(alpha: 0.6), fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        verticalSpace(10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.only(bottom: 10, right: 10),
                          decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, color: whiteColor, size: 16),
                              horizontalSpace(5),
                              Text("${e["points"]}", style: TextStyle(color: whiteColor, fontSize: 16, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(10),
                  Icon(Icons.cancel, color: blackColor.withValues(alpha: 0.5)).onClick(() {
                    CartController().removeProductFromCart(e);
                    EventModel.eventBus.fire(CartUpdateEvent());
                    setState(() {});
                    if (CartController().cartProduct.isEmpty) {
                      Get.back();
                    }
                  }),
                ],
              ),
            ),
          ),
          verticalSpace(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Address Details", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                Container(
                  decoration: BoxDecoration(
                    color: cardBackColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: themeColor),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: Text("Change Address", style: TextStyle(color: themeColor, fontWeight: FontWeight.w600, fontSize: 16)),
                ),
              ],
            ),
          ),
          verticalSpace(15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: themeColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Studio Ardete", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600, height: 1)),
                verticalSpace(10),
                Text(
                  "SCO 43, Swastik Vihar Phase II, MDC Sector 5, Panchkula, Haryana",
                  style: TextStyle(color: textColor.withValues(alpha: 0.6), fontSize: 14, fontWeight: FontWeight.w600, height: 1),
                ),
              ],
            ),
          ),
          verticalSpace(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Payments Breakup", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          verticalSpace(15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: themeColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cart Total", style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600, height: 1)),
                    Text(
                      "${CartController().getTotalPoints}",
                      style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600, height: 1),
                    ),
                  ],
                ),
                verticalSpace(15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TDS Charges", style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600, height: 1)),
                    Text(
                      "${(CartController().getTotalPoints / 100).round()}(1%)",
                      style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600, height: 1),
                    ),
                  ],
                ),
                verticalSpace(10),
                Divider(color: themeColor),
                verticalSpace(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Order Points", style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600, height: 1)),
                    Text(
                      "${(CartController().getTotalPoints + (CartController().getTotalPoints / 100).round())}",
                      style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600, height: 1),
                    ),
                  ],
                ),
              ],
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
            decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Center(child: Text("Place Order", style: TextStyle(color: whiteColor, fontWeight: FontWeight.w700, fontSize: 16))),
          ),
        ],
      ),
    );
  }
}
