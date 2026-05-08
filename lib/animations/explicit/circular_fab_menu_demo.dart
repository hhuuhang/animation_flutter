import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularFabMenuDemo extends StatefulWidget {
  const CircularFabMenuDemo({super.key});

  @override
  State<CircularFabMenuDemo> createState() => _CircularFabMenuDemoState();
}

class _CircularFabMenuDemoState extends State<CircularFabMenuDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildFabItem(0, Icons.camera_alt, Colors.blue),
            _buildFabItem(1, Icons.photo_library, Colors.green),
            _buildFabItem(2, Icons.videocam, Colors.orange),
            _buildMainFab(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainFab() {
    return FloatingActionButton(
      onPressed: _toggle,
      backgroundColor: Colors.indigo,
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _controller,
      ),
    );
  }

  Widget _buildFabItem(int index, IconData icon, Color color) {
    const int count = 3;
    final double angle = (math.pi / (count - 1)) * index;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double radius = 80.0 * _controller.value;
        final double x = radius * math.cos(angle + math.pi);
        final double y = radius * math.sin(angle + math.pi);

        return Transform(
          transform: Matrix4.translationValues(x, y, 0.0)..scale(_controller.value),
          alignment: Alignment.center,
          child: FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
        );
      },
    );
  }
}

const circularFabMenuCode = r'''
Widget _buildFabItem(int index, IconData icon, Color color) {
  final double angle = (math.pi / 2) * index;

  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      final double radius = 80.0 * _controller.value;
      final double x = radius * math.cos(angle + math.pi);
      final double y = radius * math.sin(angle + math.pi);

      return Transform(
        transform: Matrix4.translationValues(x, y, 0.0)..scale(_controller.value),
        child: FloatingActionButton(
          mini: true,
          onPressed: () {},
          child: Icon(icon),
        ),
      );
    },
  );
}
''';
