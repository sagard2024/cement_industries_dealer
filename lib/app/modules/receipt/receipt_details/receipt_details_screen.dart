import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class ReceiptDetailsScreen extends StatefulWidget {
  const ReceiptDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() => ReceiptDetailsScreenState();
}

class ReceiptDetailsScreenState extends State<ReceiptDetailsScreen> {
  Map<String, dynamic> result = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("Receipts", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ClipPath(
              clipper: TicketClipper(),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(color: cardBackColor, borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Transaction ID: ',
                                  style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text: result["transactionId"],
                                  style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Text(result["date"], style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    const DottedDivider(),
                    verticalSpace(15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          SvgPicture.asset(LocaleKeys.ic_payment, height: 16, width: 16),
                          const SizedBox(width: 4),
                          Text(
                            "Payment Details",
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 18, fontWeight: FontWeight.w700),
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
                            "Reference No.",
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            result["referenceNo"],
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
                            "Amount",
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '₹${result["amount"]}',
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
                            "Type of collection",
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            result["typeOfCollection"],
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(15),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: Offset(0.0, size.height / 5), radius: 6.0));
    path.addOval(Rect.fromCircle(center: Offset(size.width, size.height / 5), radius: 6.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DottedDivider extends StatelessWidget {
  const DottedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        const dashHeight = 1.0;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(width: dashWidth, height: dashHeight, child: DecoratedBox(decoration: BoxDecoration(color: themeColor)));
          }),
        );
      },
    );
  }
}
