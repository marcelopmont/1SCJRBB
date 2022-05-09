import 'dart:math';

import 'package:example_blocs/screens/dice/dice_screen.dart';
import 'package:example_blocs/screens/personal_card/personal_card_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  static const String id = 'menu';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Menu inicial',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 32),
              getMenuButton(
                text: 'Cartão Pessoal',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PersonalCardScreen.id,
                    arguments: PersonalCardScreenArguments(
                      phone: '11 99123-4567',
                      email: 'teste@gmail.com',
                    ),
                  );
                },
              ),
              getMenuButton(
                text: 'Dado',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DiceScreen.id,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getMenuButton({
    required String text,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Material(
          color: Colors.teal,
          borderRadius: const BorderRadius.all(
            Radius.circular(1000),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
