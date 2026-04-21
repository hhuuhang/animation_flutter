import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleDemo extends StatefulWidget {
  const AnimatedDefaultTextStyleDemo({super.key});

  @override
  State<AnimatedDefaultTextStyleDemo> createState() =>
      _AnimatedDefaultTextStyleDemoState();
}

class _AnimatedDefaultTextStyleDemoState
    extends State<AnimatedDefaultTextStyleDemo> {
  bool _emphasized = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.white10),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              style: TextStyle(
                fontSize: _emphasized ? 38 : 24,
                fontWeight: _emphasized ? FontWeight.w800 : FontWeight.w500,
                color: _emphasized ? const Color(0xFFFFC857) : Colors.white70,
                letterSpacing: _emphasized ? 2.2 : 0.4,
                shadows: _emphasized
                    ? [
                        Shadow(
                          color: const Color(0xFFFFC857).withOpacity(0.45),
                          blurRadius: 18,
                        ),
                      ]
                    : const [],
              ),
              child: const Text(
                'Motion Matters',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Animate typography emphasis without rebuilding text layouts.',
            style: TextStyle(color: Colors.white.withOpacity(0.6)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => setState(() => _emphasized = !_emphasized),
            icon: const Icon(Icons.text_fields_rounded),
            label: const Text('Animate text style'),
          ),
        ],
      ),
    );
  }
}

const animatedDefaultTextStyleCode = r'''
AnimatedDefaultTextStyle(
  duration: const Duration(milliseconds: 700),
  curve: Curves.easeOutCubic,
  style: TextStyle(
    fontSize: _emphasized ? 38 : 24,
    fontWeight: _emphasized ? FontWeight.w800 : FontWeight.w500,
    letterSpacing: _emphasized ? 2.2 : 0.4,
  ),
  child: const Text('Motion Matters'),
)''';
