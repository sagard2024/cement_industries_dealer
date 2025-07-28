import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<StatefulWidget> createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  TextEditingController scanResult = TextEditingController();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: themeColor,
        iconTheme: IconThemeData(color: whiteColor),
        title: Text("Scanning", style: TextStyle(color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600)),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: ListView(
        children: [
          verticalSpace(15),
          Container(
            height: Get.width / 1.2,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: QRView(key: qrKey, onQRViewCreated: onQRViewCreated),
          ),
          verticalSpace(15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(border: Border.all(color: themeColor), borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(child: Text("00", style: TextStyle(color: whiteColor, fontSize: 22, fontWeight: FontWeight.w600))),
                ),
                Expanded(
                  child: TextField(
                    enabled: false,
                    controller: scanResult,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "IEC 6050-02",
                      hintStyle: TextStyle(color: blackColor.withValues(alpha: 0.4), fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(child: Icon(Icons.send, color: whiteColor)),
                ),
              ],
            ),
          ),
          verticalSpace(15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(child: Text("Stock Check in", style: TextStyle(color: whiteColor, fontWeight: FontWeight.w700, fontSize: 18))),
          ),
          verticalSpace(15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(child: Text("Stock Check out", style: TextStyle(color: whiteColor, fontWeight: FontWeight.w700, fontSize: 18))),
          ),
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      scanResult.text = scanData.code ?? "";
    });
  }
}
