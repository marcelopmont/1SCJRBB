import 'package:favorites_cryptos/main/factories/usecases/criptos/remote_fetch_criptos_factory.dart';
import 'package:favorites_cryptos/presentation/criptos_presenter.dart';

CriptosPresenter makeCriptosPresenter() => CriptosPresenter(
      fetchCriptos: makeRemoteFetchCriptos(),
    );
