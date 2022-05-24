import 'package:example_blocs/main/factories/pages/login_presenter_factory.dart';
import 'package:example_blocs/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

Widget makeLoginScreen() => LoginScreen(presenter: makeLoginPresenter());