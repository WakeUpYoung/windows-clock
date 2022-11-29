import 'dart:async';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  late String _nowDateTime;
  late Timer _period;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
      return Center(
        child:
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Text(_nowDateTime,
              style: const TextStyle(color: Colors.white, fontSize: 50),),
          ),

      );
  }

  startTimer() {
    var now = DateTime.now();
    _nowDateTime = _formatDate(now);
    _period = Timer.periodic(
        const Duration(seconds: 1), (timer) {
        now = DateTime.now();
        setState(() {
          _nowDateTime = _formatDate(now);
        });
      });
  }

  String _formatDate(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')} : '
        '${time.minute.toString().padLeft(2, '0')} : '
        '${time.second.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _period.cancel();
    super.dispose();
  }
}