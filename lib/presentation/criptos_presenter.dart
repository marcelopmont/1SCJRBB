import 'dart:convert';

import 'package:example_blocs/data/usecases/criptos/local_criptos.dart';
import 'package:example_blocs/domain/entities/cripto_entity.dart';
import 'package:example_blocs/domain/usecases/criptos/fetch_criptos.dart';
import 'package:example_blocs/domain/utils/domain_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CriptosPresenter extends GetxController {
  CriptosPresenter({required this.fetchCriptos});

  final FetchCriptos fetchCriptos;

  final String PRINCIPAL = 'Principal';
  final String FAVORITAS = 'Favoritas';
  var tela = RxString('');

  final criptosList = Rx<List<CriptoEntity>>([]);
  final errorMessage = RxString('');
  LocalCripto localCriptos = LocalCripto();

  @override
  void onInit() async {
    super.onInit();
    try {
      tela.value = PRINCIPAL;
      criptosList.value = await fetchCriptos.execute();
      //TODO: melhorar codigo
      var dados = await localCriptos.getFavoritos();
      if (null != dados) {
        var contaDados = 0;
        var contaCriptos = 0;
        while (criptosList.value.iterator.moveNext()) {
          while (dados.values.iterator.moveNext()) {
            print(dados.entries.elementAt(contaDados));
            print(criptosList.value[contaCriptos].id);
            if (dados.entries
                .elementAt(contaDados)
                .toString()
                .contains(criptosList.value[contaCriptos].id)) {
              criptosList.value[contaCriptos].favorite = true;
            }
            contaDados++;
            if (dados.length == contaDados) {
              contaDados = 0;
              break;
            }
          }
          contaCriptos++;
          if (criptosList.value.length == contaCriptos) {
            break;
          }
        }
      }
      criptosList.refresh();
    } on DomainError catch (error) {
      errorMessage.value = (error == DomainError.invalidCredentials)
          ? 'Credenciais inválidas'
          : 'Erro, tente novamente';
    }
  }

  void singout() async {
    await FirebaseAuth.instance.signOut();
    criptosList.refresh();
  }

  void setFavorite(int i) async {
    localCriptos.updateData(
      criptosList.value[i].id,
      criptosList.value[i].favorite,
    );
    criptosList.value[i].favorite = !criptosList.value[i].favorite;
    criptosList.refresh();
  }

  mostraFavoritos() {
    // tela == PRINCIPAL
    //     ? allCriptos.map((data) => criptosList)
    //     : allCriptos.map((data) => criptosList);
    tela.value == PRINCIPAL ? setTela(FAVORITAS) : setTela(PRINCIPAL);
    montaLista();
    criptosList.refresh();
  }

  getTela() {
    return tela.value;
  }

  setTela(tela) {
    this.tela.value = tela;
  }

  montaLista() {
    if (tela.value == FAVORITAS) {
      return criptosList.value.where((cripto) => cripto.favorite).toList();
    }
    return criptosList.value;
  }

  mostratIconeFavoritos() {
    if (tela.value == FAVORITAS) {
      return false;
    }
    return true;
  }
}
