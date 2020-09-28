import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/controller/tela_login_controller.dart';
import 'package:teste_mesa_mobile/util/values.dart';
import 'package:teste_mesa_mobile/view/tela_cadastro.dart';
import 'package:teste_mesa_mobile/view/tela_listagem_noticias.dart';
import 'package:teste_mesa_mobile/view/tela_login.dart';

class TelaInicial extends StatelessWidget{

  final TelaLoginController _telaLoginController = Get.put(TelaLoginController());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Values.MAIN_COLOR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      child: SvgPicture.asset(
                        "assets/images/logo_a_1_1.svg",
                        height: MediaQuery.of(context).size.width * 0.3,
                        excludeFromSemantics: true,
                        color: Color(0xffc21712),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 150),
                  child: SvgPicture.asset(
                    "assets/images/news.svg",
                    excludeFromSemantics: true,
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 18, right: 20, left: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.white)),
                          color: Colors.white,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () async {
                            var response = await Get.find<TelaLoginController>().loginComFacebook();
                            if (response) {
                              Get.to(TelaListagemNoticias());
                            }
                          },
                          child: Text("Entrar com facebook", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18))
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 25, right: 20, left: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.white)),
                          color: Values.MAIN_COLOR,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {
                            Get.to(TelaLogin());
                          },
                          child: Text("Entrar com e-mail", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text("Não tenho conta.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),)
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20, left: 5),
                          child: GestureDetector(
                            child: Text("Cadastrar", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15)),
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
    );
  }


}