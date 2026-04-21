import 'package:flutter/material.dart';

class AnimatedSlideDemo extends StatefulWidget {
  const AnimatedSlideDemo({super.key});

  @override
  State<AnimatedSlideDemo> createState() => _AnimatedSlideDemoState();
}

class _AnimatedSlideDemoState extends State<AnimatedSlideDemo> {
  bool _delivered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 240,
            height: 96,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white10),
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                AnimatedSlide(
                  offset: _delivered ? const Offset(1.45, 0) : Offset.zero,
                  duration: const Duration(milliseconds: 850),
                  curve: Curves.easeInOutCubic,
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      _delivered
                          ? Icons.check_rounded
                          : Icons.local_shipping_rounded,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Text(
            _delivered ? 'Delivered' : 'In transit',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 22),
          ElevatedButton.icon(
            onPressed: () => setState(() => _delivered = !_delivered),
            icon: const Icon(Icons.send_time_extension_rounded),
            label: const Text('Toggle slide'),
          ),
        ],
      ),
    );
  }
}

const animatedSlideCode = r'''
AnimatedSlide(
  offset: _delivered ? const Offset(1.45, 0) : Offset.zero,
  duration: const Duration(milliseconds: 850),
  curve: Curves.easeInOutCubic,
  child: const DeliveryChip(),
)''';
