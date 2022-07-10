import 'package:favorites_cryptos/main/factories/pages/criptos/criptos_presenter_factory.dart';
import 'package:favorites_cryptos/presentation/criptos_presenter.dart';
import 'package:favorites_cryptos/ui/criptos/criptos_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makeCriptosScreen() {
  final presenter = Get.put<CriptosPresenter>(makeCriptosPresenter());
  return CriptosScreen(
    presenter: presenter,
  );
}
