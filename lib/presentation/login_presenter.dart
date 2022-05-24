import 'package:example_blocs/domain/usecases/auth/login_with_email.dart';
import 'package:example_blocs/domain/usecases/auth/register_with_email.dart';
import 'package:example_blocs/ui/movies/movies_screen.dart';
import 'package:get/get.dart';

class LoginPresenter {
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

  void onLoginButtonPressed() async {
    var user = await loginWithEmail.execute(userEmail, userPassword);
    user ??= await registerWithEmail.execute(userEmail, userPassword);
    if (user == null) {
      // show error message
    } else {
      Get.offNamed(MoviesScreen.id);
    }
  }
}
