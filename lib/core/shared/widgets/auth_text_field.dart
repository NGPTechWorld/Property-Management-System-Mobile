import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.svgIconPath,
    this.controller,
    this.isObsure = false,
    this.validator,
  });
  final String label, hint, svgIconPath;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isObsure;
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      obscureText: widget.isObsure,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 64,
          minHeight: 64,
          maxWidth: 68,
          minWidth: 68,
        ),
        labelText: widget.label,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        hintText: widget.hint,
        suffixIcon:const Icon(Icons.email),
      ),
    );
  }
}
