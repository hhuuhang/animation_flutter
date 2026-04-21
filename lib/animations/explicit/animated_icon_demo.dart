import 'package:flutter/material.dart';

class AnimatedIconDemo extends StatefulWidget {
  const AnimatedIconDemo({super.key});

  @override
  State<AnimatedIconDemo> createState() => _AnimatedIconDemoState();
}

class _AnimatedIconDemoState extends State<AnimatedIconDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );

  bool _isPlaying = false;

  void _toggle() {
    if (_isPlaying) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
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
          GestureDetector(
            onTap: _toggle,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF5D8F), Color(0xFFFFA45B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF5D8F).withOpacity(0.35),
                    blurRadius: 22,
                  ),
                ],
              ),
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _controller,
                color: Colors.white,
                size: 72,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            _isPlaying ? 'Playing' : 'Paused',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _toggle,
            icon: const Icon(Icons.touch_app_rounded),
            label: const Text('Toggle icon'),
          ),
        ],
      ),
    );
  }
}

const animatedIconCode = r'''
late final AnimationController _controller = AnimationController(
  duration: const Duration(milliseconds: 700),
  vsync: this,
);

AnimatedIcon(
  icon: AnimatedIcons.play_pause,
  progress: _controller,
)''';
