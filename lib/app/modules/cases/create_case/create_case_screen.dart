import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCaseScreen extends StatefulWidget {
  const CreateCaseScreen({super.key});

  @override
  State<CreateCaseScreen> createState() => _CreateCaseScreenState();
}

class _CreateCaseScreenState extends State<CreateCaseScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _remarksController = TextEditingController();
  late final String _caseNumber;

  String? _caseType;
  String? _caseCategory;
  String? _subCategory;
  String? _priority;
  String? _status;
  String? _source;

  final List<String> _caseTypes = [
    "Service",
    "Complaint",
    "Inquiry",
    "Technical Support",
  ];
  final List<String> _categories = [
    "Product",
    "Delivery",
    "Quality",
    "Billing",
    "Scheme",
    "Others",
  ];
  final List<String> _priorities = ["High", "Medium", "Low"];
  final List<String> _statuses = ["New", "In Progress", "Resolved", "Closed"];
  final List<String> _sources = [
    "App",
    "Call",
    "WhatsApp",
    "Email",
    "Dealer Portal",
  ];

  final Map<String, List<String>> _subCategoryMap = {
    "Product": ["Availability", "Specification", "Packaging", "Replacement"],
    "Delivery": [
      "Delay in delivery",
      "Partial Delivery",
      "Wrong Address",
      "Tracking Issue",
    ],
    "Quality": [
      "Cracks in structure",
      "Material Quality",
      "Batch Mismatch",
      "Expiry Concern",
    ],
    "Billing": [
      "Invoice mismatch",
      "Wrong Amount",
      "Payment Not Updated",
      "Tax Query",
    ],
    "Scheme": [
      "Scheme eligibility",
      "Points Not Credited",
      "Offer Clarification",
      "Redemption Issue",
    ],
    "Others": ["General Query", "Feedback", "Escalation", "Other"],
  };

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    _caseNumber =
        (args is Map && args["caseNumber"] is String)
            ? args["caseNumber"] as String
            : "C-1006";
  }

  @override
  void dispose() {
    _remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
          "Add Support Case",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20),
          children: [
            verticalSpace(15),
            _label("Case Number (Auto)"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: TextFormField(
                initialValue: _caseNumber,
                readOnly: true,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: cardBackColor,
                ),
              ),
            ),
            _dropdownField(
              label: "Case Type",
              hint: "Select case type",
              value: _caseType,
              items: _caseTypes,
              onChanged: (v) => setState(() => _caseType = v),
            ),
            _dropdownField(
              label: "Case Category",
              hint: "Select case category",
              value: _caseCategory,
              items: _categories,
              onChanged:
                  (v) => setState(() {
                    _caseCategory = v;
                    _subCategory = null;
                  }),
            ),
            _dropdownField(
              label: "Sub-Category",
              hint:
                  _caseCategory == null
                      ? "Select category first"
                      : "Select sub-category",
              value: _subCategory,
              items:
                  _caseCategory == null
                      ? const []
                      : (_subCategoryMap[_caseCategory] ?? const []),
              onChanged: (v) => setState(() => _subCategory = v),
              validator: (value) {
                if (_caseCategory == null) {
                  return "Please select case category first";
                }
                if (value == null || value.isEmpty) {
                  return "Please select sub-category";
                }
                return null;
              },
            ),
            _dropdownField(
              label: "Priority",
              hint: "Select priority",
              value: _priority,
              items: _priorities,
              onChanged: (v) => setState(() => _priority = v),
            ),
            _dropdownField(
              label: "Status",
              hint: "Select status",
              value: _status,
              items: _statuses,
              onChanged: (v) => setState(() => _status = v),
            ),
            _dropdownField(
              label: "Source",
              hint: "Select source",
              value: _source,
              items: _sources,
              onChanged: (v) => setState(() => _source = v),
            ),
            _label("Remarks"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: TextFormField(
                controller: _remarksController,
                minLines: 3,
                maxLines: 5,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter remarks",
                  hintStyle: TextStyle(
                    color: textColor.withValues(alpha: 0.5),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                validator:
                    (value) =>
                        value == null || value.trim().isEmpty
                            ? "Please enter remarks"
                            : null,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: GestureDetector(
            onTap: _onSave,
            child: Container(
              decoration: BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Save",
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

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget _dropdownField({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(label),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: DropdownButtonFormField<String>(
            initialValue: value,
            isExpanded: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
              hintStyle: TextStyle(
                color: textColor.withValues(alpha: 0.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            validator:
                validator ??
                (selected) =>
                    selected == null || selected.isEmpty
                        ? "Please select $label"
                        : null,
            items:
                items
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  void _onSave() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    Get.back(
      result: {
        "caseNumber": _caseNumber,
        "caseType": _caseType ?? "",
        "caseCategory": _caseCategory ?? "",
        "subCategory": _subCategory ?? "",
        "priority": _priority ?? "",
        "status": _status ?? "",
        "source": _source ?? "",
        "remarks": _remarksController.text.trim(),
      },
    );
  }
}
