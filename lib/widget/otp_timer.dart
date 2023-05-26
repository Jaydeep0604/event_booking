import 'dart:async';
import 'package:flutter/material.dart';

class OtpTimer extends StatefulWidget {
  final Color colors;
  final Function onResendTimeUpCallBack;
  OtpTimer({required this.onResendTimeUpCallBack, this.colors = Colors.white});
  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 100;
  int currentSeconds = 0;
  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  late Timer timer;
  startTimeout([int? milliseconds]) {
    var duration = interval;
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
          widget.onResendTimeUpCallBack();
        }
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(
          width: 2,
        ),
        Text(timerText, style: Theme.of(context).textTheme.bodyText1)
      ],
    );
  }
}
