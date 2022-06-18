import 'package:example_blocs/presentation/login_presenter.dart';
import 'package:example_blocs/ui/criptos/criptos_screen.dart';
import 'package:example_blocs/ui/login/components/rounded_button.dart';
import 'package:example_blocs/ui/login/components/rounded_text_field.dart';
import 'package:example_blocs/ui/movies/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';
  const LoginScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final LoginPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: presenter,
      builder: (controller) => Scaffold(
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
                const SizedBox(height: 32.0),
                RoundedButton(
                  text: 'Entrar',
                  // onPressed: presenter.onLoginButtonPressed,
                  onPressed: () => verificaDadosLogin(context),
                ),
                const SizedBox(height: 32.0),
                RoundedButton(
                  text: 'Cadastrar',
                  onPressed: presenter.onCadastrarButtonPressed,
                ),
                // verificaDadosLogin(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  verificaDadosLogin(context) async {
    if (await presenter.onLoginButtonPressed()) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect login!!!!'),
        ),
      );
    } else {
      Get.offNamed(CriptosScreen.id);
    }
  }
}
