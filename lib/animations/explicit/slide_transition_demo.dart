import 'package:flutter/material.dart';

class SlideTransitionDemo extends StatefulWidget {
  const SlideTransitionDemo({super.key});

  @override
  State<SlideTransitionDemo> createState() => _SlideTransitionDemoState();
}

class _SlideTransitionDemoState extends State<SlideTransitionDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1400),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _slide = Tween<Offset>(
    begin: const Offset(-1.15, 0),
    end: const Offset(1.15, 0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic));

  late final Animation<double> _fade =
      Tween<double>(begin: 0.35, end: 1).animate(
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Container(
          width: 240,
          height: 140,
          color: const Color(0xFF0B132B),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 180,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              FadeTransition(
                opacity: _fade,
                child: SlideTransition(
                  position: _slide,
                  child: Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5BC0BE),
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF5BC0BE).withOpacity(0.35),
                          blurRadius: 18,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const slideTransitionCode = r'''
late final Animation<Offset> _slide = Tween<Offset>(
  begin: const Offset(-1.15, 0),
  end: const Offset(1.15, 0),
).animate(
  CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
);

SlideTransition(
  position: _slide,
  child: const Icon(Icons.send_rounded),
)''';
