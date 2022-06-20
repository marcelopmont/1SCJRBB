import 'package:example_blocs/domain/usecases/auth/register_with_email.dart';
import 'package:example_blocs/ui/login/login_screen.dart';
import 'package:example_blocs/ui/movies/movies_screen.dart';
import 'package:get/get.dart';

class CadastrarPresenter extends GetxController {
  CadastrarPresenter({
    required this.registerWithEmail,
  });

  RegisterWithEmail registerWithEmail;

  var userEmail = '';
  var userPassword = '';
  var userPassword2 = '';

  void onUserEmailUpdate(String email) {
    userEmail = email;
  }

  void onPasswordUpdate(String password) {
    userPassword = password;
  }

  void onPassword2Update(String password) {
    userPassword2 = password;
  }

  void onCadastrarButtonPressed() async {
    var user = await registerWithEmail.execute(userEmail, userPassword);
    if (user == null) {
      // show error message
    } else {
      Get.offNamed(MoviesScreen.id);
    }
  }

  void onLoginrButtonPressed() async {
    Get.offNamed(LoginScreen.id);
  }
}
