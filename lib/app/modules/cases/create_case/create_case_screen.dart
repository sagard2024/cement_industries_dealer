import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateCaseScreen extends StatefulWidget {
  const CreateCaseScreen({super.key});

  @override
  State<CreateCaseScreen> createState() => _CreateCaseScreenState();
}

class _CreateCaseScreenState extends State<CreateCaseScreen> {
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(TextEditingController dateController) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        final formatter = DateFormat('yyyy-MM-dd');
        final formatted = formatter.format(picked);
        dateController.text = formatted.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
          "Create Service Request",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer Name /  Dealer Name',
                    style: TextStyle(fontSize: 14),
                  ),
                  verticalSpace(8),
                  TextField(
                    decoration: InputDecoration(
                      //labelText: 'Customer Name /  Dealer Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Number / Email ID',
                    style: TextStyle(fontSize: 14),
                  ),
                  verticalSpace(8),
                  TextField(
                    decoration: InputDecoration(
                      //labelText: 'Contact Number / Email ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            // product name dropdown
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Name', style: TextStyle(fontSize: 14)),
                  verticalSpace(8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      //labelText: 'Product Name',
                      border: OutlineInputBorder(),
                    ),
                    items:
                        allProducts.map((product) {
                          return DropdownMenuItem<String>(
                            value: product['name'],
                            child: Text(product['name']),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value change
                    },
                  ),
                ],
              ),
            ),
            // case type dropdown list
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Case Type', style: TextStyle(fontSize: 14)),
                  verticalSpace(8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      //labelText: 'Case Type',
                      border: OutlineInputBorder(),
                    ),
                    items:
                        caseTypes.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value change
                    },
                  ),
                ],
              ),
            ),

            // datepicker
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date of Incident / Complaint Raised Date',
                    style: TextStyle(fontSize: 14),
                  ),
                  verticalSpace(8),
                  TextField(
                    decoration: InputDecoration(
                      //labelText: 'Date of Incident / Complaint Raised Date',
                      border: OutlineInputBorder(),
                    ),
                    onTap: () {
                      _selectDate(dateController);
                    },
                    controller: dateController,
                  ),
                ],
              ),
            ),

            ///
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Site Address / Delivery Location',
                    style: TextStyle(fontSize: 14),
                  ),
                  verticalSpace(8),
                  TextField(
                    decoration: InputDecoration(
                      // labelText: 'Site Address / Delivery Location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Invoice Number / Delivery Challan (DC) Number',
                    style: TextStyle(fontSize: 14),
                  ),
                  verticalSpace(8),
                  TextField(
                    decoration: InputDecoration(
                      // labelText: 'Invoice Number / Delivery Challan (DC) Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description of Issue', style: TextStyle(fontSize: 14)),
                  verticalSpace(8),
                  TextField(
                    decoration: InputDecoration(
                      //labelText: 'Description of Issue',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Photos / Document Upload (if any)',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
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
                              "Upload Photo",
                              style: TextStyle(
                                color: themeColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: LocaleKeys.hanken,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ).onClick(() {}),
                      ),
                      horizontalSpace(10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: themeColor),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Center(
                            child: Text(
                              "Upload Document",
                              style: TextStyle(
                                color: themeColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: LocaleKeys.hanken,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ).onClick(() {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: LocaleKeys.hanken,
                      fontSize: 16,
                    ),
                  ),
                ),
              ).onClick(() {
                // Handle submit button press
                Get.offNamed(Routes.CASE_LIST_SCREEN);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
