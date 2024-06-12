import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dark_clock/screens/clock_dialog.dart';
import 'package:flutter_dark_clock/screens/clock_face.dart';
import 'package:flutter_dark_clock/screens/clock_hands.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Stack(
        children: <Widget>[
          const Center(
            child: ClockFace(
              height: 320,
              width: 320,
            ),
          ),
          Center(
            child: CustomPaint(
              size: const Size(300, 300),
              painter: ClockDialog(),
            ),
          ),
          const Center(
            child: ClockHands(),
          )
        ],
      ),
    );
  }
}
