import 'package:favorites_cryptos/data/usecases/criptos/models/cripto_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
// Teste Ok
  test('Deve criar uma cripto com sucesso', () {
    final cripto = CriptoModel(
        id: 'test',
        name: 'test',
        logo: 'about:blank',
        rank: 'teste',
        price: '0.0');

    expect(cripto.id, 'test');
    expect(cripto.name, 'test');
    expect(cripto.price, '0.0');
  });
// Teste Ok
  test('Deve criar a entidade a partir do modelo', () {
    final cripto = CriptoModel(
        id: 'test',
        name: 'test',
        logo: 'about:blank',
        rank: 'teste',
        price: '0.0');
    final criptoModel = cripto.toEntity();

    expect(criptoModel.id, 'test');
    expect(criptoModel.name, 'test');
    expect(criptoModel.rank, 'teste');
  });
}
