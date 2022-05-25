import 'package:example_blocs/domain/entities/movie_entity.dart';
import 'package:example_blocs/domain/usecases/movies/fetch_movies.dart';
import 'package:example_blocs/domain/utils/domain_error.dart';
import 'package:get/get.dart';

class MoviesPresenter extends GetxController {
  MoviesPresenter({required this.fetchMovies});

  final FetchMovies fetchMovies;

  Rx<List<MovieEntity>> moviesList = Rx<List<MovieEntity>>([]);
  RxString errorMessage = RxString('');

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
}
