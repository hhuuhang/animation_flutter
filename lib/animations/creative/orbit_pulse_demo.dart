import 'dart:math' as math;

import 'package:flutter/material.dart';

class OrbitPulseDemo extends StatefulWidget {
  const OrbitPulseDemo({super.key});

  @override
  State<OrbitPulseDemo> createState() => _OrbitPulseDemoState();
}

class _OrbitPulseDemoState extends State<OrbitPulseDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 6),
    vsync: this,
  )..repeat();

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
          return CustomPaint(
            painter: _OrbitPulsePainter(_controller.value),
            size: const Size(260, 260),
          );
        },
      ),
    );
  }
}

class _OrbitPulsePainter extends CustomPainter {
  final double progress;

  const _OrbitPulsePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final basePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (var i = 0; i < 3; i++) {
      final radius = 34 + (i * 28);
      basePaint.color = Colors.white.withOpacity(0.08 + i * 0.03);
      canvas.drawCircle(center, radius.toDouble(), basePaint);
    }

    final pulseRadius = 18 + 12 * math.sin(progress * math.pi * 2).abs();
    final pulsePaint = Paint()
      ..color = const Color(0xFF22D3EE).withOpacity(0.22)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, pulseRadius, pulsePaint);

    final corePaint = Paint()
      ..color = const Color(0xFF38BDF8)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 10, corePaint);

    final orbitPaint = Paint()..style = PaintingStyle.fill;
    const radii = [34.0, 62.0, 90.0];
    const colors = [Color(0xFFF472B6), Color(0xFFF59E0B), Color(0xFF34D399)];

    for (var i = 0; i < radii.length; i++) {
      final angle = progress * math.pi * 2 * (i + 1) + (i * 0.9);
      final orbitCenter = Offset(
        center.dx + math.cos(angle) * radii[i],
        center.dy + math.sin(angle) * radii[i],
      );
      orbitPaint.color = colors[i];
      canvas.drawCircle(orbitCenter, 7 + i.toDouble(), orbitPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitPulsePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

const orbitPulseCode = r'''
CustomPaint(
  painter: OrbitPulsePainter(_controller.value),
  size: const Size(260, 260),
)''';
