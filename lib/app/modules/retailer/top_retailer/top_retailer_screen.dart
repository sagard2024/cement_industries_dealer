import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class TopRetailerScreen extends StatefulWidget {
  const TopRetailerScreen({super.key});

  @override
  State<StatefulWidget> createState() => TopRetailerScreenState();
}

class TopRetailerScreenState extends State<TopRetailerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("Top 5 Retailers", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        children: [
          verticalSpace(7),
          ...top5Retailers.map((e) {
            var leftSide = 0;
            var rightSide = 0;
            getLeftRightSide(e, (left, right) {
              leftSide = left;
              rightSide = right;
            });
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
              ),
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
                  Text("${e["retailerName"]}", style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600)),
                  verticalSpace(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Last Month',
                        style: TextStyle(color: textColor.withValues(alpha: 0.5), fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'This Month',
                        style: TextStyle(color: textColor.withValues(alpha: 0.5), fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  verticalSpace(5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: leftSide,
                        child: Container(
                          height: 64,
                          decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                              bottomLeft: Radius.circular(32),
                            ),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(8),
                                ),
                                child: SvgPicture.asset(
                                  LocaleKeys.ic_contractor_retailer_back,
                                  color: whiteColor,
                                  fit: BoxFit.fill,
                                  width: Get.width,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Rs.',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontFamily: LocaleKeys.hanken,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${e["lastMonthValue"]} ',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontFamily: LocaleKeys.hanken,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(padding: const EdgeInsets.all(2.0), child: Container(width: 2, height: 40, color: themeColor)),
                      horizontalSpace(3),
                      Container(
                        width: 4,
                        height: 30,
                        decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(2))),
                      ),
                      horizontalSpace(3),
                      Flexible(
                        flex: rightSide,
                        child: Container(
                          height: 64,
                          decoration: BoxDecoration(
                            color: themeColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                              bottomLeft: Radius.circular(32),
                            ),
                            border: Border.all(color: themeColor),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Rs.',
                                    style: TextStyle(
                                      color: themeColor,
                                      fontFamily: LocaleKeys.hanken,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${e["thisMonthValue"]} ',
                                    style: TextStyle(
                                      color: themeColor,
                                      fontFamily: LocaleKeys.hanken,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          verticalSpace(7),
        ],
      ),
    );
  }

  void getLeftRightSide(Map<String, dynamic> e, Function(int, int) callback) {
    var leftSide = 0;
    var rightSide = 0;
    var total = (e["lastMonthValue"] + e["thisMonthValue"].toInt());
    if (total != 0) {
      leftSide = (e["lastMonthValue"] * 100) ~/ total;
      rightSide = (e["thisMonthValue"] * 100) ~/ total;
      if (leftSide < 15) {
        leftSide = 15;
        rightSide = 85;
      }
      if (rightSide < 15) {
        leftSide = 85;
        rightSide = 15;
      }
    } else {
      leftSide = 50;
      rightSide = 50;
    }
    callback(leftSide, rightSide);
  }
}
