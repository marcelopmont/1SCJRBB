import 'package:favorites_cryptos/domain/entities/cripto_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
// Teste Ok
  test(
    'Deve criar uma cripto com sucesso',
    () {
      final cripto = CriptoEntity(id: 'test',name: 'test',logo: 'about:blank',
          rank: 'teste',price: '0.0');

      expect(cripto.id, 'test');
      expect(cripto.name, 'test');
      expect(cripto.price, '0.0');
      expect(cripto.logo, 'about:blank');
      expect(cripto.rank, 'teste');
      expect(cripto.price, '0.0');
    },
  );
}
