import 'package:flutter/material.dart';
import 'dart:math';

class ConfettiDemo extends StatefulWidget {
  const ConfettiDemo({super.key});

  @override
  State<ConfettiDemo> createState() => _ConfettiDemoState();
}

class _ConfettiDemoState extends State<ConfettiDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<ConfettiParticle> particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(() {
        _updateParticles();
      });
  }

  void _generateParticles() {
    particles.clear();
    for (int i = 0; i < 100; i++) {
      particles.add(ConfettiParticle(
        x: _random.nextDouble() * 300,
        y: -_random.nextDouble() * 200,
        vx: (_random.nextDouble() - 0.5) * 5,
        vy: _random.nextDouble() * 5 + 2,
        color: _getRandomColor(),
        size: _random.nextDouble() * 10 + 5,
        angle: _random.nextDouble() * 2 * pi,
        spin: (_random.nextDouble() - 0.5) * 0.5,
      ));
    }
  }

  Color _getRandomColor() {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
    ];
    return colors[_random.nextInt(colors.length)];
  }

  void _updateParticles() {
    for (var particle in particles) {
      particle.x += particle.vx;
      particle.y += particle.vy;
      particle.vy += 0.1; // gravity
      particle.angle += particle.spin;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 400,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: ConfettiPainter(particles),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _generateParticles();
              _controller.forward(from: 0);
            },
            child: const Text('Explode!'),
          ),
        ],
      ),
    );
  }
}

class ConfettiParticle {
  double x, y, vx, vy, size, angle, spin;
  Color color;
  ConfettiParticle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.size,
    required this.angle,
    required this.spin,
    required this.color,
  });
}

class ConfettiPainter extends CustomPainter {
  final List<ConfettiParticle> particles;
  ConfettiPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var p in particles) {
      canvas.save();
      canvas.translate(p.x, p.y);
      canvas.rotate(p.angle);
      final paint = Paint()..color = p.color;
      canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: p.size, height: p.size * 0.6), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(ConfettiPainter oldDelegate) => true;
}

const confettiCode = r'''
class ConfettiPainter extends CustomPainter {
  final List<ConfettiParticle> particles;
  ConfettiPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var p in particles) {
      canvas.save();
      canvas.translate(p.x, p.y);
      canvas.rotate(p.angle);
      canvas.drawRect(
        Rect.fromCenter(center: Offset.zero, width: p.size, height: p.size * 0.6), 
        Paint()..color = p.color,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
''';
