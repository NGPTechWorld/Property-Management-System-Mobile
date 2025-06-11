
import 'package:flutter/material.dart';
import 'dart:math' as math;

class EmptyStateScreen extends StatefulWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final Color textColor;

  const EmptyStateScreen({
    super.key,
    this.title = 'Nothing here',
    this.message = 'No items found. Try adding some!',
    this.icon = Icons.inbox_rounded,
    this.iconColor = Colors.blueGrey,
    this.textColor = Colors.blueGrey,
  });

  @override
  _EmptyStateScreenState createState() => _EmptyStateScreenState();
}

class _EmptyStateScreenState extends State<EmptyStateScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _scaleAnimation;
  
  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    
    _bounceAnimation = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    
    _rotateAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
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
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Icon
                Transform.translate(
                  offset: Offset(0, -_bounceAnimation.value),
                  child: Transform.rotate(
                    angle: _rotateAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Icon(
                        widget.icon,
                        size: 100,
                        color: widget.iconColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                
                // Texts with fade effect
                Opacity(
                  opacity: 0.7 + (_controller.value * 0.3),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: widget.textColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    widget.message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: widget.textColor.withOpacity(0.7),
                    ),
                  ),
                ),
                
                // Shimmer effect at the bottom
                const SizedBox(height: 60),
                ShimmerDots(color: widget.iconColor),
              ],
            );
          },
        ),
      ),
    );
  }
}

// A custom shimmer dots animation
class ShimmerDots extends StatefulWidget {
  final Color color;
  
  const ShimmerDots({super.key, required this.color});

  @override
  _ShimmerDotsState createState() => _ShimmerDotsState();
}

class _ShimmerDotsState extends State<ShimmerDots> with SingleTickerProviderStateMixin {
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
        final opacity = math.sin(progress * math.pi);
        
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: widget.color.withOpacity(opacity),
            shape: BoxShape.circle,
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