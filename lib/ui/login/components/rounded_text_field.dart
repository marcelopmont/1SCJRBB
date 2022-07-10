import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key? key,
    required this.onTextChanged,
    this.hint = '',
  }) : super (key: key);

  final String hint;
  final Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onTextChanged,
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
    );
  }
}
