import 'dart:convert';

import 'package:example_blocs/data/http/http_client.dart';
import 'package:example_blocs/data/http/http_error.dart';
import 'package:http/http.dart';

class HttpAdapter extends HttpClient {
  HttpAdapter({required this.client});

  final Client client;

  @override
  Future<Map<String, dynamic>?> get({required String url}) async {
    var response = Response('', 500);
    try {
      final uri = Uri.parse('https://demo7206081.mockable.io/movies');
      response = await client.get(uri).timeout(
        const Duration(seconds: 10),
      );
    } catch (error) {
      throw HttpError.serverError;
    }
    switch(response.statusCode) {
      case 200: return response.body.isNotEmpty ? jsonDecode(response.body) : null;
      case 204: return null;
      case 400: throw HttpError.badRequest;
      case 401: throw HttpError.unauthorized;
      case 403: throw HttpError.forbidden;
      case 404: throw HttpError.notFound;
    }

  }

}