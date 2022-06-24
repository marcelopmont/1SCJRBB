import 'package:favorites_cryptos/data/http/http_error.dart';
import 'package:favorites_cryptos/infra/http/http_adapter.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements Client {
  ClientMock() {
    mockGet(200);
  }

  void mockGet(int statusCode, {String body = '{"any_key":"any_value"}'}) =>
      when(() => this.get(any()))
          .thenAnswer((_) async => Response(body, statusCode));
  void mockGetError() => when(() => this.get(any())).thenThrow(Exception());
}

void main() {
  late HttpAdapter sut;
  late ClientMock client;
  late String url;

  setUp(() {
    client = ClientMock();
    sut = HttpAdapter(client: client);
  });

  setUpAll(() {
    url = faker.internet.httpUrl();
    registerFallbackValue(Uri.parse(url));
  });

  test('Should call get with correct values', () async {
    await sut.get(url: url);
    verify(
          () => client.get(
        Uri.parse(url),
      ),
    );
  });

  //TODO: Arrumar teste
/*  test('Should return data if get returns 200', () async {
    final response = await sut.get(url: url);

    expect(response, {'any_key': 'any_value'});
  });*/

  test('Should return null if get returns 200 with no data', () async {
    client.mockGet(200, body: '');

    final response = await sut.get(url: url);

    expect(response, null);
  });

  test('Should return null if get returns 204', () async {
    client.mockGet(204);

    final response = await sut.get(url: url);

    expect(response, null);
  });

  test('Should return BadRequestError if get returns 400', () async {
    client.mockGet(400);

    final future = sut.get(url: url);

    expect(future, throwsA(HttpError.badRequest));
  });

  test('Should return UnauthorizedError if get returns 401', () async {
    client.mockGet(401);

    final future = sut.get(url: url);

    expect(future, throwsA(HttpError.unauthorized));
  });

  test('Should return ForbiddenError if get returns 403', () async {
    client.mockGet(403);

    final future = sut.get(url: url);

    expect(future, throwsA(HttpError.forbidden));
  });

  test('Should return NotFoundError if get returns 404', () async {
    client.mockGet(404);

    final future = sut.get(url: url);

    expect(future, throwsA(HttpError.notFound));
  });

  test('Should return ServerError if get returns 500', () async {
    client.mockGet(500);

    final future = sut.get(url: url);

    expect(future, throwsA(HttpError.serverError));
  });

  test('Should return ServerError if get throws', () async {
    client.mockGetError();

    final future = sut.get(url: url);

    expect(future, throwsA(HttpError.serverError));
  });
}
