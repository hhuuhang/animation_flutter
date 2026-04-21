import 'package:flutter/material.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  const AnimatedSwitcherDemo({super.key});

  @override
  State<AnimatedSwitcherDemo> createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Text(
              '$_count',
              key: ValueKey<int>(_count),
              style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () => setState(() => _count++),
            icon: const Icon(Icons.add),
            label: const Text('Increment and Switch'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

const animatedSwitcherCode = r'''
AnimatedSwitcher(
  duration: const Duration(milliseconds: 500),
  transitionBuilder: (Widget child, Animation<double> animation) {
    return ScaleTransition(scale: animation, child: child);
  },
  child: Text(
    '$_count',
    key: ValueKey<int>(_count),
    style: TextStyle(fontSize: 80),
  ),
)''';
