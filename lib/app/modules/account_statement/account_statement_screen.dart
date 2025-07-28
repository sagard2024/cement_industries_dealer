import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class AccountStatementScreen extends StatefulWidget {
  const AccountStatementScreen({super.key});

  @override
  State<StatefulWidget> createState() => AccountStatementScreenState();
}

class AccountStatementScreenState extends State<AccountStatementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("Account Statement", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        children: [
          verticalSpace(7),
          ...accountStatementList.map(
            (e) => Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(color: themeColor),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${e["date"]}",
                                style: TextStyle(color: textColor.withValues(alpha: 0.5), fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              verticalSpace(6),
                              Text("${e["action"]}", style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        horizontalSpace(20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          width: 90,
                          height: 80,
                          decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("${e["points"]}", style: TextStyle(color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600)),
                                Text("${e["type"]}", style: TextStyle(color: whiteColor, fontSize: 13, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: cardBackColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Closing Balance: ",
                            style: TextStyle(color: textColor.withValues(alpha: 0.6), fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "${e["closingBalance"]}",
                            style: TextStyle(color: themeColor, fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
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
