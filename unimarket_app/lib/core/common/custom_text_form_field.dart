import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  void validator;
  final int? maxLines;

  CustomTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      this.validator,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          labelText: label),
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: maxLines,
      // validator: validator,
    );
  }
}
