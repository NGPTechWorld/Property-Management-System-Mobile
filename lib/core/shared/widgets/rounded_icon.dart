
import 'package:flutter/material.dart';

import '../../utils/constants/app_numbers.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    super.key,
    required this.icon,
    required this.callback,
  });

  final IconData icon;
  final GestureTapCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: TextButton(
        style: TextButton.styleFrom(
          // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: callback,
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
