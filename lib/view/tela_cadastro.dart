import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/controller/tela_cadastro_controller.dart';
import 'package:teste_mesa_mobile/util/values.dart';
import 'package:teste_mesa_mobile/view/tela_inicial.dart';

class TelaCadastro extends StatelessWidget{

  final TelaCadastroController _telaCadastroController = Get.put(TelaCadastroController());

  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var senhaController = TextEditingController();
  var confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text(
          "Cadastrar",
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Form(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people),
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                        labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                      controller: this.nomeController,
                    ),
                  ),
                  Container(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        controller: this.emailController,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        controller: this.senhaController,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'Confirmar Senha',
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        controller: this.confirmarSenhaController,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Values.MAIN_COLOR)),
                        color: Values.MAIN_COLOR,
                        textColor: Values.MAIN_COLOR,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          var response = await Get.find<TelaCadastroController>().cadastrar(
                              nomeController.text.toString().trim(),
                              emailController.text.toString().trim(),
                              senhaController.text.toString().trim(), context);
                          if(response){
                            Get.offAll(TelaInicial());
                          }
                        },
                        child: Text("Cadastrar",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}