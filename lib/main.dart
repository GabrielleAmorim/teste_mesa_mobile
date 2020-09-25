import 'package:flutter/material.dart';
import 'package:teste_mesa_mobile/util/values.dart';
import 'package:teste_mesa_mobile/view/tela_inicial.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Values.MAIN_COLOR_02,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TelaInicial(),
    );
  }
}
