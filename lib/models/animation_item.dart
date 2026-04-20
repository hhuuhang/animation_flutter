import 'package:flutter/material.dart';

enum AnimationCategory {
  implicit('Implicit Animations', Icons.auto_awesome),
  explicit('Explicit Animations', Icons.animation),
  curves('Animation Curves', Icons.show_chart),
  hero('Hero Animations', Icons.flight),
  staggered('Staggered Animations', Icons.view_timeline),
  physics('Physics-based', Icons.science),
  customPainter('Custom Painter', Icons.brush),
  pageTransition('Page Transitions', Icons.swap_horiz);

  final String label;
  final IconData icon;
  const AnimationCategory(this.label, this.icon);
}

class AnimationItem {
  final String id;
  final String name;
  final String description;
  final AnimationCategory category;
  final Widget Function() builder;
  final String sourceCode;
  final Color accentColor;

  const AnimationItem({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.builder,
    required this.sourceCode,
    this.accentColor = Colors.deepPurple,
  });
}
