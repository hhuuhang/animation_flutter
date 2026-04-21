import 'package:flutter/material.dart';

class TweenAnimationBuilderDemo extends StatefulWidget {
  const TweenAnimationBuilderDemo({super.key});

  @override
  State<TweenAnimationBuilderDemo> createState() =>
      _TweenAnimationBuilderDemoState();
}

class _TweenAnimationBuilderDemoState extends State<TweenAnimationBuilderDemo> {
  double _target = 0.28;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: _target),
            duration: const Duration(milliseconds: 850),
            curve: Curves.easeInOutCubic,
            builder: (context, value, child) {
              return SizedBox(
                width: 170,
                height: 170,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 170,
                      child: CircularProgressIndicator(
                        value: value,
                        strokeWidth: 14,
                        backgroundColor: Colors.white10,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFFF97316),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${(value * 100).round()}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'engagement',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _target = _target < 0.6 ? 0.86 : 0.28;
              });
            },
            icon: const Icon(Icons.trending_up_rounded),
            label: const Text('Animate gauge'),
          ),
        ],
      ),
    );
  }
}

const tweenAnimationBuilderCode = r'''
TweenAnimationBuilder<double>(
  tween: Tween<double>(begin: 0, end: _target),
  duration: const Duration(milliseconds: 850),
  builder: (context, value, child) {
    return CircularProgressIndicator(value: value);
  },
)''';
