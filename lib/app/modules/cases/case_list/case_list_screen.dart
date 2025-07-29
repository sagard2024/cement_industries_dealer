import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:flutter/material.dart';

class CaseListScreen extends StatefulWidget {
  const CaseListScreen({super.key});

  @override
  State<CaseListScreen> createState() => _CaseListScreenState();
}

class _CaseListScreenState extends State<CaseListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
          "All Cases",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          final caseData = cases[index];
          return caseItem(caseData);
        },
      ),
    );
  }

  Widget caseItem(Map<String, dynamic> caseData) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        //border: Border.all(color: Colors.grey, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      caseData['name'] ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Contact: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    caseData['contact'] ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Product: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    caseData['product'] ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Case Type: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    caseData['casetype'] ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Date: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(caseData['date'] ?? '', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
          // Status badge in top right corner
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: getStatusColor(caseData['status'] ?? ''),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                (caseData['status'] ?? '').toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
