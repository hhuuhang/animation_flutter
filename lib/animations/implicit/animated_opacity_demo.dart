import 'package:flutter/material.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  const AnimatedOpacityDemo({super.key});

  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFF3F8CFF),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3F8CFF).withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(Icons.visibility, color: Colors.white, size: 50),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => setState(() => _visible = !_visible),
          child: Text(_visible ? 'Hide Box' : 'Show Box'),
        ),
      ],
    );
  }
}

const animatedOpacityCode = r'''
AnimatedOpacity(
  opacity: _visible ? 1.0 : 0.0,
  duration: const Duration(milliseconds: 500),
  child: Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      color: Color(0xFF3F8CFF),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Icon(Icons.visibility, color: Colors.white, size: 50),
  ),
)''';
