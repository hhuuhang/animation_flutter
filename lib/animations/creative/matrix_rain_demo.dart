import 'package:flutter/material.dart';
import 'dart:math';

class MatrixRainDemo extends StatefulWidget {
  const MatrixRainDemo({super.key});

  @override
  State<MatrixRainDemo> createState() => _MatrixRainDemoState();
}

class _MatrixRainDemoState extends State<MatrixRainDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<MatrixLine> _lines = [];
  final Random _random = Random();
  final String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#\$%^&*';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        _updateLines();
      })..repeat();

    for (int i = 0; i < 40; i++) {
      _lines.add(_createLine(i.toDouble() * 10));
    }
  }

  MatrixLine _createLine(double x) {
    return MatrixLine(
      x: x,
      y: -_random.nextDouble() * 500,
      speed: _random.nextDouble() * 3 + 2,
      length: _random.nextInt(15) + 5,
      chars: List.generate(20, (index) => _chars[_random.nextInt(_chars.length)]),
    );
  }

  void _updateLines() {
    for (var line in _lines) {
      line.y += line.speed;
      if (_random.nextDouble() > 0.8) {
        line.chars[_random.nextInt(line.chars.length)] =
            _chars[_random.nextInt(_chars.length)];
      }
      if (line.y > 600) {
        line.y = -_random.nextDouble() * 100 - 100;
      }
    }
    setState(() {});
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
      width: double.infinity,
      height: double.infinity,
      child: ClipRect(
        child: CustomPaint(
          painter: MatrixPainter(_lines),
        ),
      ),
    );
  }
}

class MatrixLine {
  double x;
  double y;
  double speed;
  int length;
  List<String> chars;

  MatrixLine({
    required this.x,
    required this.y,
    required this.speed,
    required this.length,
    required this.chars,
  });
}

class MatrixPainter extends CustomPainter {
  final List<MatrixLine> lines;

  MatrixPainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      color: Colors.greenAccent,
      fontSize: 14,
      fontFamily: 'monospace',
    );
    const whiteTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: 'monospace',
    );

    for (var line in lines) {
      for (int i = 0; i < line.length; i++) {
        final charIndex = i % line.chars.length;
        final isHead = i == line.length - 1;
        final span = TextSpan(
          text: line.chars[charIndex],
          style: isHead ? whiteTextStyle : textStyle.copyWith(
            color: Colors.greenAccent.withOpacity(1.0 - (line.length - i) / line.length),
          ),
        );
        final tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(canvas, Offset(line.x, line.y + i * 14));
      }
    }
  }

  @override
  bool shouldRepaint(MatrixPainter oldDelegate) => true;
}

const matrixRainCode = r'''
class MatrixPainter extends CustomPainter {
  final List<MatrixLine> lines;

  MatrixPainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    for (var line in lines) {
      for (int i = 0; i < line.length; i++) {
        final isHead = i == line.length - 1;
        final span = TextSpan(
          text: line.chars[i % line.chars.length],
          style: TextStyle(
            color: isHead ? Colors.white : Colors.green.withOpacity(1.0 - (line.length - i) / line.length),
          ),
        );
        final tp = TextPainter(text: span, textDirection: TextDirection.ltr);
        tp.layout();
        tp.paint(canvas, Offset(line.x, line.y + i * 14));
      }
    }
  }

  @override
  bool shouldRepaint(MatrixPainter oldDelegate) => true;
}
''';
