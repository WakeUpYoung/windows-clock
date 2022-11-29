import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:windows_clock/windows_buttons.dart';
import 'package:windows_clock/clock.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    var initialSize = const Size(500, 300);
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.title = 'My Clock';
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Color _startColor = const Color(0xff5b99df);
  final Color _endColor = const Color(0xff73b0f9);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body:
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [_startColor, _endColor],
            )
          ),
          child: Column(
            children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(
                      child:
                      MoveWindow(),
                    ),
                    WindowsButtons(),
                  ],
                ),
              ),
              const Expanded(
                child: Clock(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
