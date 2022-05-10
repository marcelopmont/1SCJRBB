import 'package:example_blocs/screens/counter/counter_screen.dart';
import 'package:example_blocs/screens/dice/dice_screen.dart';
import 'package:example_blocs/screens/login/login_screen.dart';
import 'package:example_blocs/screens/menu/menu_screen.dart';
import 'package:example_blocs/screens/movies/movies_screen.dart';
import 'package:example_blocs/screens/personal_card/personal_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        LoginScreen.id: (context) => const LoginScreen(),
        MenuScreen.id: (context) => const MenuScreen(),
        CounterScreen.id: (context) => const CounterScreen(),
        DiceScreen.id: (context) => const DiceScreen(),
        MoviesScreen.id: (context) => const MoviesScreen(),
        PersonalCardScreen.id: (context) => PersonalCardScreen(
              arguments: ModalRoute.of(context)?.settings.arguments as PersonalCardScreenArguments,
            ),
      },
    );
  }
}
