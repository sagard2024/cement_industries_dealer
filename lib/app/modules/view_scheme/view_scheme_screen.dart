import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewSchemeScreen extends StatefulWidget {
  const ViewSchemeScreen({super.key});

  @override
  State<StatefulWidget> createState() => ViewSchemeScreenState();
}

class ViewSchemeScreenState extends State<ViewSchemeScreen> {
  var selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("View Scheme", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: pageController,
            children: [getScheme1Widget(), getScheme1Widget(), getScheme1Widget()],
            onPageChanged: (value) {
              selectedPage = value;
              setState(() {});
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: themeColor, width: 1.5),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 10, spreadRadius: 2)],
                ),
                height: 40,
                child: Row(
                  children: [
                    SizedBox(width: 40, height: 40, child: Center(child: Icon(Icons.keyboard_arrow_left))).onClick(() {
                      if (selectedPage > 0) {
                        selectedPage = selectedPage - 1;
                      }
                      pageController.animateToPage(selectedPage,duration: Duration(seconds: 1),curve: Curves.linear);
                    }),
                    VerticalDivider(thickness: 1.5, color: themeColor),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: Text("${selectedPage + 1}", style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    VerticalDivider(thickness: 1.5, color: themeColor),
                    SizedBox(width: 40, height: 40, child: Center(child: Icon(Icons.keyboard_arrow_right))).onClick(() {
                      if (selectedPage < 2) {
                        selectedPage = selectedPage + 1;
                      }
                      pageController.animateToPage(selectedPage,duration: Duration(seconds: 1),curve: Curves.linear);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getScheme1Widget() {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), border: Border.all(color: themeColor)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Scheme Overview: ',
                        style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text:
                            "'Jodey Dilon ke Taar' is a reward scheme by KEI that offers the Electrician a chance to accumulate and redeem points against purchase of each coil of 90mtr House Wire.",
                        style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Terms & Conditions: ',
                  style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                ),
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '1.',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text: '   ',
                        style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.w600, decorationColor: textColor),
                      ),
                      TextSpan(
                        text: 'Scheme Launch Date: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(text: "April, 2018", style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '2.',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text: '   ',
                        style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.w600, decorationColor: textColor),
                      ),
                      TextSpan(
                        text: 'Scheme validity: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text: "Until 31st March 2019.",
                        style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '3.',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text: '   ',
                        style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.w600, decorationColor: textColor),
                      ),
                      TextSpan(
                        text: 'Eligibility: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(text: "All Electricians.", style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '4.',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text: '   ',
                        style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.w600, decorationColor: textColor),
                      ),
                      TextSpan(
                        text: 'Product Applicability: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text: "90-meter House Wires.",
                        style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '5.',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text: '   ',
                        style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.w600, decorationColor: textColor),
                      ),
                      TextSpan(
                        text: 'Registration & Participation: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text: "Electricians can register themselves for this Scheme through any one of the following modes:",
                        style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(LocaleKeys.iv_sms_based, height: 100),
                          verticalSpace(10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(border: Border.all(color: themeColor)),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'SMS unique code to ',
                                    style: TextStyle(
                                      color: textColor,
                                      height: 1.5,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      decorationColor: textColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "7290077779",
                                    style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w600),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () async {
                                            final Uri launchUri = Uri(scheme: 'sms', path: "7290077779");
                                            if (await canLaunchUrl(launchUri)) {
                                              await launchUrl(launchUri);
                                            }
                                          },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(LocaleKeys.iv_app_based, height: 100),
                          verticalSpace(10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(border: Border.all(color: themeColor)),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Download KEI Jodey Dilon Ke Taar App ",
                                    style: TextStyle(
                                      height: 1.5,
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      decorationColor: textColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'from Google Play Store',
                                    style: TextStyle(
                                      color: textColor,
                                      height: 1.5,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      decorationColor: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(LocaleKeys.iv_web_based, height: 100),
                          verticalSpace(10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(border: Border.all(color: themeColor)),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Logon to ',
                                    style: TextStyle(
                                      color: textColor,
                                      height: 1.5,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      decorationColor: textColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "www.kei.social",
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () async {
                                            final url = Uri.parse('https://www.kei-ind.com/');
                                            if (await canLaunchUrl(url)) {
                                              await launchUrl(url, mode: LaunchMode.externalApplication);
                                            }
                                          },
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
              verticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'SMS Process: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text:
                            "The Electrician should 'scratch' the label pasted on the 90m box and send Unique Code through SMS from his registered mobile phone number to 7290077779. On new registration: You will receive a call back asking information for registering. Please share all details as desired. For multiple codes. separate by (,) while sending SMS.",
                        style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'App based Process: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Download the app: KEI Jodey Dilon Ke Taar from Google Play Store. Select Country as India and enter mobile number. You will receive One Time Password (OTP) on your mobile. Enter the OTP. Enter the Secure label code and submit. For multiple codes, separate by (,).",
                        style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Web based process: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(text: "Logon on to ", style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400)),
                      TextSpan(
                        text: "www.kei.social",
                        style: TextStyle(
                          color: Colors.blue.shade900, // Different color for link
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline, // Optional: underline
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () async {
                                final url = Uri.parse('https://www.kei-ind.com/');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url, mode: LaunchMode.externalApplication);
                                }
                              },
                      ),
                      TextSpan(
                        text: " then follow the same process as app based.",
                        style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Helpdesk: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text: "For any queries call at ",
                        style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: "8291373688",
                        style: TextStyle(
                          color: Colors.blue.shade900, // Different color for link
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline, // Optional: underline
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () async {
                                final Uri launchUri = Uri(scheme: 'tel', path: "8291373688");

                                if (await canLaunchUrl(launchUri)) {
                                  await launchUrl(launchUri);
                                }
                              },
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '6.',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text: '   ',
                        style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.w600, decorationColor: textColor),
                      ),
                      TextSpan(
                        text: 'Bonus Points on registration: ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: textColor,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Registered Electricians will be entitled to 25 bonus points on successful registration. Please give complete information to avoid further queries and become entitled to 25 bonus points.",
                        style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(70),
      ],
    );
  }
}
