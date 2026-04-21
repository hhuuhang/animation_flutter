import 'package:flutter/material.dart';
import '../models/animation_item.dart';
import '../animations/implicit/animated_container_demo.dart';
import '../animations/implicit/animated_opacity_demo.dart';
import '../animations/implicit/animated_align_demo.dart';
import '../animations/implicit/animated_padding_demo.dart';
import '../animations/implicit/animated_switcher_demo.dart';
import '../animations/implicit/animated_cross_fade_demo.dart';
import '../animations/implicit/animated_positioned_demo.dart';
import '../animations/implicit/animated_default_text_style_demo.dart';
import '../animations/implicit/animated_scale_demo.dart';
import '../animations/implicit/animated_rotation_demo.dart';
import '../animations/implicit/animated_slide_demo.dart';
import '../animations/implicit/tween_animation_builder_demo.dart';
import '../animations/explicit/fade_transition_demo.dart';
import '../animations/explicit/rotation_transition_demo.dart';
import '../animations/explicit/scale_transition_demo.dart';
import '../animations/explicit/slide_transition_demo.dart';
import '../animations/explicit/size_transition_demo.dart';
import '../animations/explicit/animated_icon_demo.dart';
import '../animations/explicit/flip_card_demo.dart';
import '../animations/explicit/decorated_box_transition_demo.dart';
import '../animations/explicit/positioned_transition_demo.dart';
import '../animations/explicit/align_transition_demo.dart';
import '../animations/creative/pulse_radar_demo.dart';
import '../animations/creative/liquid_wave_demo.dart';
import '../animations/creative/particle_galaxy_demo.dart';
import '../animations/creative/orbit_pulse_demo.dart';
import '../animations/curves/curve_showcase_demo.dart';
import '../animations/hero/hero_profile_demo.dart';
import '../animations/page_transitions/page_route_reveal_demo.dart';
import '../animations/page_transitions/page_route_parallax_demo.dart';
import '../animations/physics_demo.dart';
import '../animations/staggered_demo.dart';
import '../animations/staggered_stats_demo.dart';

final List<AnimationItem> animationRegistry = [
  // --- Creative & Custom Painter ---
  AnimationItem(
    id: 'particle_galaxy',
    name: 'Particle Galaxy',
    description:
        'A network of floating interactive particles drawn with CustomPainter.',
    category: AnimationCategory.customPainter,
    accentColor: Colors.purpleAccent,
    builder: () => const ParticleGalaxyDemo(),
    sourceCode: particleGalaxyCode,
  ),
  // --- Advanced Animations ---
  AnimationItem(
    id: 'physics_spring',
    name: 'Physics Spring',
    description:
        'A draggable circle that snaps back to center using elastic physics.',
    category: AnimationCategory.physics,
    accentColor: Colors.greenAccent,
    builder: () => const PhysicsSpringDemo(),
    sourceCode: physicsSpringCode,
  ),
  AnimationItem(
    id: 'staggered_menu',
    name: 'Staggered Menu',
    description:
        'A list of menu items that animate in one by one with a delay.',
    category: AnimationCategory.staggered,
    accentColor: Colors.deepOrangeAccent,
    builder: () => const StaggeredMenuDemo(),
    sourceCode: staggeredMenuCode,
  ),
  AnimationItem(
    id: 'curve_showcase',
    name: 'Curve Showcase',
    description:
        'Compare how different animation curves change the same movement.',
    category: AnimationCategory.curves,
    accentColor: const Color(0xFF2DD4BF),
    builder: () => const CurveShowcaseDemo(),
    sourceCode: curveShowcaseCode,
  ),
  AnimationItem(
    id: 'hero_profile',
    name: 'Hero Profile',
    description:
        'Tap to push a route and watch a shared element animate between screens.',
    category: AnimationCategory.hero,
    accentColor: const Color(0xFF7C3AED),
    builder: () => const HeroProfileDemo(),
    sourceCode: heroProfileCode,
  ),
  AnimationItem(
    id: 'page_route_reveal',
    name: 'Page Route Reveal',
    description: 'A custom route transition that blends slide, fade and scale.',
    category: AnimationCategory.pageTransition,
    accentColor: const Color(0xFF34D399),
    builder: () => const PageRouteRevealDemo(),
    sourceCode: pageRouteRevealCode,
  ),
  AnimationItem(
    id: 'page_route_parallax',
    name: 'Page Route Parallax',
    description: 'A parallax navigation effect with layered route movement.',
    category: AnimationCategory.pageTransition,
    accentColor: const Color(0xFF60A5FA),
    builder: () => const PageRouteParallaxDemo(),
    sourceCode: pageRouteParallaxCode,
  ),

  // --- Implicit Animations ---
  AnimationItem(
    id: 'animated_container',
    name: 'AnimatedContainer',
    description:
        'A box that gradually changes its appearance over a period of time.',
    category: AnimationCategory.implicit,
    accentColor: const Color(0xFF6C63FF),
    builder: () => const AnimatedContainerDemo(),
    sourceCode: animatedContainerCode,
  ),
  AnimationItem(
    id: 'animated_opacity',
    name: 'AnimatedOpacity',
    description:
        'Fades a child widget in and out smoothly by changing its opacity.',
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
  AnimationItem(
    id: 'animated_cross_fade',
    name: 'AnimatedCrossFade',
    description:
        'Cross-fades between two layouts while also animating their size.',
    category: AnimationCategory.implicit,
    accentColor: const Color(0xFF7F5AF0),
    builder: () => const AnimatedCrossFadeDemo(),
    sourceCode: animatedCrossFadeCode,
  ),
  AnimationItem(
    id: 'animated_positioned',
    name: 'AnimatedPositioned',
    description: 'Moves a widget inside a Stack with smooth implicit motion.',
    category: AnimationCategory.implicit,
    accentColor: const Color(0xFF00D9F5),
    builder: () => const AnimatedPositionedDemo(),
    sourceCode: animatedPositionedCode,
  ),
  AnimationItem(
    id: 'animated_default_text_style',
    name: 'AnimatedDefaultTextStyle',
    description: 'Animates typography changes like size, weight and spacing.',
    category: AnimationCategory.implicit,
    accentColor: const Color(0xFFFFC857),
    builder: () => const AnimatedDefaultTextStyleDemo(),
    sourceCode: animatedDefaultTextStyleCode,
  ),
  AnimationItem(
    id: 'animated_scale',
    name: 'AnimatedScale',
    description:
        'Implicitly zooms a widget in and out with a single scale value.',
    category: AnimationCategory.implicit,
    accentColor: const Color(0xFFF15BB5),
    builder: () => const AnimatedScaleDemo(),
    sourceCode: animatedScaleCode,
  ),
  AnimationItem(
    id: 'animated_rotation',
    name: 'AnimatedRotation',
    description:
        'Turns a widget smoothly by animating the number of rotations.',
    category: AnimationCategory.implicit,
    accentColor: const Color(0xFF2563EB),
    builder: () => const AnimatedRotationDemo(),
    sourceCode: animatedRotationCode,
  ),
  AnimationItem(
    id: 'animated_slide',
    name: 'AnimatedSlide',
    description: 'Slides a widget by animating its fractional offset.',
    category: AnimationCategory.implicit,
    accentColor: const Color(0xFF22C55E),
    builder: () => const AnimatedSlideDemo(),
    sourceCode: animatedSlideCode,
  ),
  AnimationItem(
    id: 'tween_animation_builder',
    name: 'TweenAnimationBuilder',
    description:
        'Builds an animated value over time without managing a controller.',
    category: AnimationCategory.implicit,
    accentColor: const Color(0xFFF97316),
    builder: () => const TweenAnimationBuilderDemo(),
    sourceCode: tweenAnimationBuilderCode,
  ),

  // --- Explicit Animations ---
  AnimationItem(
    id: 'fade_transition',
    name: 'FadeTransition',
    description:
        'Animates the opacity of a widget using an AnimationController.',
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
  AnimationItem(
    id: 'slide_transition',
    name: 'SlideTransition',
    description:
        'Slides a widget across the screen using an AnimationController.',
    category: AnimationCategory.explicit,
    accentColor: const Color(0xFF5BC0BE),
    builder: () => const SlideTransitionDemo(),
    sourceCode: slideTransitionCode,
  ),
  AnimationItem(
    id: 'size_transition',
    name: 'SizeTransition',
    description: 'Reveals and collapses content by animating its visible size.',
    category: AnimationCategory.explicit,
    accentColor: const Color(0xFFA3E635),
    builder: () => const SizeTransitionDemo(),
    sourceCode: sizeTransitionCode,
  ),
  AnimationItem(
    id: 'animated_icon',
    name: 'AnimatedIcon',
    description:
        'Morphs one icon state into another with a controller-driven timeline.',
    category: AnimationCategory.explicit,
    accentColor: const Color(0xFFFF5D8F),
    builder: () => const AnimatedIconDemo(),
    sourceCode: animatedIconCode,
  ),
  AnimationItem(
    id: 'flip_card',
    name: '3D Flip Card',
    description: 'A perspective card flip built with Matrix4 and a controller.',
    category: AnimationCategory.explicit,
    accentColor: const Color(0xFF0EA5E9),
    builder: () => const FlipCardDemo(),
    sourceCode: flipCardCode,
  ),
  AnimationItem(
    id: 'decorated_box_transition',
    name: 'DecoratedBoxTransition',
    description:
        'Animates between two box decorations using a decoration tween.',
    category: AnimationCategory.explicit,
    accentColor: const Color(0xFFF97316),
    builder: () => const DecoratedBoxTransitionDemo(),
    sourceCode: decoratedBoxTransitionCode,
  ),
  AnimationItem(
    id: 'positioned_transition',
    name: 'PositionedTransition',
    description:
        'Moves a child through a Stack using a RelativeRect animation.',
    category: AnimationCategory.explicit,
    accentColor: const Color(0xFF14B8A6),
    builder: () => const PositionedTransitionDemo(),
    sourceCode: positionedTransitionCode,
  ),
  AnimationItem(
    id: 'align_transition',
    name: 'AlignTransition',
    description:
        'Animates a child between alignments with controller-based timing.',
    category: AnimationCategory.explicit,
    accentColor: const Color(0xFFE11D48),
    builder: () => const AlignTransitionDemo(),
    sourceCode: alignTransitionCode,
  ),

  // --- Advanced Animations ---
  AnimationItem(
    id: 'staggered_stats',
    name: 'Staggered Stats',
    description:
        'Bars animate in sequence using interval-based stagger timing.',
    category: AnimationCategory.staggered,
    accentColor: const Color(0xFF818CF8),
    builder: () => const StaggeredStatsDemo(),
    sourceCode: staggeredStatsCode,
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
  AnimationItem(
    id: 'orbit_pulse',
    name: 'Orbit Pulse',
    description:
        'Orbiting particles circle a pulsing core in a painter-driven scene.',
    category: AnimationCategory.customPainter,
    accentColor: const Color(0xFF38BDF8),
    builder: () => const OrbitPulseDemo(),
    sourceCode: orbitPulseCode,
  ),
];
