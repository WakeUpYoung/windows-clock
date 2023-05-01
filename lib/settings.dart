import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1 * math.pi / 5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
          _controller.forward();
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
          _controller.reverse();
        });
      },
      cursor: SystemMouseCursors.click,
      child:
        GestureDetector(
          onTap: () {
            _saveWindowPosition();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: _isHovering ? const Color(0xff388ce4) : Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child:
            Center(
              child: RotationTransition(
                turns: _rotationAnimation,
                child: Icon(
                  Icons.settings,
                  size: 15,
                  color: _isHovering ? const Color(0xff86b4e4) : null,
                ),
              ),
            ),

          ),
        ),

    );
  }

  void _saveWindowPosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var currentOffset = appWindow.position;
    await prefs.setDouble('window_x', currentOffset.dx);
    await prefs.setDouble('window_y', currentOffset.dy);
    debugPrint('saved x: ${currentOffset.dx}, y: ${currentOffset.dy}');
  }

}
