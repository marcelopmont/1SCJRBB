import 'package:example_blocs/presentation/cadastrar_presenter.dart';
import 'package:example_blocs/ui/login/components/rounded_button.dart';
import 'package:example_blocs/ui/login/components/rounded_text_field.dart';
import 'package:flutter/material.dart';

class CadastrarScreen extends StatelessWidget {
  static const String id = '/cadastrar';

  const CadastrarScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final CadastrarPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedTextField(
                hint: 'Email',
                onTextChanged: presenter.onUserEmailUpdate,
              ),
              const SizedBox(height: 16),
              RoundedTextField(
                hint: 'Senha',
                onTextChanged: presenter.onPasswordUpdate,
              ),
              const SizedBox(height: 16),
              RoundedTextField(
                hint: 'Contra Senha',
                onTextChanged: presenter.onPassword2Update,
              ),
              const SizedBox(height: 32.0),
              RoundedButton(
                text: 'Cadastrar',
                onPressed: presenter.onCadastrarButtonPressed,
              ),
              const SizedBox(height: 32.0),
              RoundedButton(
                text: 'Entrar',
                onPressed: presenter.onLoginrButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
