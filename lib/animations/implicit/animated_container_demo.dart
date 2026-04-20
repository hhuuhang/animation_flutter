import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() => _toggled = !_toggled),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
          width: _toggled ? 200 : 120,
          height: _toggled ? 200 : 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _toggled
                  ? [const Color(0xFF6C63FF), const Color(0xFF3F8CFF)]
                  : [const Color(0xFFFF6584), const Color(0xFFFF8A5C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(_toggled ? 32 : 16),
            boxShadow: [
              BoxShadow(
                color: (_toggled
                        ? const Color(0xFF6C63FF)
                        : const Color(0xFFFF6584))
                    .withOpacity(0.4),
                blurRadius: _toggled ? 24 : 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.touch_app, color: Colors.white, size: 40),
        ),
      ),
    );
  }
}

const animatedContainerCode = r'''
class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() => _toggled = !_toggled),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
          width: _toggled ? 200 : 120,
          height: _toggled ? 200 : 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _toggled
                  ? [const Color(0xFF6C63FF), const Color(0xFF3F8CFF)]
                  : [const Color(0xFFFF6584), const Color(0xFFFF8A5C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(_toggled ? 32 : 16),
            boxShadow: [
              BoxShadow(
                color: (_toggled
                        ? const Color(0xFF6C63FF)
                        : const Color(0xFFFF6584))
                    .withOpacity(0.4),
                blurRadius: _toggled ? 24 : 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.touch_app, color: Colors.white, size: 40),
        ),
      ),
    );
  }
}
''';
