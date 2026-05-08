import 'package:flutter/material.dart';
import 'dart:math';

class GlitchTextDemo extends StatefulWidget {
  const GlitchTextDemo({super.key});

  @override
  State<GlitchTextDemo> createState() => _GlitchTextDemoState();
}

class _GlitchTextDemoState extends State<GlitchTextDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
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
          final isGlitching = _random.nextDouble() > 0.5;
          final offset1 = isGlitching ? Offset((_random.nextDouble() - 0.5) * 10, (_random.nextDouble() - 0.5) * 5) : Offset.zero;
          final offset2 = isGlitching ? Offset((_random.nextDouble() - 0.5) * 10, (_random.nextDouble() - 0.5) * 5) : Offset.zero;

          return Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: offset1,
                child: const Text(
                  'CYBERPUNK',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.redAccent,
                    letterSpacing: 4,
                  ),
                ),
              ),
              Transform.translate(
                offset: offset2,
                child: const Text(
                  'CYBERPUNK',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.cyanAccent,
                    letterSpacing: 4,
                  ),
                ),
              ),
              const Text(
                'CYBERPUNK',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 4,
                ),
              ),
              if (isGlitching)
                Positioned(
                  top: _random.nextDouble() * 50,
                  child: Container(
                    height: _random.nextDouble() * 10,
                    width: 300,
                    color: Colors.black,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

const glitchTextCode = r'''
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    final isGlitching = Random().nextDouble() > 0.5;
    final o1 = isGlitching ? Offset((Random().nextDouble() - 0.5) * 10, 0) : Offset.zero;
    final o2 = isGlitching ? Offset((Random().nextDouble() - 0.5) * -10, 0) : Offset.zero;

    return Stack(
      children: [
        Transform.translate(offset: o1, child: Text('GLITCH', style: TextStyle(color: Colors.red))),
        Transform.translate(offset: o2, child: Text('GLITCH', style: TextStyle(color: Colors.cyan))),
        Text('GLITCH', style: TextStyle(color: Colors.white)),
        if (isGlitching)
          Positioned(
            top: Random().nextDouble() * 50,
            child: Container(height: 5, width: 200, color: Colors.black),
          ),
      ],
    );
  },
)
''';
