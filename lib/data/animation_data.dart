import 'package:flutter/material.dart';
import '../models/animation_item.dart';
import '../animations/implicit/animated_container_demo.dart';
import '../animations/implicit/animated_opacity_demo.dart';
import '../animations/implicit/animated_align_demo.dart';
import '../animations/implicit/animated_padding_demo.dart';
import '../animations/implicit/animated_switcher_demo.dart';
import '../animations/explicit/fade_transition_demo.dart';
import '../animations/explicit/rotation_transition_demo.dart';
import '../animations/explicit/scale_transition_demo.dart';
import '../animations/creative/pulse_radar_demo.dart';
import '../animations/creative/liquid_wave_demo.dart';
import '../animations/creative/particle_galaxy_demo.dart';
import '../animations/physics_demo.dart';
import '../animations/staggered_demo.dart';

final List<AnimationItem> animationRegistry = [
  // --- Creative & Custom Painter ---
  AnimationItem(
    id: 'particle_galaxy',
    name: 'Particle Galaxy',
    description: 'A network of floating interactive particles drawn with CustomPainter.',
    category: AnimationCategory.customPainter,
    accentColor: Colors.purpleAccent,
    builder: () => const ParticleGalaxyDemo(),
    sourceCode: particleGalaxyCode,
  ),
  // --- Advanced Animations ---
  AnimationItem(
    id: 'physics_spring',
    name: 'Physics Spring',
    description: 'A draggable circle that snaps back to center using elastic physics.',
    category: AnimationCategory.physics,
    accentColor: Colors.greenAccent,
    builder: () => const PhysicsSpringDemo(),
    sourceCode: physicsSpringCode,
  ),
  AnimationItem(
    id: 'staggered_menu',
    name: 'Staggered Menu',
    description: 'A list of menu items that animate in one by one with a delay.',
    category: AnimationCategory.staggered,
    accentColor: Colors.deepOrangeAccent,
    builder: () => const StaggeredMenuDemo(),
    sourceCode: staggeredMenuCode,
  ),

  // --- Implicit Animations ---
  AnimationItem(
    id: 'animated_container',
    name: 'AnimatedContainer',
    description: 'A box that gradually changes its appearance over a period of time.',
    category: AnimationCategory.implicit,
    accentColor: const Color(0xFF6C63FF),
    builder: () => const AnimatedContainerDemo(),
    sourceCode: animatedContainerCode,
  ),
  AnimationItem(
    id: 'animated_opacity',
    name: 'AnimatedOpacity',
    description: 'Fades a child widget in and out smoothly by changing its opacity.',
    category: AnimationCategory.implicit,
    accentColor: const Color(0xFF3F8CFF),
    builder: () => const AnimatedOpacityDemo(),
    sourceCode: animatedOpacityCode,
  ),
  AnimationItem(
    id: 'animated_align',
    name: 'AnimatedAlign',
    description: 'Animates the movement of a widget within its parent.',
    category: AnimationCategory.implicit,
    accentColor: Colors.amber,
    builder: () => const AnimatedAlignDemo(),
    sourceCode: animatedAlignCode,
  ),
  AnimationItem(
    id: 'animated_padding',
    name: 'AnimatedPadding',
    description: 'Animates the padding around a widget.',
    category: AnimationCategory.implicit,
    accentColor: Colors.teal,
    builder: () => const AnimatedPaddingDemo(),
    sourceCode: animatedPaddingCode,
  ),
  AnimationItem(
    id: 'animated_switcher',
    name: 'AnimatedSwitcher',
    description: 'Smoothly transitions between different widgets.',
    category: AnimationCategory.implicit,
    accentColor: Colors.cyan,
    builder: () => const AnimatedSwitcherDemo(),
    sourceCode: animatedSwitcherCode,
  ),

  // --- Explicit Animations ---
  AnimationItem(
    id: 'fade_transition',
    name: 'FadeTransition',
    description: 'Animates the opacity of a widget using an AnimationController.',
    category: AnimationCategory.explicit,
    accentColor: const Color(0xFFFF69B4),
    builder: () => const FadeTransitionDemo(),
    sourceCode: fadeTransitionCode,
  ),
  AnimationItem(
    id: 'rotation_transition',
    name: 'RotationTransition',
    description: 'Continuous rotation performance using AnimationController.',
    category: AnimationCategory.explicit,
    accentColor: Colors.purple,
    builder: () => const RotationTransitionDemo(),
    sourceCode: rotationTransitionCode,
  ),
  AnimationItem(
    id: 'scale_transition',
    name: 'ScaleTransition',
    description: 'Scales a widget up and down with consistent control.',
    category: AnimationCategory.explicit,
    accentColor: Colors.orange,
    builder: () => const ScaleTransitionDemo(),
    sourceCode: scaleTransitionCode,
  ),

  // --- Creative & Custom Painter ---
  AnimationItem(
    id: 'pulse_radar',
    name: 'Pulse Radar',
    description: 'A scanning radar effect created with CustomPainter.',
    category: AnimationCategory.customPainter,
    accentColor: Colors.blueAccent,
    builder: () => const PulseRadarDemo(),
    sourceCode: pulseRadarCode,
  ),
  AnimationItem(
    id: 'liquid_wave',
    name: 'Liquid Wave',
    description: 'Animate a fluid sine-wave surface in a circular container.',
    category: AnimationCategory.customPainter,
    accentColor: Colors.cyan,
    builder: () => const LiquidWaveDemo(),
    sourceCode: liquidWaveCode,
  ),
];
