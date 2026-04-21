import 'package:flutter/material.dart';

class PositionedTransitionDemo extends StatefulWidget {
  const PositionedTransitionDemo({super.key});

  @override
  State<PositionedTransitionDemo> createState() =>
      _PositionedTransitionDemoState();
}

class _PositionedTransitionDemoState extends State<PositionedTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1800),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<RelativeRect> _position = RelativeRectTween(
    begin: const RelativeRect.fromLTRB(12, 86, 168, 12),
    end: const RelativeRect.fromLTRB(168, 12, 12, 86),
  ).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 240,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: Colors.white10),
        ),
        child: Stack(
          children: [
            PositionedTransition(
              rect: _position,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF06B6D4), Color(0xFF14B8A6)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.bolt_rounded,
                  color: Colors.white,
                  size: 34,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const positionedTransitionCode = r'''
late final Animation<RelativeRect> _position = RelativeRectTween(
  begin: const RelativeRect.fromLTRB(12, 86, 168, 12),
  end: const RelativeRect.fromLTRB(168, 12, 12, 86),
).animate(_controller);

PositionedTransition(
  rect: _position,
  child: const MovingTile(),
)''';
