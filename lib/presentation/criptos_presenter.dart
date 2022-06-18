import 'package:example_blocs/domain/entities/cripto_entity.dart';
import 'package:example_blocs/domain/usecases/criptos/fetch_criptos.dart';
import 'package:example_blocs/domain/utils/domain_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CriptosPresenter extends GetxController {
  CriptosPresenter({required this.fetchCriptos});

  final FetchCriptos fetchCriptos;

  final criptosList = Rx<List<CriptoEntity>>([]);
  final errorMessage = RxString('');

  @override
  void onInit() async {
    super.onInit();
    try {
      criptosList.value = await fetchCriptos.execute();
    } on DomainError catch (error) {
      errorMessage.value = (error == DomainError.invalidCredentials)
          ? 'Credenciais inválidas'
          : 'Erro, tente novamente';
    }
  }

  void singout() async {
    await FirebaseAuth.instance.signOut();
  }

  void setFavorite(num i) async {
    //criptosList.favorite = !criptosList[i].favorite;
    print(i);
  }
  // void onLoginButtonPressed() async {
  //   var user = await loginWithEmail.execute(userEmail, userPassword);
  //   user ??= await registerWithEmail.execute(userEmail, userPassword);
  //   if (user == null) {
  //     // show error message
  //   } else {
  //     Get.offNamed(MoviesScreen.id);
  //   }
  // }
}
