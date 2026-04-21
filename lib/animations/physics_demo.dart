import 'package:flutter/material.dart';

class PhysicsSpringDemo extends StatefulWidget {
  const PhysicsSpringDemo({super.key});

  @override
  State<PhysicsSpringDemo> createState() => _PhysicsSpringDemoState();
}

class _PhysicsSpringDemoState extends State<PhysicsSpringDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset _dragOffset = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _dragOffset += details.delta;
        });
      },
      onPanEnd: (details) {
        // Simple return to center with animation
        final endOffset = _dragOffset;
        final anim = Tween<Offset>(begin: endOffset, end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
        );
        anim.addListener(() {
          setState(() {
            _dragOffset = anim.value;
          });
        });
        _controller.reset();
        _controller.duration = const Duration(milliseconds: 800);
        _controller.forward();
      },
      child: Center(
        child: Transform.translate(
          offset: _dragOffset,
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))
              ],
            ),
            child:
                const Icon(Icons.drag_indicator, color: Colors.black, size: 50),
          ),
        ),
      ),
    );
  }
}

const physicsSpringCode = r'''
GestureDetector(
  onPanUpdate: (details) => setState(() => _dragOffset += details.delta),
  onPanEnd: (details) {
    final anim = Tween<Offset>(begin: _dragOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    anim.addListener(() => setState(() => _dragOffset = anim.value));
    _controller.reset();
    _controller.forward();
  },
  child: Transform.translate(
    offset: _dragOffset,
    child: Container(shape: BoxShape.circle, color: Colors.greenAccent),
  ),
)''';
