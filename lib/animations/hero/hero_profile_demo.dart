import 'package:flutter/material.dart';

class HeroProfileDemo extends StatelessWidget {
  const HeroProfileDemo({super.key});

  static const _heroTag = 'hero_profile_demo_avatar';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const _HeroProfileDetailPage(),
            ),
          );
        },
        child: Container(
          width: 220,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Hero(
                tag: _heroTag,
                child: _HeroAvatar(size: 96),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tap to expand',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Hero animates the same element across routes.',
                style: TextStyle(color: Colors.white.withOpacity(0.65)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroProfileDetailPage extends StatelessWidget {
  const _HeroProfileDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Hero(
                  tag: HeroProfileDemo._heroTag,
                  child: _HeroAvatar(size: 180),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Expanded Hero',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'The shared widget travels from the compact card into a detail route.',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
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
    );
  }
}

class _HeroAvatar extends StatelessWidget {
  final double size;

  const _HeroAvatar({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF22D3EE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C3AED).withOpacity(0.35),
            blurRadius: 24,
          ),
        ],
      ),
      child: Icon(
        Icons.person_rounded,
        size: size * 0.52,
        color: Colors.white,
      ),
    );
  }
}

const heroProfileCode = r'''
Hero(
  tag: 'hero_profile_demo_avatar',
  child: const HeroAvatar(size: 96),
)

Navigator.of(context).push(
  MaterialPageRoute(builder: (_) => const HeroProfileDetailPage()),
)''';
