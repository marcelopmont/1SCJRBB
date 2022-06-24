import 'package:favorites_cryptos/main/factories/pages/cadastrar/cadastrar_screen_factory.dart';
import 'package:favorites_cryptos/main/factories/pages/criptos/criptos_screen_factory.dart';
import 'package:favorites_cryptos/main/factories/pages/login/login_screen_factory.dart';
import 'package:favorites_cryptos/main/factories/pages/splash/splash_screen_factory.dart';
import 'package:favorites_cryptos/ui/cadastro/login_screen.dart';
import 'package:favorites_cryptos/ui/criptos/criptos_screen.dart';
import 'package:favorites_cryptos/ui/login/login_screen.dart';
import 'package:favorites_cryptos/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Favorites Cryptos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.id,
      getPages: [
        GetPage(name: LoginScreen.id, page: makeLoginScreen),
        GetPage(name: SplashScreen.id, page: makeSplashScreen),
        GetPage(name: CriptosScreen.id, page: makeCriptosScreen),
        GetPage(name: CadastrarScreen.id, page: makeCadastrarScreen),
      ],
    );
  }
}
