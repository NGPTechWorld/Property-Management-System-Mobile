import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key, required this.index, required this.length}) : assert(index < length);

  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (i) {
          return Row(
            children: [
              Container(
                width: 24,
                height: 8,
                decoration: BoxDecoration(
                  color: i == index ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              if (i != length - 1) const SizedBox(width: 8),
            ],
          );
        },
      ),
    );
  }
}
