import 'package:flutter/material.dart';

class RotationTransitionDemo extends StatefulWidget {
  const RotationTransitionDemo({super.key});

  @override
  State<RotationTransitionDemo> createState() => _RotationTransitionDemoState();
}

class _RotationTransitionDemoState extends State<RotationTransitionDemo> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _controller,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            gradient: const SweepGradient(
              colors: [Colors.blue, Colors.purple, Colors.red, Colors.blue],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.5),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const Icon(Icons.refresh, color: Colors.white, size: 80),
        ),
      ),
    );
  }
}

const rotationTransitionCode = r'''
late final AnimationController _controller = AnimationController(
  duration: const Duration(seconds: 3),
  vsync: this,
)..repeat();

RotationTransition(
  turns: _controller,
  child: Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
       gradient: SweepGradient(
         colors: [Colors.blue, Colors.purple, Colors.red, Colors.blue],
       ),
    ),
    child: Icon(Icons.refresh, color: Colors.white, size: 80),
  ),
)''';
