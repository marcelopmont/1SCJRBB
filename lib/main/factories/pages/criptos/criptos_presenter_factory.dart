import 'package:example_blocs/main/factories/usecases/criptos/remote_fetch_criptos_factory.dart';
import 'package:example_blocs/presentation/criptos_presenter.dart';
import 'package:example_blocs/presentation/movies_presenter.dart';

CriptosPresenter makeCriptosPresenter() => CriptosPresenter(
      fetchCriptos: makeRemoteFetchCriptos(),
    );
