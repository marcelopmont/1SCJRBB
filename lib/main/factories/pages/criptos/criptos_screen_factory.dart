import 'package:example_blocs/main/factories/pages/criptos/criptos_presenter_factory.dart';
import 'package:example_blocs/presentation/criptos_presenter.dart';
import 'package:example_blocs/ui/criptos/criptos_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makeCriptosScreen() {
  final presenter = Get.put<CriptosPresenter>(makeCriptosPresenter());
  return CriptosScreen(
    presenter: presenter,
  );
}
