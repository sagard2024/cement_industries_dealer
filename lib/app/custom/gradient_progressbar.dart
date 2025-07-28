import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';

class GradientRoundedLinearProgressIndicator extends StatelessWidget {
  final double value;
  final List<Color> gradientColors;
  final Color unProgressColor;
  final String? indicatorText;
  final double width;

  const GradientRoundedLinearProgressIndicator({
    super.key,
    required this.value,
    required this.gradientColors,
    required this.unProgressColor,
    required this.width,
    this.indicatorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 9,
          width: Get.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.5), border: Border.all(color: themeColor)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.5),
            child: CustomPaint(painter: _GradientRoundedLinearProgressPainter(value, gradientColors, unProgressColor)),
          ),
        ),
      ],
    );
  }
}

class _GradientRoundedLinearProgressPainter extends CustomPainter {
  final double value;
  final List<Color> gradientColors;
  final Color unProgressColor;

  _GradientRoundedLinearProgressPainter(this.value, this.gradientColors, this.unProgressColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..shader = LinearGradient(colors: gradientColors).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
          ..style = PaintingStyle.fill;

    final backgroundPaint =
        Paint()
          ..color = unProgressColor
          ..style = PaintingStyle.fill;

    final borderRadius = BorderRadius.circular(4.5);

    // Draw the background
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width, size.height),
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
        bottomLeft: borderRadius.bottomLeft,
        bottomRight: borderRadius.bottomRight,
      ),
      backgroundPaint,
    );
    if (!value.isNaN) {
      // Draw the progress
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0, 0, size.width * value, size.height),
          topLeft: borderRadius.topLeft,
          topRight: borderRadius.topRight,
          bottomLeft: borderRadius.bottomLeft,
          bottomRight: borderRadius.bottomRight,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
