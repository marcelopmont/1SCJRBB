import 'package:example_blocs/data/http/http_client.dart';
import 'package:example_blocs/data/http/http_error.dart';
import 'package:example_blocs/data/usecases/movies/models/movie_model.dart';
import 'package:example_blocs/domain/entities/movie_entity.dart';
import 'package:example_blocs/domain/usecases/movies/fetch_movies.dart';
import 'package:example_blocs/domain/utils/domain_error.dart';

class RemoteFetchMovies extends FetchMovies {
  RemoteFetchMovies({
    required this.httpClient,
  });

  final HttpClient httpClient;

  @override
  Future<List<MovieEntity>> execute() async {
    try {
      final response =
          await httpClient.get(url: 'https://demo7206081.mockable.io/movies');

      final moviesList = response?['results']
          .map<MovieEntity>((json) => MovieModel.fromJson(json).toEntity())
          .toList();

      return moviesList ?? [];
    } on HttpError catch (error) {
      if (error == HttpError.forbidden || error == HttpError.unauthorized) {
        throw DomainError.invalidCredentials;
      } else {
        throw DomainError.unexpected;
      }
    }
  }
}
