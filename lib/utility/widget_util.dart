import 'package:flutter/material.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';

Widget verticalSpace(double height) => SizedBox(height: height);

Widget horizontalSpace(double width) => SizedBox(width: width);

Widget line({double width = 0.0, double height = 1, Color color = dividerColor}) => Container(width: width, height: height, color: color);
