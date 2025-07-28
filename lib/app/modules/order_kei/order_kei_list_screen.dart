import 'package:flutter/material.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class OrderKeiListScreen extends StatefulWidget {
  const OrderKeiListScreen({super.key});

  @override
  State<StatefulWidget> createState() => OrderKeiListScreenState();
}

class OrderKeiListScreenState extends State<OrderKeiListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("Order to KEI", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        children: [
          verticalSpace(7),
          ...orderToKei.map(
            (e) => Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: cardBackColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Sales Order id: ",
                                style: TextStyle(color: textColor.withValues(alpha: 0.6), fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: "${e["salesOrderId"]}",
                                style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(6),
                        Text("${e["productName"]}", style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600)),
                        verticalSpace(20),
                        Text(
                          "Order Placed",
                          style: TextStyle(color: textColor.withValues(alpha: 0.6), fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text("${e["orderPlacedDate"]}", style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  horizontalSpace(10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                    decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Text("${e["amount"]}", style: TextStyle(color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600)),
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
