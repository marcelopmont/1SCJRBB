import 'package:example_blocs/main/factories/pages/cadastrar/cadastrar_presenter_factory.dart';
import 'package:example_blocs/main/factories/pages/login/login_presenter_factory.dart';
import 'package:example_blocs/ui/cadastro/login_screen.dart';
import 'package:example_blocs/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

Widget makeCadastrarScreen() =>
    CadastrarScreen(presenter: makeCadastrarPresenter());
