import 'package:flutter/material.dart';

class CurveShowcaseDemo extends StatefulWidget {
  const CurveShowcaseDemo({super.key});

  @override
  State<CurveShowcaseDemo> createState() => _CurveShowcaseDemoState();
}

class _CurveShowcaseDemoState extends State<CurveShowcaseDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1800),
    vsync: this,
  )..repeat(reverse: true);

  static const List<_CurveSpec> _curves = [
    _CurveSpec('easeInOut', Curves.easeInOut, Color(0xFF2DD4BF)),
    _CurveSpec('easeOutBack', Curves.easeOutBack, Color(0xFF60A5FA)),
    _CurveSpec('bounceOut', Curves.bounceOut, Color(0xFFF59E0B)),
    _CurveSpec('elasticOut', Curves.elasticOut, Color(0xFFF472B6)),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _curves
                .map(
                  (spec) => Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: _CurveTrack(
                      label: spec.label,
                      color: spec.color,
                      progress: spec.curve.transform(_controller.value),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class _CurveTrack extends StatelessWidget {
  final String label;
  final Color color;
  final double progress;

  const _CurveTrack({
    required this.label,
    required this.color,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        LayoutBuilder(
          builder: (context, constraints) {
            final travel = constraints.maxWidth - 18;

            return SizedBox(
              height: 20,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    top: 7,
                    bottom: 7,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  Positioned(
                    left: travel * progress,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.35),
                            blurRadius: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _CurveSpec {
  final String label;
  final Curve curve;
  final Color color;

  const _CurveSpec(this.label, this.curve, this.color);
}

const curveShowcaseCode = r'''
final progress = Curves.elasticOut.transform(_controller.value);

Positioned(
  left: travel * progress,
  child: const Dot(),
)''';
