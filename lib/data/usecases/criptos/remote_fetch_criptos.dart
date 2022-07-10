import 'package:favorites_cryptos/data/http/http_client.dart';
import 'package:favorites_cryptos/data/http/http_error.dart';
import 'package:favorites_cryptos/data/usecases/criptos/models/cripto_model.dart';
import 'package:favorites_cryptos/domain/entities/cripto_entity.dart';
import 'package:favorites_cryptos/domain/usecases/criptos/fetch_criptos.dart';
import 'package:favorites_cryptos/domain/utils/domain_error.dart';

class RemoteFetchCripto extends FetchCriptos {
  RemoteFetchCripto({
    required this.httpClient,
  });

  final HttpClient httpClient;

  @override
  Future<List<CriptoEntity>> execute() async {
    try {
      final response = await httpClient.get(
          url:
              'https://api.nomics.com/v1/currencies/ticker?key=ae7b22576f7d72495741259bd9620b36f256789b&ids=BTC,ETH,USDT,USDC,BNB,BUSD,ADA,XRP,SOL, DOGE,DOT,DAI&interval=1d&convert=BRL');

      final criptosList = response?['criptos']
          .map<CriptoEntity>((json) => CriptoModel.fromJson(json).toEntity())
          .toList();

      return criptosList ?? [];
    } on HttpError catch (error) {
      if (error == HttpError.forbidden || error == HttpError.unauthorized) {
        throw DomainError.invalidCredentials;
      } else {
        throw DomainError.unexpected;
      }
    }
  }
}
