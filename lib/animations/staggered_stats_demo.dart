import 'package:flutter/material.dart';

class StaggeredStatsDemo extends StatefulWidget {
  const StaggeredStatsDemo({super.key});

  @override
  State<StaggeredStatsDemo> createState() => _StaggeredStatsDemoState();
}

class _StaggeredStatsDemoState extends State<StaggeredStatsDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1800),
    vsync: this,
  )..forward();

  static const _bars = [
    _BarSpec('Mon', 0.45, Color(0xFF38BDF8)),
    _BarSpec('Tue', 0.68, Color(0xFF818CF8)),
    _BarSpec('Wed', 0.82, Color(0xFF22C55E)),
    _BarSpec('Thu', 0.58, Color(0xFFF59E0B)),
    _BarSpec('Fri', 0.92, Color(0xFFF43F5E)),
  ];

  void _replay() {
    _controller
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.white10),
            ),
            child: SizedBox(
              height: 140,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(_bars.length, (index) {
                  final spec = _bars[index];
                  final start = index * 0.12;
                  final end = (start + 0.42).clamp(0.0, 1.0);
                  final animation = CurvedAnimation(
                    parent: _controller,
                    curve: Interval(start, end, curve: Curves.easeOutBack),
                  );

                  return AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 28,
                            height: 96 * spec.heightFactor * animation.value,
                            decoration: BoxDecoration(
                              color: spec.color,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: spec.color.withOpacity(0.28),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Opacity(
                            opacity: animation.value.clamp(0.0, 1.0),
                            child: Text(
                              spec.label,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.65),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _replay,
            icon: const Icon(Icons.replay_rounded),
            label: const Text('Replay stagger'),
          ),
        ],
      ),
    );
  }
}

class _BarSpec {
  final String label;
  final double heightFactor;
  final Color color;

  const _BarSpec(this.label, this.heightFactor, this.color);
}

const staggeredStatsCode = r'''
final animation = CurvedAnimation(
  parent: _controller,
  curve: Interval(start, end, curve: Curves.easeOutBack),
);

AnimatedBuilder(
  animation: animation,
  builder: (context, child) {
    return Container(height: maxHeight * animation.value);
  },
)''';
