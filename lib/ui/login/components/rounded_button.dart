import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        color: Theme.of(context).primaryColorLight,
        elevation: 4,
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}