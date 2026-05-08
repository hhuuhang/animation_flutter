import 'package:flutter/material.dart';

class NeonGlowDemo extends StatefulWidget {
  const NeonGlowDemo({super.key});

  @override
  State<NeonGlowDemo> createState() => _NeonGlowDemoState();
}

class _NeonGlowDemoState extends State<NeonGlowDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.cyanAccent.withOpacity(0.5),
      end: Colors.cyanAccent.withOpacity(1.0),
    ).animate(_controller);
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
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: _colorAnimation.value!,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: _colorAnimation.value!,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: _colorAnimation.value!,
                  blurRadius: 20,
                  spreadRadius: -5,
                ),
                BoxShadow(
                  color: _colorAnimation.value!,
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Text(
              'NEON',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 8,
                shadows: [
                  Shadow(
                    color: _colorAnimation.value!,
                    blurRadius: 10,
                  ),
                  Shadow(
                    color: _colorAnimation.value!,
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

const neonGlowCode = r'''
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: _colorAnimation.value!, width: 2),
        boxShadow: [
          BoxShadow(
            color: _colorAnimation.value!,
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Text('NEON', style: TextStyle(shadows: [Shadow(color: _colorAnimation.value!, blurRadius: 10)])),
    );
  },
)
''';
