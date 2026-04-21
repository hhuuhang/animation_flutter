import 'package:flutter/material.dart';

class AlignTransitionDemo extends StatefulWidget {
  const AlignTransitionDemo({super.key});

  @override
  State<AlignTransitionDemo> createState() => _AlignTransitionDemoState();
}

class _AlignTransitionDemoState extends State<AlignTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1350),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<AlignmentGeometry> _alignment = AlignmentTween(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
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
        width: 230,
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: Colors.white10),
        ),
        child: AlignTransition(
          alignment: _alignment,
          child: Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE11D48),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE11D48).withOpacity(0.34),
                  blurRadius: 20,
                ),
              ],
            ),
            child: const Icon(Icons.favorite_rounded, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

const alignTransitionCode = r'''
late final Animation<AlignmentGeometry> _alignment = AlignmentTween(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
).animate(_controller);

AlignTransition(
  alignment: _alignment,
  child: const OrbitingBadge(),
)''';
