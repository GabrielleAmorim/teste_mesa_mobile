import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/controller/tela_listagem_noticias_controller.dart';
import 'package:teste_mesa_mobile/util/values.dart';

class TelaListagemNoticias extends StatelessWidget{

  final TelaListagemNoticiasController _telaListagemNoticiasController = Get.put(TelaListagemNoticiasController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text(
          "Mesa News",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Values.MAIN_COLOR,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text("Destaques", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            )
          ],
        ),
      ),
    );
  }


}