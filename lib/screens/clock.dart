import 'package:clock/screens/clock_dialog.dart';
import 'package:clock/screens/clock_face.dart';
import 'package:clock/screens/clock_hands.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Stack(
        children: <Widget>[
          Center(
            child: ClockFace(
              height: 320,
              width: 320,
            ),
          ),
          Center(
            child: Container(
              child: CustomPaint(
                size: Size(300, 300),
                painter: ClockDialog(),
              ),
            ),
          ),
          Center(
            child: ClockHands(),
          )
        ],
      ),
    );
  }
}
