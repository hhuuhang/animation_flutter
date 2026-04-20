import 'package:flutter/material.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  const AnimatedPaddingDemo({super.key});

  @override
  State<AnimatedPaddingDemo> createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  double _padding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedPadding(
          padding: EdgeInsets.all(_padding),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'Padding Magic',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Slider(
          value: _padding,
          min: 0,
          max: 60,
          onChanged: (value) => setState(() => _padding = value),
        ),
        Text('Padding: ${_padding.toStringAsFixed(1)}'),
      ],
    );
  }
}

const animatedPaddingCode = r'''
AnimatedPadding(
  padding: EdgeInsets.all(_padding),
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeInOut,
  child: Container(
    color: Colors.teal,
    child: Center(child: Text('Padding Magic')),
  ),
)''';
