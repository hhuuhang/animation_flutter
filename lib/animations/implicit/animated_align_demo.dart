import 'package:flutter/material.dart';

class AnimatedAlignDemo extends StatefulWidget {
  const AnimatedAlignDemo({super.key});

  @override
  State<AnimatedAlignDemo> createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState extends State<AnimatedAlignDemo> {
  bool _atTop = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: _atTop ? Alignment.topCenter : Alignment.bottomCenter,
                duration: const Duration(seconds: 1),
                curve: Curves.elasticOut,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withOpacity(0.5),
                        blurRadius: 20,
                      )
                    ],
                  ),
                  child: const Icon(Icons.star, color: Colors.white, size: 40),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => setState(() => _atTop = !_atTop),
          child: const Text('Toggle Alignment'),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

const animatedAlignCode = r'''
AnimatedAlign(
  alignment: _atTop ? Alignment.topCenter : Alignment.bottomCenter,
  duration: const Duration(seconds: 1),
  curve: Curves.elasticOut,
  child: Container(
    width: 80,
    height: 80,
    decoration: BoxDecoration(
      color: Colors.amber,
      shape: BoxShape.circle,
    ),
    child: Icon(Icons.star, color: Colors.white),
  ),
)''';
