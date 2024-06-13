import 'dart:math';
import 'package:flutter/material.dart';

class SecondsPainter extends CustomPainter {
  final Paint secondHandPaint;
  final double seconds;

  SecondsPainter({required this.seconds}) : secondHandPaint = Paint() {
    secondHandPaint.color = Colors.red;
    secondHandPaint.style = PaintingStyle.stroke;
    secondHandPaint.strokeWidth = 3.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);

    canvas.rotate(2 * pi * seconds / 60);

    Path path = Path();
    path.moveTo(0.0, -radius);
    path.lineTo(0.0, radius / 4);
    canvas.drawPath(path, secondHandPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(SecondsPainter oldDelegate) {
    return seconds != oldDelegate.seconds;
  }
}
