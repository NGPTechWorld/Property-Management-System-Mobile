import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A widget that applies a vibration effect to its child.
///
/// This widget animates its child with a vibration effect when clicked and [condition] is true.
/// The vibration strength and duration can be controlled via parameters.
class VibrationWidget extends StatefulWidget {
  /// The child widget to which the vibration effect will be applied.
  final Widget child;

  /// A function that determines whether the vibration should occur when the widget is tapped.
  final bool Function() condition;

  /// The strength of the vibration, represented as the maximum offset in pixels.
  /// Default value is 5.0.
  final double strength;

  /// The duration of the vibration effect in milliseconds.
  /// Default value is 500 milliseconds.
  final int durationInMilliseconds;

  /// The number of vibrations per second.
  /// Default value is 10.
  final int vibrationsPerSecond;

  /// Callback function that will be called when the widget is tapped.
  /// This is optional and can be used to perform additional actions on tap.
  final VoidCallback? onTap;

  const VibrationWidget({
    Key? key,
    required this.child,
    required this.condition,
    this.strength = 5.0,
    this.durationInMilliseconds = 500,
    this.vibrationsPerSecond = 10,
    this.onTap,
  }) : super(key: key);

  @override
  State<VibrationWidget> createState() => _VibrationWidgetState();
}

class _VibrationWidgetState extends State<VibrationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isVibrating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationInMilliseconds),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isVibrating = false;
        });
      }
    });
  }

  @override
  void didUpdateWidget(VibrationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update duration if it changed
    if (oldWidget.durationInMilliseconds != widget.durationInMilliseconds) {
      _controller.duration = Duration(milliseconds: widget.durationInMilliseconds);
    }
  }

  void _handleTap() {
    // Call the onTap callback if provided
    widget.onTap?.call();
    log("is vibrating");

    // Check the condition before vibrating
    if (widget.condition()) {
      setState(() {
        _isVibrating = true;
      });
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: _isVibrating
          ? AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final sinValue = math.sin(widget.vibrationsPerSecond * 2 * math.pi * _controller.value);
                final offset = sinValue * widget.strength;

                return Transform.translate(
                  offset: Offset(offset, 0),
                  child: child,
                );
              },
              child: widget.child,
            )
          : widget.child,
    );
  }
}
