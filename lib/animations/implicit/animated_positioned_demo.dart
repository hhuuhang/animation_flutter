import 'package:flutter/material.dart';

class AnimatedPositionedDemo extends StatefulWidget {
  const AnimatedPositionedDemo({super.key});

  @override
  State<AnimatedPositionedDemo> createState() => _AnimatedPositionedDemoState();
}

class _AnimatedPositionedDemoState extends State<AnimatedPositionedDemo> {
  bool _atTopRight = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 240,
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white10),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 18,
                  top: 20,
                  child: _AnchorDot(color: Colors.white.withOpacity(0.2)),
                ),
                Positioned(
                  right: 18,
                  top: 20,
                  child: _AnchorDot(color: Colors.white.withOpacity(0.2)),
                ),
                Positioned(
                  left: 18,
                  bottom: 18,
                  child: _AnchorDot(color: Colors.white.withOpacity(0.2)),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 850),
                  curve: Curves.easeInOutBack,
                  left: _atTopRight ? 170 : 18,
                  top: _atTopRight ? 20 : 90,
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00D9F5), Color(0xFF6C63FF)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00D9F5).withOpacity(0.35),
                          blurRadius: 18,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => setState(() => _atTopRight = !_atTopRight),
            icon: const Icon(Icons.open_with_rounded),
            label: const Text('Move orb'),
          ),
        ],
      ),
    );
  }
}

class _AnchorDot extends StatelessWidget {
  final Color color;

  const _AnchorDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color),
      ),
    );
  }
}

const animatedPositionedCode = r'''
Stack(
  children: [
    AnimatedPositioned(
      duration: const Duration(milliseconds: 850),
      curve: Curves.easeInOutBack,
      left: _atTopRight ? 170 : 18,
      top: _atTopRight ? 20 : 90,
      child: MovingOrb(),
    ),
  ],
)''';
