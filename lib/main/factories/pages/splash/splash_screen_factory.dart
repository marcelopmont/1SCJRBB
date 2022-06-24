import 'package:favorites_cryptos/main/factories/pages/splash/splash_presenter_factory.dart';
import 'package:favorites_cryptos/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Widget makeSplashScreen() => SplashScreen(presenter: makeSplashPresenter());
