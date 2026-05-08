import 'package:flutter/material.dart';
import 'dart:math';

class GooeyBlobDemo extends StatefulWidget {
  const GooeyBlobDemo({super.key});

  @override
  State<GooeyBlobDemo> createState() => _GooeyBlobDemoState();
}

class _GooeyBlobDemoState extends State<GooeyBlobDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final radius1 = BorderRadius.only(
            topLeft: Radius.circular(100 + 50 * sin(_controller.value * 2 * pi)),
            topRight: Radius.circular(80 + 70 * cos(_controller.value * 2 * pi)),
            bottomLeft: Radius.circular(90 + 60 * cos(_controller.value * 2 * pi)),
            bottomRight: Radius.circular(110 + 40 * sin(_controller.value * 2 * pi)),
          );
          
          return Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: radius1,
              gradient: const LinearGradient(
                colors: [Color(0xFFFF5F6D), Color(0xFFFFC371)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF5F6D).withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ]
            ),
          );
        },
      ),
    );
  }
}

const gooeyBlobCode = r'''
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    final radius1 = BorderRadius.only(
      topLeft: Radius.circular(100 + 50 * sin(_controller.value * 2 * pi)),
      topRight: Radius.circular(80 + 70 * cos(_controller.value * 2 * pi)),
      bottomLeft: Radius.circular(90 + 60 * cos(_controller.value * 2 * pi)),
      bottomRight: Radius.circular(110 + 40 * sin(_controller.value * 2 * pi)),
    );
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius1,
        gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
      ),
    );
  },
)
''';
