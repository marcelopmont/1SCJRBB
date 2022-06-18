import 'package:example_blocs/domain/entities/cripto_entity.dart';

abstract class FetchCriptos {
  Future<List<CriptoEntity>> execute();
}
