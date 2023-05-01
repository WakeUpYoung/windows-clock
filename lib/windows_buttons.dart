import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:windows_clock/settings.dart';

class WindowsButtons extends StatelessWidget {
  WindowsButtons({super.key});

  final WindowButtonColors buttonColor = WindowButtonColors(
    iconNormal: const Color(0xff04376d),
    mouseOver: const Color(0xff388ce4),
    mouseDown: const Color(0xff388ce4),
    iconMouseOver: const Color(0xff86b4e4),
    iconMouseDown: const Color(0xff86b4e4),
  );

  final WindowButtonColors closeButtonColor = WindowButtonColors(
    iconNormal: const Color(0xff04376d),
    mouseOver: const Color(0xffe64d6c),
    mouseDown: const Color(0xffe64d6c),
    iconMouseOver: const Color(0xff65222f),
    iconMouseDown: const Color(0xff65222f),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Settings(),
        MinimizeWindowButton(colors: buttonColor,),
        MaximizeWindowButton(colors: buttonColor,),
        CloseWindowButton(colors: closeButtonColor,),
      ],
    );
  }
}