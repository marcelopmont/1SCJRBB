import 'package:favorites_cryptos/domain/entities/cripto_entity.dart';
import 'package:favorites_cryptos/domain/usecases/criptos/fetch_criptos.dart';
import 'package:favorites_cryptos/domain/utils/domain_error.dart';
import 'package:favorites_cryptos/presentation/criptos_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FetchCriptosMock extends Mock implements FetchCriptos {
  FetchCriptosMock() {
    mockExecute(_getCriptosList());
  }

  void mockExecute(List<CriptoEntity> criptosList) {
    when(() => execute()).thenAnswer((_) async => criptosList);
  }

  void mockError(DomainError error) {
    when(() => execute()).thenThrow(error);
  }
}

void main() {
  late CriptosPresenter sut;
  late FetchCriptosMock fetchCriptos;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    fetchCriptos = FetchCriptosMock();
    sut = CriptosPresenter(fetchCriptos: fetchCriptos);
  });

  test('Should call fetch criptos on init', () async {
    sut.onInit();
    verify(() => fetchCriptos.execute());
  });

  test(
      'Should emit credential error message list when fetch criptos throw invalid credential',
      () async {
    fetchCriptos.mockError(DomainError.invalidCredentials);
    sut.errorMessage.listen(
      expectAsync1(
        (errorMessage) => expect(errorMessage, 'Credenciais inválidas'),
      ),
    );
    sut.onInit();
  });

  test(
      'Should emit generic error message list when fetch criptos throw unexpected',
      () async {
    fetchCriptos.mockError(DomainError.unexpected);
    sut.errorMessage.listen(
      expectAsync1(
        (errorMessage) => expect(errorMessage, 'Erro, tente novamente'),
      ),
    );
    sut.onInit();
  });
}

List<CriptoEntity> _getCriptosList() => [
      CriptoEntity(
        id: 'id_0',
        name: 'name_0',
        rank: 'rank_0',
        price: 'price_0',
        logo: 'logo_0',
      ),
      CriptoEntity(
        id: 'id_1',
        name: 'name_1',
        rank: 'rank_1',
        price: 'price_1',
        logo: 'logo_1',
      ),
      CriptoEntity(
        id: 'id_2',
        name: 'name_2',
        rank: 'rank_2',
        price: 'price_2',
        logo: 'logo_2',
      ),
    ];
