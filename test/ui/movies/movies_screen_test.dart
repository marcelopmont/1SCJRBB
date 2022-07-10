import 'package:favorites_cryptos/domain/entities/movie_entity.dart';
import 'package:favorites_cryptos/presentation/movies_presenter.dart';
import 'package:favorites_cryptos/ui/movies/movies_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MoviesPresenterMock extends Mock implements MoviesPresenter {
  @override
  final moviesList = Rx<List<MovieEntity>>([]);
  @override
  final errorMessage = RxString('');

  void emitMovies(List<MovieEntity> movies) => moviesList.value = movies;

  void emitErrorMessage(String message) => errorMessage.value = message;
}

void main() {
  late MoviesPresenterMock presenter;

  testWidgets('Should show movies list', (WidgetTester tester) async {
    presenter = MoviesPresenterMock();
    await tester.pumpWidget(
      GetMaterialApp(
        home: MoviesScreen(presenter: presenter),
      ),
    );

    presenter.emitMovies(_getMoviesList());

    await mockNetworkImagesFor(() async => await tester.pump());
    expect(find.text(_getMoviesList()[0].name), findsOneWidget);
  });
}

List<MovieEntity> _getMoviesList() => [
      MovieEntity(
        name: 'movie_name_0',
        description: 'movie_description_0',
        image: '',
        rating: 'movie_rating_0',
      ),
      MovieEntity(
        name: 'movie_name_1',
        description: 'movie_description_1',
        image: '',
        rating: 'movie_rating_1',
      ),
      MovieEntity(
        name: 'movie_name_2',
        description: 'movie_description_2',
        image: '',
        rating: 'movie_rating_2',
      ),
    ];
