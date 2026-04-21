import 'package:flutter/material.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  const AnimatedCrossFadeDemo({super.key});

  @override
  State<AnimatedCrossFadeDemo> createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool _showAnalytics = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 240,
            height: 170,
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 650),
              firstCurve: Curves.easeOutCubic,
              secondCurve: Curves.easeInOutCubic,
              sizeCurve: Curves.easeInOut,
              crossFadeState: _showAnalytics
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: const _DemoPanel(
                gradient: [Color(0xFF7F5AF0), Color(0xFF2CB67D)],
                icon: Icons.album,
                title: 'Now Playing',
                subtitle: 'Cross-fade between album and analytics views.',
              ),
              secondChild: const _DemoPanel(
                gradient: [Color(0xFFFF8906), Color(0xFFF25F4C)],
                icon: Icons.bar_chart_rounded,
                title: 'Analytics',
                subtitle: 'Smoothly swaps content and preserves layout.',
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => setState(() => _showAnalytics = !_showAnalytics),
            icon: const Icon(Icons.compare_arrows_rounded),
            label: Text(_showAnalytics ? 'Show player' : 'Show analytics'),
          ),
        ],
      ),
    );
  }
}

class _DemoPanel extends StatelessWidget {
  final List<Color> gradient;
  final IconData icon;
  final String title;
  final String subtitle;

  const _DemoPanel({
    required this.gradient,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 170,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.82),
                  height: 1.35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const animatedCrossFadeCode = r'''
AnimatedCrossFade(
  duration: const Duration(milliseconds: 650),
  crossFadeState: _showAnalytics
      ? CrossFadeState.showSecond
      : CrossFadeState.showFirst,
  firstChild: PlayerPanel(),
  secondChild: AnalyticsPanel(),
)''';
