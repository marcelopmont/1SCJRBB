import 'package:example_blocs/main/factories/pages/movies/movies_presenter_factory.dart';
import 'package:example_blocs/presentation/movies_presenter.dart';
import 'package:example_blocs/ui/movies/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makeMoviesScreen() {
  final presenter = Get.put<MoviesPresenter>(makeMoviesPresenter());
  return MoviesScreen(
    presenter: presenter,
  );
}
