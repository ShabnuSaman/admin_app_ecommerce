import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixIcon,
    required this.obscureText,
    required this.validator,
  });
  final TextEditingController controller;

  final String hintText;
  final IconData suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          suffixIcon: Icon(suffixIcon)),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
