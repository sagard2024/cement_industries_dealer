import 'package:flutter/material.dart';
import 'package:cement_industries_dealer/app/constant/app_version.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("My Profile", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        children: [
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    child: Image.asset(LocaleKeys.iv_dummy_profile, width: 120, height: 120, fit: BoxFit.cover),
                  ),
                  verticalSpace(15),
                  Text("Sukwinder Singh", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          verticalSpace(40),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: cardBackColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Dealer Id.",
                      style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '123164523123',
                      style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Code Id.",
                      style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'AV45AD654',
                      style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: cardBackColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'sukwinder@gmail.com',
                      style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Phone No",
                      style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '9875123465',
                      style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                verticalSpace(15),
                Text(
                  "Address",
                  style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                verticalSpace(5),
                Text("Studio Ardete", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600, height: 1)),
                verticalSpace(5),
                Text(
                  "SCO 43, Swastik Vihar Phase II, MDC Sector 5, Panchkula, Haryana",
                  style: TextStyle(color: textColor.withValues(alpha: 0.6), fontSize: 14, fontWeight: FontWeight.w600, height: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
