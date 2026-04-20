import 'package:flutter/material.dart';

class StaggeredMenuDemo extends StatefulWidget {
  const StaggeredMenuDemo({super.key});

  @override
  State<StaggeredMenuDemo> createState() => _StaggeredMenuDemoState();
}

class _StaggeredMenuDemoState extends State<StaggeredMenuDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: const Text('Toggle Menu'),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    (index * 0.1).clamp(0.0, 1.0),
                    ((index * 0.1) + 0.5).clamp(0.0, 1.0),
                    curve: Curves.easeOutBack,
                  ),
                ),
              );

              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 50 * (1 - animation.value)),
                    child: Opacity(
                      opacity: animation.value,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white12),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.primaries[index % Colors.primaries.length],
                            child: Text('${index + 1}'),
                          ),
                          title: Text('Menu Item ${index + 1}', style: const TextStyle(color: Colors.white)),
                          subtitle: const Text('Tap to expand', style: TextStyle(color: Colors.white60, fontSize: 12)),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

const staggeredMenuCode = r'''
ListView.builder(
  itemCount: 6,
  itemBuilder: (context, index) {
    final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          (index * 0.1), (index * 0.1) + 0.5,
          curve: Curves.easeOutBack,
        ),
      ),
    );
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - animation.value)),
          child: Opacity(opacity: animation.value, child: MenuCard()),
        );
      },
    );
  },
)''';
