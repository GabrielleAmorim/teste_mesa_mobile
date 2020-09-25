import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/util/values.dart';

class TelaLogin extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Entrar com e-mail", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Values.MAIN_COLOR,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text("teste"),
          )
        ],
      ),
    );
  }

}