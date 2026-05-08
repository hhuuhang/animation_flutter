import 'package:flutter/material.dart';

class TypingIndicatorDemo extends StatefulWidget {
  const TypingIndicatorDemo({super.key});

  @override
  State<TypingIndicatorDemo> createState() => _TypingIndicatorDemoState();
}

class _TypingIndicatorDemoState extends State<TypingIndicatorDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDot(0),
            const SizedBox(width: 8),
            _buildDot(1),
            const SizedBox(width: 8),
            _buildDot(2),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final intervalStart = index * 0.2;
        final intervalEnd = intervalStart + 0.6;
        final t = ((_controller.value - intervalStart) / (intervalEnd - intervalStart)).clamp(0.0, 1.0);
        
        final double yPos = t < 0.5 
            ? -10.0 * Curves.easeOut.transform(t * 2) 
            : -10.0 * (1 - Curves.easeIn.transform((t - 0.5) * 2));
            
        final double opacity = _controller.value >= intervalStart && _controller.value <= intervalEnd ? 1.0 : 0.3;

        return Transform.translate(
          offset: Offset(0, yPos),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(opacity),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

const typingIndicatorCode = r'''
Widget _buildDot(int index) {
  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      final start = index * 0.2;
      final t = ((_controller.value - start) / 0.6).clamp(0.0, 1.0);
      
      final yPos = t < 0.5 
          ? -10.0 * Curves.easeOut.transform(t * 2) 
          : -10.0 * (1 - Curves.easeIn.transform((t - 0.5) * 2));

      return Transform.translate(
        offset: Offset(0, yPos),
        child: CircleAvatar(radius: 5, backgroundColor: Colors.black),
      );
    },
  );
}
''';
