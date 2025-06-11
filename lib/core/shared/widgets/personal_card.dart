import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  const PersonalCard({
    super.key,
    required this.onPressed,
    required this.title,
    required this.subtitle,
    this.color,
    this.trailing,
    this.useLeading = true,
    this.leading,
    this.useTrailing = true,
  });

  final VoidCallback onPressed;
  final String title;
  final String subtitle;
  final Color? color;
  final bool useLeading;
  final Widget? leading;
  final bool useTrailing;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      tileColor: color,
      leading: useLeading ? leading : null,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: useTrailing ? trailing : null,
    );
  }
}
