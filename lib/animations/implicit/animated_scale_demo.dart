import 'package:flutter/material.dart';

class AnimatedScaleDemo extends StatefulWidget {
  const AnimatedScaleDemo({super.key});

  @override
  State<AnimatedScaleDemo> createState() => _AnimatedScaleDemoState();
}

class _AnimatedScaleDemoState extends State<AnimatedScaleDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
            scale: _expanded ? 1.24 : 0.84,
            duration: const Duration(milliseconds: 650),
            curve: Curves.easeOutBack,
            child: Container(
              width: 118,
              height: 118,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Color(0xFF9B5DE5), Color(0xFFF15BB5)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF9B5DE5).withOpacity(0.35),
                    blurRadius: 22,
                  ),
                ],
              ),
              child: const Icon(
                Icons.auto_awesome_rounded,
                color: Colors.white,
                size: 54,
              ),
            ),
          ),
          const SizedBox(height: 26),
          ElevatedButton.icon(
            onPressed: () => setState(() => _expanded = !_expanded),
            icon: const Icon(Icons.zoom_out_map_rounded),
            label: const Text('Animate scale'),
          ),
        ],
      ),
    );
  }
}

const animatedScaleCode = r'''
AnimatedScale(
  scale: _expanded ? 1.24 : 0.84,
  duration: const Duration(milliseconds: 650),
  curve: Curves.easeOutBack,
  child: const DemoCard(),
)''';
