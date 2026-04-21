import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlipCardDemo extends StatefulWidget {
  const FlipCardDemo({super.key});

  @override
  State<FlipCardDemo> createState() => _FlipCardDemoState();
}

class _FlipCardDemoState extends State<FlipCardDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 550),
    vsync: this,
  );

  void _toggle() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
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
          GestureDetector(
            onTap: _toggle,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final angle = _controller.value * math.pi;
                final isBack = angle > math.pi / 2;
                final displayAngle = isBack ? angle - math.pi : angle;

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0012)
                    ..rotateY(displayAngle),
                  child: isBack ? const _BackFace() : const _FrontFace(),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _toggle,
            icon: const Icon(Icons.flip_rounded),
            label: const Text('Flip card'),
          ),
        ],
      ),
    );
  }
}

class _FrontFace extends StatelessWidget {
  const _FrontFace();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 140,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF4F46E5), Color(0xFF0EA5E9)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.credit_card_rounded, color: Colors.white, size: 32),
          Text(
            'Front Side',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _BackFace extends StatelessWidget {
  const _BackFace();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 140,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFFF97316), Color(0xFFFB7185)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.shield_rounded, color: Colors.white, size: 32),
          Text(
            'Back Side',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

const flipCardCode = r'''
final angle = _controller.value * math.pi;
final isBack = angle > math.pi / 2;
final displayAngle = isBack ? angle - math.pi : angle;

Transform(
  alignment: Alignment.center,
  transform: Matrix4.identity()
    ..setEntry(3, 2, 0.0012)
    ..rotateY(displayAngle),
  child: isBack ? const BackFace() : const FrontFace(),
)''';
