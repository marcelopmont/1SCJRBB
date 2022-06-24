import 'package:favorites_cryptos/domain/entities/movie_entity.dart';
import 'package:favorites_cryptos/domain/usecases/movies/fetch_movies.dart';
import 'package:favorites_cryptos/domain/utils/domain_error.dart';
import 'package:favorites_cryptos/presentation/movies_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FetchMoviesMock extends Mock implements FetchMovies {
  FetchMoviesMock() {
    mockExecute(_getMoviesList());
  }

  void mockExecute(List<MovieEntity> moviesList) {
    when(() => execute()).thenAnswer((_) async => moviesList);
  }

  void mockError(DomainError error) {
    when(() => execute()).thenThrow(error);
  }
}

void main() {
  late MoviesPresenter sut;
  late FetchMoviesMock fetchMovies;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    fetchMovies = FetchMoviesMock();
    sut = MoviesPresenter(fetchMovies: fetchMovies);
  });

  test('Should call fetch movies on init', () async {
    sut.onInit();
    verify(() => fetchMovies.execute());
  });

  test(
    'Should emit movies list when fetch movies succeed',
    () async {
      sut.moviesList.listen(expectAsync1(
        (responseList) => expect(
          responseList[0].name,
          _getMoviesList()[0].name,
        ),
      ));
      sut.onInit();
    },
  );

  test(
      'Should emit credential error message list when fetch movies throw invalid credential',
      () async {
    fetchMovies.mockError(DomainError.invalidCredentials);
    sut.errorMessage.listen(
      expectAsync1(
        (errorMessage) => expect(errorMessage, 'Credenciais inválidas'),
      ),
    );
    sut.onInit();
  });

  test(
      'Should emit generic error message list when fetch movies throw unexpected',
      () async {
    fetchMovies.mockError(DomainError.unexpected);
    sut.errorMessage.listen(
      expectAsync1(
        (errorMessage) => expect(
            errorMessage, 'Erro, tente novamente'),
      ),
    );
    sut.onInit();
  });
}

List<MovieEntity> _getMoviesList() => [
      MovieEntity(
        name: 'movie_name_0',
        description: 'movie_description_0',
        image: 'movie_image_0',
        rating: 'movie_rating_0',
      ),
      MovieEntity(
        name: 'movie_name_1',
        description: 'movie_description_1',
        image: 'movie_image_1',
        rating: 'movie_rating_1',
      ),
      MovieEntity(
        name: 'movie_name_2',
        description: 'movie_description_2',
        image: 'movie_image_2',
        rating: 'movie_rating_2',
      ),
    ];
