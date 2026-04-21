import 'package:flutter/material.dart';

class AnimatedRotationDemo extends StatefulWidget {
  const AnimatedRotationDemo({super.key});

  @override
  State<AnimatedRotationDemo> createState() => _AnimatedRotationDemoState();
}

class _AnimatedRotationDemoState extends State<AnimatedRotationDemo> {
  double _turns = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedRotation(
            turns: _turns,
            duration: const Duration(milliseconds: 750),
            curve: Curves.easeInOutCubicEmphasized,
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const SweepGradient(
                  colors: [
                    Color(0xFF06B6D4),
                    Color(0xFF2563EB),
                    Color(0xFF9333EA),
                    Color(0xFF06B6D4),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2563EB).withOpacity(0.3),
                    blurRadius: 24,
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0F0F0F),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.navigation_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 26),
          ElevatedButton.icon(
            onPressed: () => setState(() => _turns += 0.25),
            icon: const Icon(Icons.rotate_right_rounded),
            label: const Text('Rotate quarter turn'),
          ),
        ],
      ),
    );
  }
}

const animatedRotationCode = r'''
AnimatedRotation(
  turns: _turns,
  duration: const Duration(milliseconds: 750),
  curve: Curves.easeInOutCubicEmphasized,
  child: const CompassDial(),
)''';
