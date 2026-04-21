import 'package:flutter/material.dart';

class PageRouteParallaxDemo extends StatelessWidget {
  const PageRouteParallaxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 230,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.white10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.layers_rounded, color: Color(0xFF60A5FA), size: 34),
                SizedBox(height: 14),
                Text(
                  'Parallax Route',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Foreground and background move at different speeds during navigation.',
                  style: TextStyle(color: Colors.white70, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).push(_buildRoute()),
            icon: const Icon(Icons.swipe_rounded),
            label: const Text('Open parallax route'),
          ),
        ],
      ),
    );
  }

  PageRouteBuilder<void> _buildRoute() {
    return PageRouteBuilder<void>(
      transitionDuration: const Duration(milliseconds: 780),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const _ParallaxDestination();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final foreground = Tween<Offset>(
          begin: const Offset(0.18, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        );
        final background = Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-0.08, 0),
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut),
        );

        return Stack(
          fit: StackFit.expand,
          children: [
            SlideTransition(
              position: background,
              child: Container(color: const Color(0xFF020617)),
            ),
            FadeTransition(
              opacity: animation,
              child: SlideTransition(position: foreground, child: child),
            ),
          ],
        );
      },
    );
  }
}

class _ParallaxDestination extends StatelessWidget {
  const _ParallaxDestination();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: Stack(
        children: [
          Positioned(
            top: 80,
            right: -30,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF2563EB).withOpacity(0.16),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Container(
                width: 290,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1D4ED8), Color(0xFF7C3AED)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.view_in_ar_rounded,
                      color: Colors.white,
                      size: 52,
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Parallax Landed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'The background lags slightly behind while the page content settles in.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, height: 1.4),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: const Text('Back'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const pageRouteParallaxCode = r'''
PageRouteBuilder(
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return Stack(
      children: [
        SlideTransition(position: background, child: const BackgroundLayer()),
        SlideTransition(position: foreground, child: child),
      ],
    );
  },
)''';
