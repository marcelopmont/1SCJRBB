import 'dart:convert';

import 'package:favorites_cryptos/data/http/http_client.dart';
import 'package:favorites_cryptos/data/http/http_error.dart';
import 'package:http/http.dart';

class HttpAdapter extends HttpClient {
  HttpAdapter({required this.client});

  final Client client;

  @override
  Future<Map<String, dynamic>?> get({required String url}) async {
    var response = Response('', 500);
    try {
      final uri = Uri.parse(url);
      response = await client.get(uri).timeout(
            const Duration(seconds: 10),
          );
    } catch (error) {
      throw HttpError.serverError;
    }
    switch (response.statusCode) {
      case 200:
        // var cripto =
        //     '{"criptos" :[{"price": "104730.66256647","id": "BTC","currency": "BTC","symbol": "BTC","name": "Bitcoin","logo_url": "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg","rank": "1"},{"price": "5545.33127021","id": "ETH","currency": "ETH","symbol": "ETH","name": "Ethereum","logo_url": "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/eth.svg","rank": "2"},{"price": "1.64820144","id": "XRP","name": "XRP","logo_url": "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/XRP.svg","rank": "8"}]}';
        // return response.body.isNotEmpty ? jsonDecode(cripto) : null;
        var jsonCriptos = '{"criptos" : ${response.body} }';
        return response.body.isNotEmpty ? jsonDecode(jsonCriptos) : null;
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      case 500:
        throw HttpError.serverError;
    }
  }
}
