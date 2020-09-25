
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/service/tela_login_service.dart';
import 'package:toast/toast.dart';

class TelaLoginController extends GetxController{

  final TelaLoginService telaLoginService = new TelaLoginService();

  @override
  void onInit() {}

  login (String email, String senha, BuildContext context) async {
    try{
      var token = await telaLoginService.login(email, senha);
      Toast.show("Deu bom demaissss " + token, context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } on SemConexaoException {
      Toast.show("Ooops, você está sem conexão! Verifica sua rede wifi ou dados móveis e tente novamente!", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } catch (e) {
      Toast.show(e.toString(), context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }

  }


}