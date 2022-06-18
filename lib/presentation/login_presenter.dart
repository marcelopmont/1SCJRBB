import 'package:example_blocs/domain/usecases/auth/login_with_email.dart';
import 'package:example_blocs/domain/usecases/auth/register_with_email.dart';
import 'package:example_blocs/ui/cadastro/login_screen.dart';
import 'package:example_blocs/ui/login/login_screen.dart';
import 'package:example_blocs/ui/movies/movies_screen.dart';
import 'package:get/get.dart';

class LoginPresenter extends GetxController {
  LoginPresenter({
    required this.loginWithEmail,
    required this.registerWithEmail,
  });

  LoginWithEmail loginWithEmail;
  RegisterWithEmail registerWithEmail;

  var userEmail = '';
  var userPassword = '';

  void onUserEmailUpdate(String email) {
    userEmail = email;
  }

  void onPasswordUpdate(String password) {
    userPassword = password;
  }

  Future<bool> onLoginButtonPressed() async {
    var user = await loginWithEmail.execute(userEmail, userPassword);
    // user ??= await registerWithEmail.execute(userEmail, userPassword);
    return user == null;
    // if (user == null) {
    //   // show error message
    //   return true;
    //   // update();
    // } else {
    //   Get.offNamed(MoviesScreen.id);
    // }
  }

  void onCadastrarButtonPressed() async {
    // var user = await registerWithEmail.execute(userEmail, userPassword);
    // return user == null;
    Get.offNamed(CadastrarScreen.id);
  }
}
