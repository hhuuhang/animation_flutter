import 'package:flutter/material.dart';

class ScaleTransitionDemo extends StatefulWidget {
  const ScaleTransitionDemo({super.key});

  @override
  State<ScaleTransitionDemo> createState() => _ScaleTransitionDemoState();
}

class _ScaleTransitionDemoState extends State<ScaleTransitionDemo>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.notifications_active,
              color: Colors.white, size: 60),
        ),
      ),
    );
  }
}

const scaleTransitionCode = r'''
late final AnimationController _controller = AnimationController(
  duration: const Duration(seconds: 1),
  vsync: this,
)..repeat(reverse: true);

ScaleTransition(
  scale: CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  ),
  child: Container(
    shape: BoxShape.circle,
    color: Colors.orange,
  ),
)''';
