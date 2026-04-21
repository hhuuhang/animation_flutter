import 'package:flutter/material.dart';

class SizeTransitionDemo extends StatefulWidget {
  const SizeTransitionDemo({super.key});

  @override
  State<SizeTransitionDemo> createState() => _SizeTransitionDemoState();
}

class _SizeTransitionDemoState extends State<SizeTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1200),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _sizeFactor =
      Tween<double>(begin: 0.18, end: 1).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Signal Strength',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 120,
              height: 120,
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: _sizeFactor,
                axis: Axis.vertical,
                axisAlignment: 1,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFF22C55E), Color(0xFFA3E635)],
                    ),
                  ),
                  child: const Icon(
                    Icons.network_check_rounded,
                    color: Colors.black87,
                    size: 44,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const sizeTransitionCode = r'''
SizeTransition(
  sizeFactor: Tween<double>(begin: 0.18, end: 1).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo),
  ),
  axis: Axis.vertical,
  axisAlignment: 1,
  child: SignalCard(),
)''';
