import 'package:flutter/material.dart';
import 'package:OCSTApp/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  //GetIt getIt = GetIt.I;
  //getIt.registerSingleton<ColaboradorController>(ColaboradorController(null));
  runApp(ModularApp(module: AppModule()));
}
