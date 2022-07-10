import 'package:favorites_cryptos/main/factories/usecases/auth/remote_login_with_email_factory.dart';
import 'package:favorites_cryptos/main/factories/usecases/auth/remote_register_with_email.dart';
import 'package:favorites_cryptos/presentation/login_presenter.dart';

LoginPresenter makeLoginPresenter() => LoginPresenter(
      loginWithEmail: makeRemoteLoginWithEmail(),
      registerWithEmail: makeRemoteRegisterWithEmail(),
    );
