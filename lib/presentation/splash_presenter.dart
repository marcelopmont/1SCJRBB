import 'package:example_blocs/data/usecases/auth/remote_login_with_email.dart';
import 'package:example_blocs/domain/usecases/auth/login_with_email.dart';
import 'package:example_blocs/domain/usecases/auth/register_with_email.dart';
import 'package:example_blocs/main/factories/usecases/auth/remote_login_with_email_factory.dart';
import 'package:example_blocs/ui/criptos/criptos_screen.dart';
import 'package:example_blocs/ui/login/login_screen.dart';
import 'package:example_blocs/ui/movies/movies_screen.dart';
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
