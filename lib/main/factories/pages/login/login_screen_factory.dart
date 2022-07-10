import 'package:favorites_cryptos/main/factories/pages/login/login_presenter_factory.dart';
import 'package:favorites_cryptos/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

Widget makeLoginScreen() => LoginScreen(presenter: makeLoginPresenter());