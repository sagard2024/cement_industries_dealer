import 'package:flutter/material.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<StatefulWidget> createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  var selectPaymentOptions = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text("Payment Options", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        children: [
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Preferred Payment", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          verticalSpace(15),
          Container(
            decoration: BoxDecoration(
              color: cardBackColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Image.asset(LocaleKeys.iv_gpay, width: 40, height: 40),
                          horizontalSpace(20),
                          Text("Google Pay", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                          Spacer(),
                          Icon(selectPaymentOptions == 0 ? Icons.check_box : Icons.check_box_outline_blank),
                        ],
                      ),
                      verticalSpace(10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                            decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(8))),
                            child: Center(
                              child: Text(
                                "PAY VIA GOOGLEPAY",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  fontFamily: LocaleKeys.hanken,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).onClick(() {
                  selectPaymentOptions = 0;
                  setState(() {});
                }),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Row(
                    children: [
                      Image.asset(LocaleKeys.iv_visa, width: 40, height: 40),
                      horizontalSpace(20),
                      Text("One Card", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                      Spacer(),
                      Icon(selectPaymentOptions == 1 ? Icons.check_box : Icons.check_box_outline_blank),
                    ],
                  ),
                ).onClick(() {
                  selectPaymentOptions = 1;
                  setState(() {});
                }),
                verticalSpace(10),
              ],
            ),
          ),
          verticalSpace(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(LocaleKeys.iv_upi, width: 60, height: 60),
                horizontalSpace(10),
                Text("Pay by any UPI App", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          verticalSpace(5),
          Container(
            decoration: BoxDecoration(
              color: cardBackColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
            ),
            padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Row(
                    children: [
                      Image.asset(LocaleKeys.iv_paytm, width: 40, height: 40),
                      horizontalSpace(20),
                      Text("Paytm UPI", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                      Spacer(),
                      Icon(selectPaymentOptions == 2 ? Icons.check_box : Icons.check_box_outline_blank),
                    ],
                  ),
                ).onClick(() {
                  selectPaymentOptions = 2;
                  setState(() {});
                }),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      Image.asset(LocaleKeys.iv_cred, width: 30, height: 30),
                      horizontalSpace(30),
                      Text("CRED UPI", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                      Spacer(),
                      Icon(selectPaymentOptions == 3 ? Icons.check_box : Icons.check_box_outline_blank),
                    ],
                  ),
                ).onClick(() {
                  selectPaymentOptions = 3;
                  setState(() {});
                }),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: blackColor.withValues(alpha: 0.2)),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Icon(Icons.add, color: Colors.orange.shade900),
                      ),
                      horizontalSpace(30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add New UPI ID",
                            style: TextStyle(color: Colors.orange.shade900, fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "You need to have a registered UPI ID",
                            style: TextStyle(color: textColor.withValues(alpha: 0.5), fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
