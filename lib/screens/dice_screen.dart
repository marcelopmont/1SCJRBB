import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  static const String id = 'dice';

  const DiceScreen({Key? key}) : super(key: key);

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int dice1 = 5;
  int dice2 = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: throwDices,
                child: Image.asset('assets/images/dice$dice1.png'),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: throwDices,
                child: Image.asset('assets/images/dice$dice2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void throwDices() {
    final random = Random();
    setState(() {
      dice1 = random.nextInt(6) + 1;
      dice2 = random.nextInt(6) + 1;
    });
  }
}
