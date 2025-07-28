import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class CheckboxBottomSheet extends StatefulWidget {
  final List<String> checkBoxValues;
  final String? selectedValue;
  final ValueChanged<String?> onSelectionChanged;
  final String? question;
  final String? btnTxt;
  final String? heading;
  final String? headBtnTxt;
  final bool translate;

  const CheckboxBottomSheet({
    super.key,
    required this.checkBoxValues,
    required this.selectedValue,
    required this.onSelectionChanged,
    this.question,
    this.headBtnTxt,
    this.translate = false,
    required this.btnTxt,
    required this.heading,
  });

  @override
  State<CheckboxBottomSheet> createState() => _CheckboxBottomSheetState();
}

class _CheckboxBottomSheetState extends State<CheckboxBottomSheet> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Wrap(
        children: [
          Center(
            child: Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(shape: BoxShape.circle, color: whiteColor),
              margin: const EdgeInsets.only(bottom: 20),
              child: const Center(child: Icon(Icons.close)),
            ).onClick(() {
              Navigator.pop(context);
            }),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.heading.toString(),
                      style:  TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontFamily: LocaleKeys.hanken,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    if (widget.headBtnTxt != null)
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        decoration:  BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          widget.headBtnTxt.toString(),
                          style:  TextStyle(
                            color: textColor,
                            fontSize: 12,
                            fontFamily: LocaleKeys.hanken,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                  ],
                ),
                verticalSpace(10),
                line(height: 1, width: MediaQuery.of(context).size.width),
                if (widget.question != null) verticalSpace(10),
                if (widget.question != null)
                  Text(
                    widget.question.toString(),
                    style: TextStyle(color: blackColor, fontSize: 16, fontFamily: LocaleKeys.hanken, fontWeight: FontWeight.w700),
                  ),
                verticalSpace(10),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children:
                        widget.checkBoxValues.map((partner) {
                          return SquareRadioButton<String>(
                            title: Expanded(
                              child: Text(
                                widget.translate ? partner.tr : partner,
                                style: TextStyle(
                                  color: _selectedValue == partner ? themeColor : textColor,
                                  fontSize: 16,
                                  fontFamily: LocaleKeys.hanken,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            value: partner,
                            groupValue: _selectedValue ?? '',
                            activeColor: themeColor,
                            onChanged: (String? value) {
                              safeSetState(() {
                                _selectedValue = value!;
                              });
                            },
                          );
                        }).toList(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onSelectionChanged(_selectedValue);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(25))),
                    height: 44,
                    child: Center(
                      child: Text(
                        widget.btnTxt.toString(),
                        style: TextStyle(color: whiteColor, fontWeight: FontWeight.w700, fontFamily: LocaleKeys.hanken, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void safeSetState(VoidCallback callback) {
    if (mounted) {
      setState(callback);
    }
  }
}

class SquareRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Widget title;

  const SquareRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              color: isSelected ? activeColor : Colors.transparent,
              border: Border.all(color: isSelected ? activeColor : inactiveColor, width: 2.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: isSelected ? const Center(child: Icon(Icons.done, color: Colors.white, size: 16.0)) : null,
          ),
          const SizedBox(width: 8.0),
          title,
        ],
      ),
    );
  }
}
