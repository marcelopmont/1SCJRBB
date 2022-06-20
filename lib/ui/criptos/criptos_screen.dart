import 'package:example_blocs/presentation/criptos_presenter.dart';
import 'package:example_blocs/presentation/movies_presenter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CriptosScreen extends StatelessWidget {
  static const String id = '/criptos';

  const CriptosScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final CriptosPresenter presenter;

  void showError(String errorMessage) async {
    Get.snackbar(errorMessage, '');
  }

  @override
  Widget build(BuildContext context) {
    presenter.errorMessage.listen((errorMessage) {
      if (errorMessage.isNotEmpty) showError(errorMessage);
    });

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(presenter.tela.value)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              presenter.singout();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () {
            final criptosList = presenter.montaLista();
            return ListView.separated(
              itemCount: criptosList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) => Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                        child: Visibility(
                          visible: presenter.mostratIconeFavoritos(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0.1),
                                child: IconButton(
                                  iconSize: 15,
                                  onPressed: () => presenter.setFavorite(index),
                                  icon: criptosList[index].favorite
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : Icon(Icons.favorite_border),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.network(
                                criptosList[index].logo,
                                height: 35,
                                width: 35,
                                fit: BoxFit.fitWidth,
                                // placeholderBuilder: (BuildContext context) =>
                                //     Container(
                                //         padding: const EdgeInsets.all(4.0),
                                //         child:
                                //             const CircularProgressIndicator()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                criptosList[index].id,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  criptosList[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'R\$ ' + criptosList[index].price,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            //se for a tela principal mostrar o label para a tela de favoritos
            child: Obx(() => presenter.tela.value == presenter.PRINCIPAL
                ? Text(presenter.FAVORITAS)
                : Text(presenter.PRINCIPAL)),
            //TODO: acrescentar a chamda via presenter
            onPressed: () => presenter.mostraFavoritos(),
          )
        ],
      ),
    );
  }
}
