import 'package:example_blocs/main/factories/usecases/movies/remote_fetch_movies_factory.dart';
import 'package:example_blocs/presentation/movies_presenter.dart';

MoviesPresenter makeMoviesPresenter() => MoviesPresenter(
      fetchMovies: makeRemoteFetchMovies(),
    );
