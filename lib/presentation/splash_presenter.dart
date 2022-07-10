import 'package:favorites_cryptos/data/usecases/auth/remote_login_with_email.dart';
import 'package:favorites_cryptos/main/factories/usecases/auth/remote_login_with_email_factory.dart';
import 'package:favorites_cryptos/ui/criptos/criptos_screen.dart';
import 'package:favorites_cryptos/ui/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashPresenter extends GetxController {
  void verificaLogin() {
    RemoteLoginWithEmail user = makeRemoteLoginWithEmail();
    user.firebaseAuth.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Get.offNamed(LoginScreen.id);
      } else {
        Get.offNamed(CriptosScreen.id);
        print('User is signed in!');
      }
    });
  }
}
