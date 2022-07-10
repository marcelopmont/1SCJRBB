import 'package:favorites_cryptos/main/factories/pages/cadastrar/cadastrar_presenter_factory.dart';
import 'package:favorites_cryptos/ui/cadastro/login_screen.dart';
import 'package:flutter/material.dart';

Widget makeCadastrarScreen() =>
    CadastrarScreen(presenter: makeCadastrarPresenter());
