import 'package:example_blocs/data/usecases/auth/remote_login_with_email.dart';
import 'package:example_blocs/main/factories/pages/login/login_screen_factory.dart';
import 'package:example_blocs/main/factories/pages/movies/movies_screen_factory.dart';
import 'package:example_blocs/main/factories/usecases/auth/remote_login_with_email_factory.dart';
import 'package:example_blocs/presentation/splash_presenter.dart';
import 'package:example_blocs/ui/login/login_screen.dart';
import 'package:example_blocs/ui/movies/movies_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.presenter}) : super(key: key);
  static const String id = '/splash';
  final SplashPresenter presenter;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isRunning = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.presenter.verificaLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.red,
          ),
        ],
      ),
    ));
  }
}
