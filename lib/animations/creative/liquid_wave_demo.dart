import 'package:flutter/material.dart';
import 'dart:math' as math;

class LiquidWaveDemo extends StatefulWidget {
  const LiquidWaveDemo({super.key});

  @override
  State<LiquidWaveDemo> createState() => _LiquidWaveDemoState();
}

class _LiquidWaveDemoState extends State<LiquidWaveDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.cyan, width: 4),
          boxShadow: [
            BoxShadow(
                color: Colors.cyan.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 5),
          ],
        ),
        child: ClipOval(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: WavePainter(_controller.value),
                size: const Size(250, 250),
              );
            },
          ),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue;
  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Offset.zero & size);

    final path = Path();
    const amplitude = 15.0;
    final waveLength = size.width;
    final yOffset = size.height * 0.5;

    path.moveTo(0, size.height);
    for (double x = 0; x <= size.width; x++) {
      final y = amplitude *
          math.sin(
              (2 * math.pi * x / waveLength) + (animationValue * 2 * math.pi));
      path.lineTo(x, y + yOffset);
    }
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Second wave with offset
    final paint2 = Paint()..color = const Color(0xFF00B4DB).withOpacity(0.5);
    final path2 = Path();
    path2.moveTo(0, size.height);
    for (double x = 0; x <= size.width; x++) {
      final y = amplitude *
          math.sin((2 * math.pi * x / waveLength) +
              (animationValue * 2 * math.pi) +
              math.pi);
      path2.lineTo(x, y + yOffset + 10);
    }
    path2.lineTo(size.width, size.height);
    path2.close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;
}

const liquidWaveCode = r'''
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    const amplitude = 15.0;
    final yOffset = size.height * 0.5;

    path.moveTo(0, size.height);
    for (double x = 0; x <= size.width; x++) {
      final y = amplitude * math.sin(
        (2 * math.pi * x / size.width) + (animationValue * 2 * math.pi)
      );
      path.lineTo(x, y + yOffset);
    }
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }
}''';
