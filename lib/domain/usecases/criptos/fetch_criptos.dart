import 'package:favorites_cryptos/domain/entities/cripto_entity.dart';

abstract class FetchCriptos {
  Future<List<CriptoEntity>> execute();
}
