import 'package:flutter/material.dart';
import 'dart:math' as math;

class CoolLoadingScreen extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final String loadingText;

  const CoolLoadingScreen({
    super.key,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.lightBlue,
    this.backgroundColor = Colors.white,
    this.loadingText = 'جاري التحميل',
  });

  @override
  _CoolLoadingScreenState createState() => _CoolLoadingScreenState();
}

class _CoolLoadingScreenState extends State<CoolLoadingScreen> with TickerProviderStateMixin {
  late AnimationController _orbitController;
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  late AnimationController _textController;

  final List<Particle> _particles = [];
  final int _particleCount = 12;
  final double _particleSize = 8.0;

  @override
  void initState() {
    super.initState();

    // Main orbit animation
    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat();
    // Pulsing animation
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // Rotation animation
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Text animation
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    // Initialize particles
    _initializeParticles();
  }

  void _initializeParticles() {
    for (int i = 0; i < _particleCount; i++) {
      final angle = (i / _particleCount) * 2 * math.pi;
      final distance = 70.0 + (i % 3) * 30.0;
      final speed = 0.5 + (math.Random().nextDouble() * 1.0);
      final size = _particleSize - (i % 3) * 2.0;

      _particles.add(Particle(
        angle: angle,
        distance: distance,
        speed: speed,
        size: size,
      ));
    }
  }

  @override
  void dispose() {
    _orbitController.dispose();
    _pulseController.dispose();
    _rotationController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Rotating background glow
              AnimatedBuilder(
                animation: _rotationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationController.value * 2 * math.pi,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            widget.primaryColor.withOpacity(0.1),
                            widget.backgroundColor.withOpacity(0.01),
                          ],
                          stops: const [0.2, 1.0],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Orbiting particles
              // AnimatedBuilder(
              //   animation: _orbitController,
              //   builder: (context, child) {
              //     return CustomPaint(
              //       size: const Size(300, 300),
              //       painter: ParticlePainter(
              //         particles: _particles,
              //         animationValue: _orbitController.value,
              //         primaryColor: widget.primaryColor,
              //         secondaryColor: widget.secondaryColor,
              //       ),
              //     );
              //   },
              // ),

              // Center pulsing circle
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Container(
                    width: 50 + (_pulseController.value * 10),
                    height: 50 + (_pulseController.value * 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.primaryColor.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          color: widget.primaryColor.withOpacity(0.3),
                          blurRadius: 20 + (_pulseController.value * 10),
                          spreadRadius: 5 + (_pulseController.value * 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.rocket_launch_rounded,
                        color: Colors.white,
                        size: 24 + (_pulseController.value * 6),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          // Loading text with animation
          AnimatedBuilder(
            animation: _textController,
            builder: (context, child) {
              return Opacity(
                opacity: 0.7 + (_textController.value * 0.3),
                child: Text(
                  widget.loadingText,
                  style: TextStyle(
                    color: widget.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 32,
          ),
          // Loading progress dots
          LoadingDots(
            color: widget.primaryColor,
          ),
        ],
      ),
    );
  }
}

class Particle {
  final double angle;
  final double distance;
  final double speed;
  final double size;

  Particle({
    required this.angle,
    required this.distance,
    required this.speed,
    required this.size,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;
  final Color primaryColor;
  final Color secondaryColor;

  ParticlePainter({
    required this.particles,
    required this.animationValue,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < particles.length; i++) {
      final particle = particles[i];

      // Calculate position based on angle, distance and animation
      final angle = particle.angle + (animationValue * particle.speed * 2 * math.pi) % (2 * math.pi);
      final x = center.dx + math.cos(angle) * particle.distance;
      final y = center.dy + math.sin(angle) * particle.distance;

      // Alternate between primary and secondary colors
      final color = i % 2 == 0 ? primaryColor : secondaryColor;

      // Draw particle with glow effect
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      // Glow effect
      final glowPaint = Paint()
        ..color = color.withOpacity(0.3)
        ..style = PaintingStyle.fill
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      canvas.drawCircle(Offset(x, y), particle.size + 3, glowPaint);
      canvas.drawCircle(Offset(x, y), particle.size, paint);

      // Draw tail for some particles
      if (i % 3 == 0) {
        final tailPaint = Paint()
          ..color = color.withOpacity(0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

        final path = Path();
        path.moveTo(x, y);

        final tailLength = 20.0;
        final tailX = x - math.cos(angle) * tailLength;
        final tailY = y - math.sin(angle) * tailLength;

        path.lineTo(tailX, tailY);
        canvas.drawPath(path, tailPaint);
      }
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}

class LoadingDots extends StatefulWidget {
  final Color color;

  const LoadingDots({super.key, required this.color});

  @override
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(double delay) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = (_controller.value + delay) % 1.0;
        final y = math.sin(progress * math.pi) * 8;

        return Transform.translate(
          offset: Offset(0, -y),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: widget.color.withOpacity(0.7 + (progress * 0.3)),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(0.0),
        _buildDot(0.2),
        _buildDot(0.4),
      ],
    );
  }
}
