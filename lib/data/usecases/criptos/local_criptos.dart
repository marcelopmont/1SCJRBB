import 'dart:convert';

import 'package:example_blocs/domain/entities/cripto_entity.dart';
import 'package:localstore/localstore.dart';

class LocalCripto {
  final db = Localstore.instance;
  final dbName = 'criptos';

  Future<dynamic> save(id) {
    // save the item
    Future<dynamic> resposta = db.collection(dbName).doc(id).set({
      'id': id,
    });
    return resposta;
  }

  Future<Map<String, dynamic>?> getFavoritos() async {
    var dados = await db.collection(dbName).get();
    return dados;
  }

  Future<dynamic> delete(id) {
    return db.collection(dbName).doc(id).delete();
  }

  Future<dynamic> updateData(id, isFavorite) {
    return !isFavorite ? save(id) : delete(id);
  }
}
