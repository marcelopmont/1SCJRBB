import 'package:example_blocs/screens/counter_screen.dart';
import 'package:example_blocs/screens/dice_screen.dart';
import 'package:example_blocs/screens/menu_screen.dart';
import 'package:example_blocs/screens/personal_card_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MenuScreen.id,
      routes: {
        MenuScreen.id: (context) => const MenuScreen(),
        CounterScreen.id: (context) => const CounterScreen(),
        DiceScreen.id: (context) => const DiceScreen(),
        PersonalCardScreen.id: (context) => PersonalCardScreen(
              arguments: ModalRoute.of(context)?.settings.arguments as PersonalCardScreenArguments,
            ),
      },
    );
  }
}
