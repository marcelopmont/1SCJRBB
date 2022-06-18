import 'package:example_blocs/data/http/http_client.dart';
import 'package:example_blocs/data/http/http_error.dart';
import 'package:example_blocs/domain/utils/domain_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientMock extends Mock implements HttpClient {
  // HttpClientMock() {
  //   mockGet(_getResponseJson());
  // }

  // void mockGet(Map<String, dynamic>? response) =>
  //     when(() => get(url: 'https://demo7206081.mockable.io/movies'))
  //         .thenAnswer((_) async => response);

  void mockGetError(HttpError error) => when(() => get(
        url: 'https://demo7206081.mockable.io/movies',
      )).thenThrow(error);
}

void main() {
  // late RemoteFetchMovies sut;
  late HttpClientMock httpClient;

  // setUp(() {
  //   httpClient = HttpClientMock();
  //   sut = RemoteFetchMovies(httpClient: httpClient);
  // });

  // test('Should call httpClient get with correct values', () async {
  //   await sut.execute();
  //   verify(() => httpClient.get(url: 'https://demo7206081.mockable.io/movies'));
  // });

  // test('Should return movies list if client returns correct json', () async {
  //   final response = await sut.execute();
  //
  //   expect(
  //       response[0].name, _getResponseJson()['results'][0]['original_title']);
  //   expect(response[0].rating,
  //       _getResponseJson()['results'][0]['vote_average'].toString());
  //   expect(
  //       response[0].description, _getResponseJson()['results'][0]['overview']);
  //   expect(response[0].image, _getResponseJson()['results'][0]['poster_path']);
  // });

  // test('Should return empty array if client returns null', () async {
  //   httpClient.mockGet(null);
  //
  //   final response = await sut.execute();
  //
  //   expect(response, []);
  // });

  // test('Should return InvalidCredential if client return forbidden', () async {
  //   httpClient.mockGetError(HttpError.forbidden);
  //
  //   final future = sut.execute();
  //
  //   expect(future, throwsA(DomainError.invalidCredentials));
  // });

//   test('Should return InvalidCredential if client return unauthorized',
//       () async {
//     httpClient.mockGetError(HttpError.unauthorized);
//
//     final future = sut.execute();
//
//     expect(future, throwsA(DomainError.invalidCredentials));
//   });
//
//   test('Should return unexpected if client return badRequest', () async {
//     httpClient.mockGetError(HttpError.badRequest);
//
//     final future = sut.execute();
//
//     expect(future, throwsA(DomainError.unexpected));
//   });
// }
//
// Map<String, dynamic> _getResponseJson() => {
//       "page": 1,
//       "results": [
//         {
//           "adult": false,
//           "backdrop_path": "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
//           "genre_ids": [28, 12, 878],
//           "id": 634649,
//           "original_language": "en",
//           "original_title": "Spider-Man: No Way Home",
//           "overview":
//               "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
//           "popularity": 7902.493,
//           "poster_path":
//               "https://terrigen-cdn-dev.marvel.com/content/prod/1x/snh_online_6072x9000_posed_01.jpg",
//           "release_date": "2021-12-15",
//           "title": "Spider-Man: No Way Home",
//           "video": false,
//           "vote_average": 8.4,
//           "vote_count": 7810
//         },
//         {
//           "adult": false,
//           "backdrop_path": "/6qkeXdIEwqOuOWuxsomwnin2RdD.jpg",
//           "genre_ids": [28, 12, 53, 10752],
//           "id": 476669,
//           "original_language": "en",
//           "original_title": "The King's Man",
//           "overview":
//               "As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them.",
//           "popularity": 4961.342,
//           "poster_path":
//               "https://lumiere-a.akamaihd.net/v1/images/p_thekingsman_20cs_21755_cfc5bbe6.jpeg",
//           "release_date": "2021-12-22",
//           "title": "The King's Man",
//           "video": false,
//           "vote_average": 7.2,
//           "vote_count": 942
//         },
//         {
//           "adult": false,
//           "backdrop_path": "/3G1Q5xF40HkUBJXxt2DQgQzKTp5.jpg",
//           "genre_ids": [16, 35, 10751, 14],
//           "id": 568124,
//           "original_language": "en",
//           "original_title": "Encanto",
//           "overview":
//               "The tale of an extraordinary family, the Madrigals, who live hidden in the mountains of Colombia, in a magical house, in a vibrant town, in a wondrous, charmed place called an Encanto. The magic of the Encanto has blessed every child in the family with a unique gift from super strength to the power to heal—every child except one, Mirabel. But when she discovers that the magic surrounding the Encanto is in danger, Mirabel decides that she, the only ordinary Madrigal, might just be her exceptional family's last hope.",
//           "popularity": 3218.518,
//           "poster_path":
//               "https://lumiere-a.akamaihd.net/v1/images/p_encanto_homeent_22359_4892ae1c.jpeg",
//           "release_date": "2021-11-24",
//           "title": "Encanto",
//           "video": false,
//           "vote_average": 7.8,
//           "vote_count": 4351
//         },
//         {
//           "adult": false,
//           "backdrop_path": "/c6H7Z4u73ir3cIoCteuhJh7UCAR.jpg",
//           "genre_ids": [28, 12, 14, 878],
//           "id": 524434,
//           "original_language": "en",
//           "original_title": "Eternals",
//           "overview":
//               "The Eternals are a team of ancient aliens who have been living on Earth in secret for thousands of years. When an unexpected tragedy forces them out of the shadows, they are forced to reunite against mankind’s most ancient enemy, the Deviants.",
//           "popularity": 2594.929,
//           "poster_path":
//               "https://upload.wikimedia.org/wikipedia/pt/thumb/c/c9/Eternals_poster.jpg/250px-Eternals_poster.jpg",
//           "release_date": "2021-11-03",
//           "title": "Eternals",
//           "video": false,
//           "vote_average": 7.2,
//           "vote_count": 4315
//         },
//         {
//           "adult": false,
//           "backdrop_path": "/eVSa4TpyXbOdk9fXSD6OcORJGtv.jpg",
//           "genre_ids": [53],
//           "id": 803114,
//           "original_language": "en",
//           "original_title": "The Requin",
//           "overview":
//               "A couple on a romantic getaway find themselves stranded at sea when a tropical storm sweeps away their villa. In order to survive, they are forced to fight the elements, while sharks circle below.",
//           "popularity": 2499.719,
//           "poster_path":
//               "https://m.media-amazon.com/images/M/MV5BYzc4YmU5YzEtY2I3Yi00OGMxLTgzZmMtMTExNDFhMDI4NjhjXkEyXkFqcGdeQXVyMTY5Nzc4MDY@._V1_.jpg",
//           "release_date": "2022-01-28",
//           "title": "The Requin",
//           "video": false,
//           "vote_average": 4.4,
//           "vote_count": 43
//         },
//         {
//           "adult": false,
//           "backdrop_path": "/eG0oOQVsniPAuecPzDD1B1gnYWy.jpg",
//           "genre_ids": [16, 35, 12, 10751],
//           "id": 774825,
//           "original_language": "en",
//           "original_title": "The Ice Age Adventures of Buck Wild",
//           "overview":
//               "The fearless one-eyed weasel Buck teams up with mischievous possum brothers Crash & Eddie as they head off on a new adventure into Buck's home: The Dinosaur World.",
//           "popularity": 2429.532,
//           "poster_path":
//               "https://upload.wikimedia.org/wikipedia/en/thumb/0/0f/The_Ice_Age_Adventures_of_Buck_Wild.jpg/220px-The_Ice_Age_Adventures_of_Buck_Wild.jpg",
//           "release_date": "2022-01-28",
//           "title": "The Ice Age Adventures of Buck Wild",
//           "video": false,
//           "vote_average": 7.3,
//           "vote_count": 532
//         },
//         {
//           "adult": false,
//           "backdrop_path": "/qBLEWvJNVsehJkEJqIigPsWyBse.jpg",
//           "genre_ids": [16, 10751, 14, 35, 12],
//           "id": 585083,
//           "original_language": "en",
//           "original_title": "Hotel Transylvania: Transformania",
//           "overview":
//               "When Van Helsing's mysterious invention, the \"Monsterfication Ray,\" goes haywire, Drac and his monster pals are all transformed into humans, and Johnny becomes a monster. In their new mismatched bodies, Drac and Johnny must team up and race across the globe to find a cure before it's too late, and before they drive each other crazy.",
//           "popularity": 2246.531,
//           "poster_path":
//               "https://m.media-amazon.com/images/M/MV5BZWM4MzUyYTAtMGFiYy00MmRkLWIyNDktMWFlMDlmZjJmNWZmXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_FMjpg_UX1000_.jpg",
//           "release_date": "2022-01-13",
//           "title": "Hotel Transylvania: Transformania",
//           "video": false,
//           "vote_average": 7.5,
//           "vote_count": 1725
//         },
//         {
//           "adult": false,
//           "backdrop_path": "/ilty8eu65u6vCJpyMva9ele8Qtm.jpg",
//           "genre_ids": [35, 10749, 10402],
//           "id": 615904,
//           "original_language": "en",
//           "original_title": "Marry Me",
//           "overview":
//               "Explores the possibilities of what might happen when a superstar marries an average Joe as a joke and discovers that perhaps there are no accidents.",
//           "popularity": 2081.447,
//           "poster_path":
//               "https://m.media-amazon.com/images/M/MV5BMzFiMjNhMDktNmVlYy00MGE3LWJkNWItNTgyMTc5MGVlNzllXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg",
//           "release_date": "2022-02-09",
//           "title": "Marry Me",
//           "video": false,
//           "vote_average": 7.1,
//           "vote_count": 95
//         },
//         {
//           "adult": false,
//           "backdrop_path": "/8pgKccb5PfE1kWB9qqiXJem83VC.jpg",
//           "genre_ids": [28, 53],
//           "id": 522016,
//           "original_language": "en",
//           "original_title": "The 355",
//           "overview":
//               "A group of top female agents from American, British, Chinese, Columbian and German  government agencies are drawn together to try and stop an organization from acquiring a deadly weapon to send the world into chaos.",
//           "popularity": 2024.923,
//           "poster_path":
//               "https://m.media-amazon.com/images/M/MV5BNjRjMjk1MTItZGRjOC00NDhmLWExMTItY2Y4YTI2MGNmNTlkXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg",
//           "release_date": "2022-01-05",
//           "title": "The 355",
//           "video": false,
//           "vote_average": 6.1,
//           "vote_count": 215
//         }
//       ],
//       "total_pages": 32369,
//       "total_results": 647364
}
