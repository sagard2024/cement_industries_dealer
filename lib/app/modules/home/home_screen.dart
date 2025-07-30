import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/custom/gradient_progressbar.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/app/widget/check_box_bottom_sheet.dart';
import 'package:cement_industries_dealer/app/widget/retailer_option_dialog.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController networkTabController;
  late TabController eventTabController;
  var netChangeType = -1;

  // var eveChangeType = 0;
  PageController networkPageController = PageController(initialPage: 0);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var selectIndex = -1;
  ValueKey<String> key1 = ValueKey('${DateTime.now().microsecond}');
  ValueKey<String> key2 = ValueKey('${DateTime.now().microsecond}');
  ValueKey<String> key3 = ValueKey('${DateTime.now().microsecond}');
  String selectedEvents = 'Upcoming';
  String selectedPeriod = 'MoM';
  String selectedProduct = 'All';
  List<String> productList = [
    'All',
    'UltraMax Cement',
    'Duracrete 500',
    'StrongMix Pro',
  ];
  List<String> saleFilters = ['MoM', 'YTD', 'QoQ'];
  List<String> eventFilters = ['Upcoming', 'Past'];

  @override
  void initState() {
    super.initState();
    networkTabController = TabController(length: 2, vsync: this);
    eventTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("Welcome Sukwinder", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
        leading: Icon(Icons.menu).onClick(() {
          scaffoldKey.currentState?.openDrawer();
        }),
        backgroundColor: backgroundColor,
        actions: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              shaderCallback:
                  (bounds) =>
                  LinearGradient(colors: [Colors.blue, Colors.purple]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                "Cement",
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteColor, fontSize: 20, fontWeight: FontWeight.w800, height: 1),
              ),
            ),
            Text(
              "Industries",
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600, height: 1),
            ),
          ],
        ),
          horizontalSpace(8),
          IconButton(onPressed: (){
            Get.toNamed(Routes.NOTIFICATIONS_SCREEN);
          }, icon: Icon(Icons.notifications, color: Colors.blueAccent,)),

          horizontalSpace(10)],
      ),
      drawer: Drawer(
        backgroundColor: cardBackColor,
        child: ListView(
          children: [
            verticalSpace(15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShaderMask(
                  shaderCallback:
                      (bounds) =>
                      LinearGradient(colors: [Colors.blue, Colors.purple]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: Text(
                    "Cement",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: whiteColor, fontSize: 36, fontWeight: FontWeight.w800, height: 1),
                  ),
                ),
                Text(
                  "Industries",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor, fontSize: 28, fontWeight: FontWeight.w600, height: 1),
                ),
              ],
            )]),
            verticalSpace(5),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("App version : 1.0.60", style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w500)),
              ),
            ),
            verticalSpace(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(Icons.home, size: 28),
                  horizontalSpace(15),
                  Text("Home", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ).onClick(() {
              Get.back();
            }),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(Icons.person, size: 28),
                  horizontalSpace(15),
                  Text("My Profile", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ).onClick(() {
              Get.back();
              Get.toNamed(Routes.PROFILE_SCREEN);
            }),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  SvgPicture.asset(LocaleKeys.ic_invoices, height: 26, width: 26, color: Colors.black),
                  horizontalSpace(15),
                  Text("Order Placement", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ).onClick(() {
              Get.back();
              Get.toNamed(Routes.ORDER_PLACEMENT);
            }),
            verticalSpace(20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(Icons.account_balance, size: 28),
                  horizontalSpace(15),
                  Text("Account Statement", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ).onClick(() {
              Get.back();
              Get.toNamed(Routes.ACCOUNT_STATEMENT_SCREEN);
            }),
            verticalSpace(20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(Icons.create, size: 28),
                  horizontalSpace(15),
                  Text("Service Request", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ).onClick(() {
              Get.back();
              Get.toNamed(Routes.CREATE_CASE_SCREEN);
            }),
            verticalSpace(20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(Icons.list, size: 28),
                  horizontalSpace(15),
                  Text("View Service Request", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ).onClick(() {
              Get.back();
              Get.toNamed(Routes.CASE_LIST_SCREEN);
            }),
            verticalSpace(20),


            Divider(),
            verticalSpace(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Other", style: TextStyle(color: textColor.withValues(alpha: 0.5), fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(Icons.share, size: 28),
                  horizontalSpace(15),
                  Text("Share App", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(Icons.info, size: 28),
                  horizontalSpace(15),
                  Text("Terms & Conditions", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(Icons.privacy_tip, size: 28),
                  horizontalSpace(15),
                  Text("Privacy Policy", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.asset(LocaleKeys.iv_cement_scheme, width: Get.width, fit: BoxFit.cover),
              /*Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                margin: EdgeInsets.only(bottom: 5, right: 5),
                decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Text("View Scheme", style: TextStyle(color: whiteColor, fontWeight: FontWeight.w500, fontSize: 12)),
              ).onClick(() => Get.toNamed(Routes.VIEW_SCHEME_SCREEN)),*/
            ],
          ),
          verticalSpace(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Orders", style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardBackColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    height: 110,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('55', style: TextStyle(color: textColor, fontSize: 34, fontWeight: FontWeight.w900)),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  "Order from Cement",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: themeColor, fontWeight: FontWeight.w600, fontSize: 12),
                                ),
                                horizontalSpace(4),
                                Icon(Icons.arrow_forward, color: themeColor, size: 20),
                              ],
                            ),
                          ],
                        ),
                        // Align(alignment: Alignment.topRight, child: SvgPicture.asset(LocaleKeys.ic_next_grey, width: 26, height: 26)),
                      ],
                    ),
                  ).onClick(() => Get.toNamed(Routes.ORDRE_KEI_LIST_SCREEN)),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardBackColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    height: 110,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('0', style: TextStyle(color: textColor, fontSize: 34, fontWeight: FontWeight.w900)),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  "Order from Retailers ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: themeColor, fontWeight: FontWeight.w600, fontSize: 12),
                                ),
                                horizontalSpace(4),
                                Icon(Icons.arrow_forward, color: themeColor, size: 20),
                              ],
                            ),
                          ],
                        ),
                        // Align(alignment: Alignment.topRight, child: SvgPicture.asset(LocaleKeys.ic_next_grey, width: 26, height: 26)),
                      ],
                    ),
                  ).onClick(() {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: false,
                      builder: (context) => const RetailerOptionDialog(),
                    );
                  }),
                ),
              ],
            ),
          ),
          verticalSpace(15),
          Container(
            decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(25))),
            padding: const EdgeInsets.symmetric(vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Text(
                "New Order",
                style: TextStyle(color: whiteColor, fontWeight: FontWeight.w600, fontFamily: LocaleKeys.hanken, fontSize: 16),
              ),
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Loyalty", style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          color: cardBackColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Earned Points",
                              style: TextStyle(
                                color: textColor.withValues(alpha: 0.5),
                                height: 1,
                                fontFamily: LocaleKeys.hanken,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            verticalSpace(15),
                            Text(
                              "27158",
                              style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    horizontalSpace(15),
                    Expanded(
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          color: cardBackColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Redeemed Points",
                              style: TextStyle(
                                color: textColor.withValues(alpha: 0.5),
                                height: 1,
                                fontFamily: LocaleKeys.hanken,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            verticalSpace(15),
                            Text(
                              "10265",
                              style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(15),
                Container(
                  decoration: BoxDecoration(
                    color: cardBackColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Available Points",
                                style: TextStyle(
                                  color: textColor.withValues(alpha: 0.5),
                                  height: 1,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              verticalSpace(10),
                              Text(
                                "16893",
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.orange.shade200, borderRadius: BorderRadius.all(Radius.circular(25))),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            child: Row(
                              children: [
                                Icon(Icons.wine_bar, color: Colors.orange.shade900, size: 20),
                                horizontalSpace(5),
                                Text(
                                  "GOLD",
                                  style: TextStyle(
                                    color: Colors.orange.shade900,
                                    fontFamily: LocaleKeys.hanken,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Bronze",
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "0 PTS",
                                style: TextStyle(
                                  color: textColor.withValues(alpha: 0.5),
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Silver",
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "5000 PTS",
                                style: TextStyle(
                                  color: textColor.withValues(alpha: 0.5),
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Gold",
                                    style: TextStyle(
                                      color: textColor,
                                      fontFamily: LocaleKeys.hanken,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "10000 PTS",
                                    style: TextStyle(
                                      color: textColor.withValues(alpha: 0.5),
                                      fontFamily: LocaleKeys.hanken,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Platinum",
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "20000 PTS",
                                style: TextStyle(
                                  color: textColor.withValues(alpha: 0.5),
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      verticalSpace(5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GradientRoundedLinearProgressIndicator(
                                value: 0.75,
                                gradientColors: [themeColor, themeColor],
                                indicatorText: '',
                                unProgressColor: whiteColor,
                                width: Get.width,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: themeColor,
                                    border: Border.all(color: whiteColor, width: 2),
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.check, color: whiteColor, size: 14),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: themeColor,
                                    border: Border.all(color: whiteColor, width: 2),
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.check, color: whiteColor, size: 14),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: themeColor,
                                    border: Border.all(color: whiteColor, width: 2),
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.check, color: whiteColor, size: 14),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    border: Border.all(color: themeColor, width: 2),
                                    shape: BoxShape.circle,
                                  ),
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.check, color: themeColor, size: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(25),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: themeColor),
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Center(
                                child: Text(
                                  "Account Statement",
                                  style: TextStyle(
                                    color: themeColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: LocaleKeys.hanken,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ).onClick(() => Get.toNamed(Routes.ACCOUNT_STATEMENT_SCREEN)),
                          ),
                          horizontalSpace(10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: themeColor,
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                border: Border.all(color: themeColor),
                              ),
                              child: Center(
                                child: Text(
                                  "Redeem",
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: LocaleKeys.hanken,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ).onClick(() => Get.toNamed(Routes.PRODUCT_LIST_SCREEN)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "1200",
                    style: TextStyle(color: Colors.red, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                  TextSpan(
                    text: ' points are expiring in next ',
                    style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w400, fontSize: 13),
                  ),
                  TextSpan(
                    text: "30 days",
                    style: TextStyle(color: Colors.red, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("My Financials", style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          color: cardBackColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Credit Limit",
                              style: TextStyle(
                                color: textColor.withValues(alpha: 0.5),
                                height: 1,
                                fontFamily: LocaleKeys.hanken,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            verticalSpace(15),
                            Text(
                              "₹10292002.5",
                              style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    horizontalSpace(15),
                    Expanded(
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          color: cardBackColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Available Limit",
                              style: TextStyle(
                                color: textColor.withValues(alpha: 0.5),
                                height: 1,
                                fontFamily: LocaleKeys.hanken,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            verticalSpace(15),
                            Text(
                              "₹8906733.57",
                              style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(15),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: cardBackColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Outstanding Amount",
                                  style: TextStyle(
                                    color: textColor.withValues(alpha: 0.5),
                                    height: 1,
                                    fontFamily: LocaleKeys.hanken,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                verticalSpace(15),
                                Text(
                                  "₹390581.93",
                                  style: TextStyle(
                                    color: textColor,
                                    fontFamily: LocaleKeys.hanken,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          horizontalSpace(20),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    border: Border.all(color: themeColor),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View Details",
                                      style: TextStyle(
                                        color: themeColor,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: LocaleKeys.hanken,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ).onClick(() => Get.toNamed(Routes.PAYMENT_SCREEN)),
                                verticalSpace(10),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: themeColor,
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    border: Border.all(color: themeColor),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Pay Now",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: LocaleKeys.hanken,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ).onClick(() => Get.toNamed(Routes.PAYMENT_SCREEN)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Quick Actions", style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: cardBackColor,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(LocaleKeys.ic_invoices, height: 32, width: 32),
                        const SizedBox(height: 5),
                        Text(
                          'Invoices',
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ],
                    ),
                  ).onClick(() => Get.toNamed(Routes.INVOICE_LIST_SCREEN)),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: cardBackColor,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(LocaleKeys.ic_receipt, height: 32, width: 32),
                        const SizedBox(height: 5),
                        Text(
                          'Receipts',
                          style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ],
                    ),
                  ).onClick(() => Get.toNamed(Routes.RECEIPT_LIST_SCREEN)),
                ),
              ],
            ),
          ),
          verticalSpace(30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("My Network", style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          verticalSpace(4),
          TabBar(
            controller: networkTabController,
            labelPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            tabs: [Tab(text: "Retailer"), Tab(text: "Contractor")],
            dividerColor: Colors.transparent,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.all(Radius.circular(1.25)),
              borderSide: BorderSide(width: 2.5, color: themeColor),
            ),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, color: blackColor, fontSize: 16),
            labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: themeColor),
            onTap: (index) {
              netChangeType = 0;
              networkPageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            },
          ),
          verticalSpace(12),
          SizedBox(
            height: 110,
            child: PageView(
              controller: networkPageController,
              onPageChanged: (index) {
                if (netChangeType == -1) {
                  networkTabController.animateTo(index);
                } else {
                  netChangeType = -1;
                }
              },
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: cardBackColor,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Retailers',
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              verticalSpace(10),
                              Text(
                                '1200',
                                style: TextStyle(
                                  color: themeColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: cardBackColor,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Sales',
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              verticalSpace(10),
                              Text(
                                '36000000',
                                style: TextStyle(
                                  color: themeColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: cardBackColor,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Contractors',
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              verticalSpace(10),
                              Text(
                                '1200',
                                style: TextStyle(
                                  color: themeColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: cardBackColor,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Sales',
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              verticalSpace(10),
                              Text(
                                '36000000',
                                style: TextStyle(
                                  color: themeColor,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Sale Metrics", style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: cardBackColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(12))),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "7855",
                                            style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700),
                                          ),
                                          TextSpan(
                                            text: " MT",
                                            style: TextStyle(
                                              color: textColor.withValues(alpha: 0.5),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpace(4),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Ever Highest",
                                            style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                          ),
                                          TextSpan(
                                            text: " Sale",
                                            style: TextStyle(
                                              color: textColor.withValues(alpha: 0.5),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace(10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(12))),
                              height: 80,
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "120",
                                            style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700),
                                          ),
                                          TextSpan(
                                            text: " MT",
                                            style: TextStyle(
                                              color: textColor.withValues(alpha: 0.5),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpace(4),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "MTD",
                                            style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                          ),
                                          TextSpan(
                                            text: " Sale",
                                            style: TextStyle(
                                              color: textColor.withValues(alpha: 0.5),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace(10),
                          Expanded(
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(12))),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "120",
                                            style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700),
                                          ),
                                          TextSpan(
                                            text: " MT",
                                            style: TextStyle(
                                              color: textColor.withValues(alpha: 0.5),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpace(4),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "YTD",
                                            style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w600),
                                          ),
                                          TextSpan(
                                            text: " Sale",
                                            style: TextStyle(
                                              color: textColor.withValues(alpha: 0.5),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(10),
                      Container(
                        decoration: BoxDecoration(color: cardBackColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(8))),
                              width: Get.width / 3.5,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectedPeriod, style: TextStyle(color: blackColor, fontWeight: FontWeight.w400, fontSize: 14)),
                                  SvgPicture.asset(LocaleKeys.ic_arrow_down),
                                ],
                              ),
                            ).onClick(() {
                              final checkBoxScreen = CheckboxBottomSheet(
                                heading: 'Filters',
                                checkBoxValues: saleFilters,
                                selectedValue: selectedPeriod,
                                btnTxt: "Apply",
                                onSelectionChanged: (value) {
                                  Get.back();
                                  if (selectedPeriod != value) {
                                    selectedPeriod = value ?? 'MoM';
                                    selectIndex = -1;
                                    key1 = ValueKey('${DateTime.now().microsecond}');
                                    key2 = ValueKey('${DateTime.now().microsecond}');
                                    key3 = ValueKey('${DateTime.now().microsecond}');
                                    safeSetState(() {});
                                  }
                                },
                              );
                              showBottomSheet(checkBoxScreen);
                            }),
                            horizontalSpace(10),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(8))),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        selectedProduct,
                                        style: TextStyle(color: blackColor, fontWeight: FontWeight.w400, fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    SvgPicture.asset(LocaleKeys.ic_arrow_down),
                                  ],
                                ),
                              ).onClick(() {
                                final checkBoxScreen = CheckboxBottomSheet(
                                  heading: 'Products',
                                  checkBoxValues: productList,
                                  selectedValue: selectedProduct,
                                  btnTxt: "Apply",
                                  onSelectionChanged: (value) {
                                    Get.back();
                                    if (selectedProduct != value) {
                                      selectedProduct = value ?? 'All';
                                      selectIndex = -1;
                                      key1 = ValueKey('${DateTime.now().microsecond}');
                                      key2 = ValueKey('${DateTime.now().microsecond}');
                                      key3 = ValueKey('${DateTime.now().microsecond}');
                                      safeSetState(() {});
                                    }
                                  },
                                );
                                showBottomSheet(checkBoxScreen);
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 240,
                  decoration: BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: cardBackColor, width: 1))),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SfCartesianChart(
                    legend: const Legend(isVisible: false),
                    tooltipBehavior: TooltipBehavior(enable: false),
                    margin: EdgeInsets.zero,
                    primaryXAxis: CategoryAxis(
                      borderColor: themeColor,
                      axisLine: AxisLine(width: 0),
                      labelStyle: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w400, fontSize: 11),
                      majorGridLines: MajorGridLines(width: 0),
                      majorTickLines: MajorTickLines(size: 0),
                      isVisible: true,
                      maximumLabels: 24,
                      labelAlignment: LabelAlignment.center,
                    ),
                    primaryYAxis: NumericAxis(
                      axisLine: AxisLine(width: 0),
                      borderColor: themeColor,
                      labelStyle: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w400, fontSize: 11),
                      majorGridLines: MajorGridLines(width: 1),
                      majorTickLines: MajorTickLines(size: 0),
                      minorGridLines: MinorGridLines(width: 0),
                      minorTickLines: MinorTickLines(size: 0),
                      isVisible: true,
                    ),
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                    enableSideBySideSeriesPlacement: false,
                    series: <StackedColumnSeries<SaleMetric, String>>[
                      if (selectedProduct == productList[0]) ...[
                        getYColumnSeries(getListProduct3(), product3Color, key3, false),
                        getYColumnSeries(getListProduct2(), product2Color, key2, false),
                        getYColumnSeries(getListProduct1(), product1Color, key1, true),
                      ] else if (selectedProduct == productList[1]) ...[
                        getYColumnSeries(getListProduct1(), product1Color, key1, true),
                      ] else if (selectedProduct == productList[2]) ...[
                        getYColumnSeries(getListProduct2(), product2Color, key2, true),
                      ] else if (selectedProduct == productList[3]) ...[
                        getYColumnSeries(getListProduct3(), product3Color, key3, true),
                      ],
                    ],
                    onMarkerRender: (MarkerRenderArgs args) {
                      if (args.pointIndex == selectIndex) {
                        args.shape = DataMarkerType.circle;
                        args.markerHeight = 10;
                        args.markerWidth = 10;
                        args.borderWidth = 2;
                        args.borderColor = themeColor;
                      } else {
                        args.shape = DataMarkerType.none;
                      }
                    },
                    annotations: <CartesianChartAnnotation>[
                      if (selectIndex != -1) ...[
                        CartesianChartAnnotation(
                          horizontalAlignment: getAlignment(),
                          verticalAlignment: ChartAlignment.center,
                          widget: Container(
                            height: selectedProduct == productList[0] ? 58 : 26,
                            margin: EdgeInsets.only(left: getLeftMargin(), right: getRightMargin()),
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(color: blackColor.withOpacity(0.1), offset: const Offset(1, 1), blurRadius: 10, spreadRadius: 2),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (selectedProduct == productList[0]) ...[
                                  getSelectedLabel(
                                    productList[1].split(" up to ")[0],
                                    '${(getListProduct1()[selectIndex].sales).toInt()} MT',
                                    product1Color,
                                  ),
                                  getSelectedLabel(
                                    productList[2].split(" up to ")[0],
                                    '${(getListProduct2()[selectIndex].sales).toInt()} MT',
                                    product2Color,
                                  ),
                                  getSelectedLabel(
                                    productList[3].split("-Copper")[0],
                                    '${(getListProduct3()[selectIndex].sales).toInt()} MT',
                                    product3Color,
                                  ),
                                ] else if (selectedProduct == productList[1]) ...[
                                  getSelectedLabel(
                                    productList[1].split(" up to ")[0],
                                    '${(getListProduct1()[selectIndex].sales).toInt()} MT',
                                    product1Color,
                                  ),
                                ] else if (selectedProduct == productList[2]) ...[
                                  getSelectedLabel(
                                    productList[2].split(" up to ")[0],
                                    '${(getListProduct2()[selectIndex].sales).toInt()} MT',
                                    product2Color,
                                  ),
                                ] else if (selectedProduct == productList[3]) ...[
                                  getSelectedLabel(
                                    productList[3].split("-Copper")[0],
                                    '${(getListProduct3()[selectIndex].sales).toInt()} MT',
                                    product3Color,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          coordinateUnit: CoordinateUnit.point,
                          x: getListProduct1()[selectIndex].year,
                          y: getYAxisHeight(),
                          region: AnnotationRegion.chart,
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: cardBackColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (selectedProduct == productList[0]) ...[
                            getSelectedLabel(productList[1].split(" up to ")[0], '', product1Color),
                            horizontalSpace(8),
                            getSelectedLabel(productList[2].split(" up to ")[0], '', product2Color),
                            horizontalSpace(8),
                            getSelectedLabel(productList[3].split("-Copper")[0], '', product3Color),
                          ] else if (selectedProduct == productList[1]) ...[
                            getSelectedLabel(productList[1].split(" up to ")[0], '', product1Color),
                          ] else if (selectedProduct == productList[2]) ...[
                            getSelectedLabel(productList[2].split(" up to ")[0], '', product2Color),
                          ] else if (selectedProduct == productList[3]) ...[
                            getSelectedLabel(productList[3].split("-Copper")[0], '', product3Color),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Events", style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700)),
                Container(
                  decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectedEvents, style: TextStyle(color: whiteColor, fontWeight: FontWeight.w500, fontSize: 15)),
                      SvgPicture.asset(LocaleKeys.ic_arrow_down, color: whiteColor),
                    ],
                  ),
                ).onClick(() {
                  final checkBoxScreen = CheckboxBottomSheet(
                    heading: 'Events Filter',
                    checkBoxValues: eventFilters,
                    selectedValue: selectedEvents,
                    btnTxt: "Apply",
                    onSelectionChanged: (value) {
                      Get.back();
                      if (selectedEvents != value) {
                        selectedEvents = value ?? 'Upcoming';
                        safeSetState(() {});
                      }
                    },
                  );
                  showBottomSheet(checkBoxScreen);
                }),
              ],
            ),
          ),
          verticalSpace(12),
          /*TabBar(
            controller: eventTabController,
            labelPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            tabs: [Tab(text: "Upcoming"), Tab(text: "Past")],
            dividerColor: Colors.transparent,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.all(Radius.circular(1.25)),
              borderSide: BorderSide(width: 2.5, color: themeColor),
            ),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, color: blackColor, fontSize: 16),
            labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: themeColor),
            onTap: (index) {
              eveChangeType = index;
              safeSetState(() {});
            },
          ),
          verticalSpace(12),*/
          if (selectedEvents == "Upcoming") ...[
            ...upcomingEvent.map(
              (e) => Container(
                decoration: BoxDecoration(
                  color: cardBackColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
                ),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: cardBackColor, borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                e["eventId"],
                                style: TextStyle(
                                  color: textColor.withValues(alpha: 0.5),
                                  fontFamily: LocaleKeys.hanken,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                e["eventDate"],
                                style: TextStyle(
                                  color: textColor.withValues(alpha: 0.5),
                                  fontFamily: LocaleKeys.hanken,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(10),
                          Text(
                            e["eventName"],
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700, fontSize: 16),
                          ),

                          Text(
                            e["eventDesc"],
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Text(
                            e["eventAddress"],
                            style: TextStyle(
                              color: textColor.withValues(alpha: 0.5),
                              fontFamily: LocaleKeys.hanken,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          if (e["eventStatus"] == 1) ...[
                            verticalSpace(15),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(LocaleKeys.ic_associate_event, color: whiteColor),
                                    horizontalSpace(4),
                                    Text(
                                      "You are associated with this event",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        fontFamily: LocaleKeys.hanken,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpace(15),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: themeColor),
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Center(
                                child: Text(
                                  "View List of Invites",
                                  style: TextStyle(
                                    color: themeColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    fontFamily: LocaleKeys.hanken,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          if (e["eventStatus"] == 0) ...[
                            verticalSpace(15),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "You declined this event",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        fontFamily: LocaleKeys.hanken,
                                      ),
                                    ),
                                    horizontalSpace(4),
                                    SvgPicture.asset(LocaleKeys.ic_event_decline),
                                  ],
                                ),
                              ),
                            ).onClick(() {}),
                          ],
                          if (e["eventStatus"] == -1) ...[
                            verticalSpace(15),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(25))),
                                    child: Center(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Accept",
                                            style: TextStyle(
                                              color: whiteColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              fontFamily: LocaleKeys.hanken,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).onClick(() {}),
                                ),
                                horizontalSpace(15),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(25))),
                                    child: Center(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Reject",
                                            style: TextStyle(
                                              color: whiteColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              fontFamily: LocaleKeys.hanken,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).onClick(() {}),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (selectedEvents == "Past") ...[
            ...pastEvent.map(
              (e) => Container(
                decoration: BoxDecoration(
                  color: cardBackColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0)],
                ),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: cardBackColor, borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                e["eventId"],
                                style: TextStyle(
                                  color: textColor.withValues(alpha: 0.5),
                                  fontFamily: LocaleKeys.hanken,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                e["eventDate"],
                                style: TextStyle(
                                  color: textColor.withValues(alpha: 0.5),
                                  fontFamily: LocaleKeys.hanken,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(10),
                          Text(
                            e["eventName"],
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700, fontSize: 16),
                          ),

                          Text(
                            e["eventDesc"],
                            style: TextStyle(color: textColor, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Text(
                            e["eventAddress"],
                            style: TextStyle(
                              color: textColor.withValues(alpha: 0.5),
                              fontFamily: LocaleKeys.hanken,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          if (e["eventStatus"] == 1) ...[
                            verticalSpace(15),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(LocaleKeys.ic_associate_event, color: whiteColor),
                                    horizontalSpace(4),
                                    Text(
                                      "You are associated with this event",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        fontFamily: LocaleKeys.hanken,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpace(15),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: themeColor),
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Center(
                                child: Text(
                                  "View List of Invites",
                                  style: TextStyle(
                                    color: themeColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    fontFamily: LocaleKeys.hanken,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          if (e["eventStatus"] == 0) ...[
                            verticalSpace(15),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "You declined this event",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        fontFamily: LocaleKeys.hanken,
                                      ),
                                    ),
                                    horizontalSpace(4),
                                    SvgPicture.asset(LocaleKeys.ic_event_decline),
                                  ],
                                ),
                              ),
                            ).onClick(() {}),
                          ],
                          if (e["eventStatus"] == -1) ...[
                            verticalSpace(15),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "You did not responded to this event",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        fontFamily: LocaleKeys.hanken,
                                      ),
                                    ),
                                    horizontalSpace(4),
                                    SvgPicture.asset(LocaleKeys.ic_event_decline),
                                  ],
                                ),
                              ),
                            ).onClick(() {}),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          verticalSpace(30),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.qr_code_scanner, color: whiteColor),
                  horizontalSpace(10),
                  Text(
                    "Stock Scan",
                    style: TextStyle(color: whiteColor, fontWeight: FontWeight.w700, fontFamily: LocaleKeys.hanken, fontSize: 18),
                  ),
                ],
              ),
            ),
          ).onClick(() {
            Get.toNamed(Routes.SCAN_SCREEN);
          }),
        ],
      ),
    );
  }

  ChartAlignment getAlignment() {
    return selectIndex < getListProduct1().length / 2 ? ChartAlignment.near : ChartAlignment.far;
  }

  double getLeftMargin() {
    return selectIndex < getListProduct1().length / 2 ? 10 : 0;
  }

  double getRightMargin() {
    return selectIndex < getListProduct1().length / 2 ? 0 : 10;
  }

  String? getFormatedStringFromAPI(String? date, {String? format, String? apiFormat}) {
    if (date == null) {
      return null;
    }
    DateFormat apiDateFormat = DateFormat(apiFormat ?? 'yyyy-MM-dd');
    DateFormat displayDateFormat = DateFormat(format ?? 'dd MMM yyyy');
    final DateTime? parsed = apiDateFormat.tryParse(date);
    if (parsed != null) {
      return displayDateFormat.format(parsed);
    }
    return null;
  }

  void safeSetState(VoidCallback callback) {
    if (mounted) {
      setState(callback);
    }
  }

  void showBottomSheet(CheckboxBottomSheet bottomCheckBox) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return bottomCheckBox;
      },
    );
  }

  List<SaleMetric> getListProduct1() {
    return selectedPeriod == "MoM"
        ? product1MoM
        : selectedPeriod == "YTD"
        ? product1YTD
        : product1QoQ;
  }

  List<SaleMetric> getListProduct2() {
    return selectedPeriod == "MoM"
        ? product2MoM
        : selectedPeriod == "YTD"
        ? product2YTD
        : product2QoQ;
  }

  List<SaleMetric> getListProduct3() {
    return selectedPeriod == "MoM"
        ? product3MoM
        : selectedPeriod == "YTD"
        ? product3YTD
        : product3QoQ;
  }

  StackedColumnSeries<SaleMetric, String> getYColumnSeries(
    List<SaleMetric> listProduct,
    Color productColor,
    ValueKey<String> key,
    bool isRadius,
  ) {
    return StackedColumnSeries<SaleMetric, String>(
      dataSource: listProduct,
      key: key,
      animationDelay: 0,
      animationDuration: 0,
      xValueMapper: (SaleMetric sales, _) => sales.year,
      yValueMapper: (SaleMetric sales, _) => sales.sales,
      name: '',
      color: productColor,
      borderWidth: 16,
      spacing: 0.5,
      width: 0.4,
      dataLabelSettings: const DataLabelSettings(isVisible: false),
      markerSettings: MarkerSettings(isVisible: isRadius),
      borderRadius: isRadius ? BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)) : BorderRadius.zero,
      onPointTap: (ChartPointDetails pointInteractionDetails) {
        if (selectIndex != (pointInteractionDetails.pointIndex ?? 0)) {
          selectIndex = pointInteractionDetails.pointIndex ?? 0;
          safeSetState(() {});
        }
      },
    );
  }

  num getYAxisHeight() {
    if (selectedProduct == productList[0]) {
      return getListProduct1()[selectIndex].sales + getListProduct2()[selectIndex].sales + getListProduct3()[selectIndex].sales;
    } else if (selectedProduct == productList[1]) {
      return getListProduct1()[selectIndex].sales;
    } else if (selectedProduct == productList[2]) {
      return getListProduct2()[selectIndex].sales;
    } else {
      return getListProduct3()[selectIndex].sales;
    }
  }

  Widget getSelectedLabel(String name, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 10, width: 10, decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(2)))),
        const SizedBox(width: 5),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$name ",
                style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: LocaleKeys.hanken),
              ),
              TextSpan(
                text: value,
                style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w700, fontFamily: LocaleKeys.hanken),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SaleMetric {
  SaleMetric(this.year, this.sales);

  final String year;
  final num sales;
}
