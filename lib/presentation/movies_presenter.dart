import 'package:favorites_cryptos/domain/entities/movie_entity.dart';
import 'package:favorites_cryptos/domain/usecases/movies/fetch_movies.dart';
import 'package:favorites_cryptos/domain/utils/domain_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MoviesPresenter extends GetxController {
  MoviesPresenter({required this.fetchMovies});

  final FetchMovies fetchMovies;

  final moviesList = Rx<List<MovieEntity>>([]);
  final errorMessage = RxString('');

  @override
  void onInit() async {
    super.onInit();
    try {
      moviesList.value = await fetchMovies.execute();
    } on DomainError catch (error) {
      errorMessage.value = (error == DomainError.invalidCredentials)
          ? 'Credenciais inválidas'
          : 'Erro, tente novamente';
    }
  }

  void singout() async {
    await FirebaseAuth.instance.signOut();
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
