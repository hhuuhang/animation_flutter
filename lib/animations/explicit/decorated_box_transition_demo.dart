import 'package:flutter/material.dart';

class DecoratedBoxTransitionDemo extends StatefulWidget {
  const DecoratedBoxTransitionDemo({super.key});

  @override
  State<DecoratedBoxTransitionDemo> createState() =>
      _DecoratedBoxTransitionDemoState();
}

class _DecoratedBoxTransitionDemoState extends State<DecoratedBoxTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Decoration> _decoration = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFF2563EB),
      borderRadius: BorderRadius.circular(26),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF2563EB).withOpacity(0.18),
          blurRadius: 12,
        ),
      ],
    ),
    end: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFFF97316), Color(0xFFF43F5E)],
      ),
      borderRadius: BorderRadius.circular(42),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFF97316).withOpacity(0.36),
          blurRadius: 26,
          spreadRadius: 2,
        ),
      ],
    ),
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
      child: DecoratedBoxTransition(
        decoration: _decoration,
        child: const SizedBox(
          width: 170,
          height: 170,
          child: Center(
            child: Icon(Icons.palette_rounded, color: Colors.white, size: 64),
          ),
        ),
      ),
    );
  }
}

const decoratedBoxTransitionCode = r'''
late final Animation<Decoration> _decoration = DecorationTween(
  begin: BoxDecoration(color: Colors.blue),
  end: BoxDecoration(
    gradient: const LinearGradient(colors: [Colors.orange, Colors.pink]),
  ),
).animate(_controller);

DecoratedBoxTransition(
  decoration: _decoration,
  child: const SizedBox(width: 170, height: 170),
)''';
