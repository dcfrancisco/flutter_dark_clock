
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dark_clock/clock/hours.dart';
import 'package:flutter_dark_clock/clock/minutes.dart';
import 'package:flutter_dark_clock/clock/seconds.dart';

class ClockHands extends StatefulWidget {
  const ClockHands({super.key});

  @override
  _ClockHandsState createState() => _ClockHandsState();
}

class _ClockHandsState extends State<ClockHands>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration elapsed) {
    setState(() {
      dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomPaint(
          size: const Size(250, 250),
          painter: SecondsPainter(
              seconds: (dateTime.second + dateTime.millisecond / 1000).toInt()),
        ),
        CustomPaint(
          size: const Size(250, 250),
          painter: MinutesPainter(
              minutes: dateTime.minute, seconds: dateTime.second.toDouble()),
        ),
        CustomPaint(
          size: const Size(250, 250),
          painter: HoursPainter(hours: dateTime.hour, minutes: dateTime.minute),
        )
      ],
    );
  }
}
