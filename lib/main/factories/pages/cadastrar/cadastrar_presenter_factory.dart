import 'package:favorites_cryptos/main/factories/usecases/auth/remote_register_with_email.dart';
import 'package:favorites_cryptos/presentation/cadastrar_presenter.dart';

CadastrarPresenter makeCadastrarPresenter() => CadastrarPresenter(
      registerWithEmail: makeRemoteRegisterWithEmail(),
    );
