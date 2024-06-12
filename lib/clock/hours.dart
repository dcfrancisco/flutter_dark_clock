import 'dart:math';
import 'package:flutter/material.dart';

class HoursPainter extends CustomPainter {
  final Paint hourHandPaint;
  final int hours;
  final int minutes;

  HoursPainter({required this.hours, required this.minutes})
      : hourHandPaint = Paint() {
    hourHandPaint.color = Colors.white;
    hourHandPaint.style = PaintingStyle.stroke;
    hourHandPaint.strokeWidth = 5.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);

    canvas.rotate(hours >= 12
        ? 2 * pi * ((hours - 12) / 12 + (minutes / 720))
        : 2 * pi * ((hours / 12) + (minutes / 720)));

    Path path = Path();
    path.moveTo(0.0, -radius + radius / 4);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(path, hourHandPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(HoursPainter oldDelegate) {
    return minutes != oldDelegate.minutes;
  }
}
