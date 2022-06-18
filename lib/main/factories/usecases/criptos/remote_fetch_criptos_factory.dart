import 'package:example_blocs/data/usecases/criptos/remote_fetch_criptos.dart';
import 'package:example_blocs/domain/usecases/criptos/fetch_criptos.dart';
import 'package:example_blocs/main/factories/infra/http_adapter_factory.dart';

FetchCriptos makeRemoteFetchCriptos() => RemoteFetchCripto(
      httpClient: makeHttpAdapter(),
    );
