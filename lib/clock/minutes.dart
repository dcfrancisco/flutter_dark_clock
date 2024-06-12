import 'dart:math';
import 'package:flutter/material.dart';

class MinutesPainter extends CustomPainter {
  final Paint minuteHandPaint;
  final int minutes;
  final double seconds;

  MinutesPainter({required this.minutes, required this.seconds})
      : minuteHandPaint = Paint() {
    minuteHandPaint.color = Colors.white;
    minuteHandPaint.style = PaintingStyle.stroke;
    minuteHandPaint.strokeWidth = 4.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);

    canvas.rotate(2 * pi * ((minutes + (seconds / 60)) / 60));

    Path path = Path();
    path.moveTo(0.0, -radius + radius / 10);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(path, minuteHandPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(MinutesPainter oldDelegate) {
    return minutes != oldDelegate.minutes || seconds != oldDelegate.seconds;
  }
}
