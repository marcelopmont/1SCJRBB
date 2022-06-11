import 'package:example_blocs/data/usecases/movies/remote_fetch_movies.dart';
import 'package:example_blocs/domain/usecases/movies/fetch_movies.dart';
import 'package:example_blocs/main/factories/infra/http_adapter_factory.dart';

FetchMovies makeRemoteFetchMovies() => RemoteFetchMovies(
      httpClient: makeHttpAdapter(),
    );
