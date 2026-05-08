import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class MagneticButtonDemo extends StatefulWidget {
  const MagneticButtonDemo({super.key});

  @override
  State<MagneticButtonDemo> createState() => _MagneticButtonDemoState();
}

class _MagneticButtonDemoState extends State<MagneticButtonDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  Offset _offset = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      setState(() {
        _offset = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _offset += details.delta;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    _animation = Tween<Offset>(
      begin: _offset,
      end: Offset.zero,
    ).animate(_controller);

    const springDescription = SpringDescription(
      mass: 1,
      stiffness: 500,
      damping: 15,
    );

    final springSimulation = SpringSimulation(
      springDescription,
      0,
      1,
      0,
    );

    _controller.animateWith(springSimulation);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Transform.translate(
          offset: _offset,
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.gamepad,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

const magneticButtonCode = r'''
void _onPanUpdate(DragUpdateDetails details) {
  setState(() {
    _offset += details.delta;
  });
}

void _onPanEnd(DragEndDetails details) {
  _animation = Tween<Offset>(begin: _offset, end: Offset.zero).animate(_controller);
  final spring = SpringDescription(mass: 1, stiffness: 500, damping: 15);
  _controller.animateWith(SpringSimulation(spring, 0, 1, 0));
}

Widget build(BuildContext context) {
  return GestureDetector(
    onPanUpdate: _onPanUpdate,
    onPanEnd: _onPanEnd,
    child: Transform.translate(
      offset: _offset,
      child: Container(color: Colors.purple, child: Icon(Icons.gamepad)),
    ),
  );
}
''';
