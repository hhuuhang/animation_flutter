import 'package:flutter/material.dart';

class WaterRippleDemo extends StatefulWidget {
  const WaterRippleDemo({super.key});

  @override
  State<WaterRippleDemo> createState() => _WaterRippleDemoState();
}

class _WaterRippleDemoState extends State<WaterRippleDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset? _tapPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap(TapDownDetails details) {
    setState(() {
      _tapPosition = details.localPosition;
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: _handleTap,
        child: Container(
          width: double.infinity,
          height: 400,
          color: Colors.blue.shade50,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: RipplePainter(_controller.value, _tapPosition),
              );
            },
          ),
        ),
      ),
    );
  }
}

class RipplePainter extends CustomPainter {
  final double progress;
  final Offset? tapPosition;

  RipplePainter(this.progress, this.tapPosition);

  @override
  void paint(Canvas canvas, Size size) {
    if (tapPosition == null || progress == 0 || progress == 1) return;

    final maxRadius = size.width;
    for (int i = 0; i < 3; i++) {
      final currentProgress = (progress - (i * 0.1)).clamp(0.0, 1.0);
      if (currentProgress > 0) {
        final radius = maxRadius * currentProgress;
        final opacity = (1.0 - currentProgress).clamp(0.0, 1.0);
        final paint = Paint()
          ..color = Colors.blue.withOpacity(opacity)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;

        canvas.drawCircle(tapPosition!, radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(RipplePainter oldDelegate) => true;
}

const waterRippleCode = r'''
class RipplePainter extends CustomPainter {
  final double progress;
  final Offset tapPosition;

  RipplePainter(this.progress, this.tapPosition);

  @override
  void paint(Canvas canvas, Size size) {
    final maxRadius = size.width;
    for (int i = 0; i < 3; i++) {
      final currentProgress = (progress - (i * 0.1)).clamp(0.0, 1.0);
      if (currentProgress > 0) {
        final radius = maxRadius * currentProgress;
        final opacity = 1.0 - currentProgress;
        final paint = Paint()
          ..color = Colors.blue.withOpacity(opacity)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;

        canvas.drawCircle(tapPosition, radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(RipplePainter oldDelegate) => true;
}
''';
