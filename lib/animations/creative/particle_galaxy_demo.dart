import 'package:flutter/material.dart';
import 'dart:math' as math;

class ParticleGalaxyDemo extends StatefulWidget {
  const ParticleGalaxyDemo({super.key});

  @override
  State<ParticleGalaxyDemo> createState() => _ParticleGalaxyDemoState();
}

class _ParticleGalaxyDemoState extends State<ParticleGalaxyDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = List.generate(50, (index) => Particle());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          for (var p in _particles) {
            p.update();
          }
          return CustomPaint(
            painter: GalaxyPainter(_particles),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class Particle {
  double x = math.Random().nextDouble() * 300;
  double y = math.Random().nextDouble() * 300;
  double vx = (math.Random().nextDouble() - 0.5) * 2;
  double vy = (math.Random().nextDouble() - 0.5) * 2;
  double size = math.Random().nextDouble() * 4 + 1;
  Color color = Colors.primaries[math.Random().nextInt(Colors.primaries.length)].withOpacity(0.6);

  void update() {
    x += vx;
    y += vy;
    if (x < 0 || x > 300) vx *= -1;
    if (y < 0 || y > 300) vy *= -1;
  }
}

class GalaxyPainter extends CustomPainter {
  final List<Particle> particles;
  GalaxyPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
    
    for (var p in particles) {
      paint.color = p.color;
      canvas.drawCircle(Offset(p.x, p.y), p.size, paint);
      
      // Draw faint lines between close particles
      for (var other in particles) {
        final dist = (Offset(p.x, p.y) - Offset(other.x, other.y)).distance;
        if (dist < 50) {
          final linePaint = Paint()
            ..color = p.color.withOpacity(0.1 * (1 - dist / 50))
            ..strokeWidth = 0.5;
          canvas.drawLine(Offset(p.x, p.y), Offset(other.x, other.y), linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(GalaxyPainter oldDelegate) => true;
}

const particleGalaxyCode = r'''
class GalaxyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    for (var p in particles) {
      canvas.drawCircle(Offset(p.x, p.y), p.size, paint);
      // Connecting lines logic
      if (dist < 50) {
        canvas.drawLine(p1, p2, linePaint);
      }
    }
  }
}''';
