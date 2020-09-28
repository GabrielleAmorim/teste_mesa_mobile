import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/controller/tela_login_controller.dart';
import 'package:teste_mesa_mobile/util/values.dart';
import 'package:teste_mesa_mobile/view/tela_cadastro.dart';
import 'package:teste_mesa_mobile/view/tela_listagem_noticias.dart';

import '../controller/tela_login_controller.dart';

class TelaLogin extends StatelessWidget {

  final TelaLoginController _telaLoginController = Get.put(TelaLoginController());

  var emailController = TextEditingController();
  var senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text(
            "Entrar com e-mail",
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
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 40, bottom: 40),
                    child: SvgPicture.asset(
                      "assets/images/img_tela_login.svg",
                      excludeFromSemantics: true,
                    ),
                  ),
                  Form(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Container(
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
                          Container(
                            child: Container(
                              padding: EdgeInsets.only(top: 20),
                              child: TextFormField(
                                obscureText: true,
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
                            padding: EdgeInsets.only(top: 30),
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            child: GetX<TelaLoginController>(
                              builder: (_) {
                                return Visibility(
                                  visible: !_.isLoading.value,
                                  child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          side: BorderSide(color: Values.MAIN_COLOR)),
                                      color: Values.MAIN_COLOR,
                                      textColor: Values.MAIN_COLOR,
                                      padding: EdgeInsets.all(8.0),
                                      onPressed: () async{
                                        FocusScope.of(context).unfocus();
                                        var response = await Get.find<TelaLoginController>().login(
                                            emailController.text.toString().trim(),
                                            senhaController.text.toString().trim(),
                                            context);
                                        if(response){
                                          Get.to(TelaListagemNoticias());
                                        }
                                      },
                                      child: Text("Login",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                                  replacement: Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 30, right: 20, left: 20),
                                    width: MediaQuery.of(context).size.width,
                                    height: 80,
                                    child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            side: BorderSide(
                                                color: Values.MAIN_COLOR)),
                                        color: Colors.white,
                                        textColor: Values.MAIN_COLOR,
                                        padding: EdgeInsets.all(8.0),
                                        onPressed: () async {
                                          var response = await Get.find<TelaLoginController>().loginComFacebook();
                                          if (response) {
                                            Get.to(TelaListagemNoticias());
                                          }
                                        },
                                        child: Text("Entrar com facebook",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Values.MAIN_COLOR,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18))),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding:
                                          EdgeInsets.only(top: 30, bottom: 20),
                                          child: Text(
                                            "Não tenho conta.",
                                            style: TextStyle(
                                                color: Values.MAIN_COLOR,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )),
                                      Container(
                                        padding:
                                        EdgeInsets.only(top: 30, bottom: 20),
                                        child: GestureDetector(
                                          child: Text("Cadastrar",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          onTap: () {
                                            Get.to(TelaCadastro());
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
