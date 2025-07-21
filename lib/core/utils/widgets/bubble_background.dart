import 'package:flutter/material.dart';

import 'dart:math';

class Bubble {
  Offset position;
  double radius;
  double speed;

  Bubble(this.position, this.radius, this.speed);
}

class BubblePainter extends CustomPainter {
  final List<Bubble> bubbles;
  final double progress;

  BubblePainter(this.bubbles, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue.withOpacity(0.1);
    for (var bubble in bubbles) {
      final dy = bubble.position.dy - (progress * bubble.speed * size.height);
      canvas.drawCircle(
        Offset(bubble.position.dx, dy % size.height),
        bubble.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant BubblePainter oldDelegate) => true;
}

class BubbleBackground extends StatefulWidget {
  const BubbleBackground({super.key});

  @override
  State<BubbleBackground> createState() => _BubbleBackgroundState();
}

class _BubbleBackgroundState extends State<BubbleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Bubble> _bubbles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    final random = Random();
    _bubbles = List.generate(
      20,
      (index) => Bubble(
        Offset(random.nextDouble() * 400, random.nextDouble() * 800),
        random.nextDouble() * 20 + 5,
        random.nextDouble() * 0.5 + 0.2,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return CustomPaint(
          size: Size.infinite,
          painter: BubblePainter(_bubbles, _controller.value),
        );
      },
    );
  }
}
