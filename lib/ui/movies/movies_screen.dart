import 'package:favorites_cryptos/presentation/movies_presenter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesScreen extends StatelessWidget {
  static const String id = '/movies';

  const MoviesScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final MoviesPresenter presenter;

  void showError(String errorMessage) async {
    Get.snackbar(errorMessage, '');
  }

  @override
  Widget build(BuildContext context) {
    presenter.errorMessage.listen((errorMessage) {
      if (errorMessage.isNotEmpty) showError(errorMessage);
    });

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            final moviesList = presenter.moviesList.value;
            return ListView.separated(
              itemCount: moviesList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) => Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: SizedBox(
                  height: 160,
                  child: Row(
                    children: [
                      Image.network(
                        moviesList[index].image,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                moviesList[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Rating: ${moviesList[index].rating}'),
                              Text(
                                moviesList[index].description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: TextButton(
        child: Text("Logount"),
        //TODO: acrescentar a chamda via presenter
        onPressed: () => FirebaseAuth.instance.signOut(),
      ),
    );
  }
}
