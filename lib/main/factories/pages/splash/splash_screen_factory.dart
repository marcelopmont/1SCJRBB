import 'package:example_blocs/main/factories/pages/login/login_presenter_factory.dart';
import 'package:example_blocs/main/factories/pages/splash/splash_presenter_factory.dart';
import 'package:example_blocs/ui/login/login_screen.dart';
import 'package:example_blocs/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Widget makeSplashScreen() => SplashScreen(presenter: makeSplashPresenter());
