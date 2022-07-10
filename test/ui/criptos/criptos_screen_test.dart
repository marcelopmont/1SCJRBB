import 'package:favorites_cryptos/domain/entities/cripto_entity.dart';
import 'package:favorites_cryptos/presentation/criptos_presenter.dart';
import 'package:favorites_cryptos/ui/criptos/criptos_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

class CriptosPresenterMock extends Mock implements CriptosPresenter {
  @override
  final criptosList = Rx<List<CriptoEntity>>([]);
  @override
  final errorMessage = RxString('');

  void emitCriptos(List<CriptoEntity> criptos) => criptosList.value = criptos;

  void emitErrorMessage(String message) => errorMessage.value = message;
}

void main() {
  late CriptosPresenterMock presenter;

// TODO: Teste não compila por problemas de conflito de caminho o screen
  testWidgets('Deve mostrar a lista de criptos', (WidgetTester tester) async {
    presenter = CriptosPresenterMock();
    await tester.pumpWidget(
      GetMaterialApp(
        home: CriptosScreen(presenter: presenter),
      ),
    );

    presenter.emitCriptos(_getCriptosList());

    await mockNetworkImagesFor(() async => await tester.pump());
    expect(find.text(_getCriptosList()[0].name), findsOneWidget);
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
