import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseListScreen extends StatefulWidget {
  const CaseListScreen({super.key});

  @override
  State<CaseListScreen> createState() => _CaseListScreenState();
}

class _CaseListScreenState extends State<CaseListScreen> {
  final List<Map<String, String>> _cases = [
    {
      "caseNumber": "C-1001",
      "caseType": "Complaint",
      "caseCategory": "Quality",
      "subCategory": "Cracks in structure",
      "priority": "High",
      "status": "In Progress",
      "source": "App",
      "remarks": "Customer reported cracks in slab",
    },
    {
      "caseNumber": "C-1002",
      "caseType": "Service",
      "caseCategory": "Delivery",
      "subCategory": "Delay in delivery",
      "priority": "Medium",
      "status": "New",
      "source": "Dealer Portal",
      "remarks": "Material not delivered on time",
    },
    {
      "caseNumber": "C-1003",
      "caseType": "Inquiry",
      "caseCategory": "Product",
      "subCategory": "Cement type info",
      "priority": "Low",
      "status": "Resolved",
      "source": "Call",
      "remarks": "Asked about PPC vs OPC usage",
    },
    {
      "caseNumber": "C-1004",
      "caseType": "Complaint",
      "caseCategory": "Billing",
      "subCategory": "Invoice mismatch",
      "priority": "High",
      "status": "In Progress",
      "source": "Email",
      "remarks": "Amount differs from invoice shared",
    },
    {
      "caseNumber": "C-1005",
      "caseType": "Technical Support",
      "caseCategory": "Scheme",
      "subCategory": "Scheme eligibility",
      "priority": "Medium",
      "status": "Closed",
      "source": "WhatsApp",
      "remarks": "Clarified scheme benefits to dealer",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
          "Support Cases",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body:
          _cases.isEmpty
              ? Center(
                child: Text(
                  "No support cases added yet.",
                  style: TextStyle(
                    color: textColor.withValues(alpha: 0.7),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
              : ListView.separated(
                itemCount: _cases.length,
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 24),
                separatorBuilder: (_, __) => verticalSpace(10),
                itemBuilder: (context, index) => _caseItem(_cases[index]),
              ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: GestureDetector(
            onTap: _openAddCaseForm,
            child: Container(
              decoration: BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: whiteColor),
                  horizontalSpace(8),
                  Text(
                    "Add Case",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _caseItem(Map<String, String> caseData) {
    final priority = caseData["priority"] ?? "-";
    final status = caseData["status"] ?? "-";
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: themeColor.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: blackColor.withValues(alpha: 0.06),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: cardBackColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  caseData["caseNumber"] ?? "-",
                  style: TextStyle(
                    color: themeColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              _tag(text: priority, color: _priorityColor(priority)),
              horizontalSpace(8),
              _tag(text: status, color: _statusColor(status)),
            ],
          ),
          verticalSpace(12),
          _valueRow("Type", caseData["caseType"] ?? "-"),
          _valueRow("Category", caseData["caseCategory"] ?? "-"),
          _valueRow("Sub-Category", caseData["subCategory"] ?? "-"),
          _valueRow("Source", caseData["source"] ?? "-"),
          verticalSpace(8),
          Text(
            "Remarks",
            style: TextStyle(
              color: textColor.withValues(alpha: 0.7),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          verticalSpace(4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: cardBackColor.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              caseData["remarks"] ?? "-",
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _valueRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title  ",
              style: TextStyle(
                color: textColor.withValues(alpha: 0.7),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tag({required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Color _priorityColor(String priority) {
    if (priority == "High") return Colors.red.shade700;
    if (priority == "Medium") return Colors.orange.shade700;
    return Colors.green.shade700;
  }

  Color _statusColor(String status) {
    if (status == "New") return Colors.blue.shade700;
    if (status == "In Progress") return Colors.deepPurple.shade600;
    if (status == "Resolved") return Colors.teal.shade700;
    return Colors.grey.shade700;
  }

  Future<void> _openAddCaseForm() async {
    final result = await Get.toNamed(
      Routes.CREATE_CASE_SCREEN,
      arguments: {"caseNumber": _generateCaseNumber()},
    );
    if (result is Map<String, String>) {
      _cases.insert(0, result);
      setState(() {});
    }
  }

  String _generateCaseNumber() {
    final numbers =
        _cases
            .map(
              (e) =>
                  int.tryParse(
                    (e["caseNumber"] ?? "").replaceAll(RegExp(r"[^0-9]"), ""),
                  ) ??
                  0,
            )
            .toList();
    final next =
        (numbers.isEmpty ? 0 : numbers.reduce((a, b) => a > b ? a : b)) + 1;
    return "C-${next.toString()}";
  }
}
