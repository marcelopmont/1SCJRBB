import 'package:favorites_cryptos/data/usecases/criptos/remote_fetch_criptos.dart';
import 'package:favorites_cryptos/domain/usecases/criptos/fetch_criptos.dart';
import 'package:favorites_cryptos/main/factories/infra/http_adapter_factory.dart';

FetchCriptos makeRemoteFetchCriptos() => RemoteFetchCripto(
      httpClient: makeHttpAdapter(),
    );
