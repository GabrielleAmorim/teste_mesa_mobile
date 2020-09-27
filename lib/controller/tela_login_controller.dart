import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', token);
      return true;
    } on SemConexaoException {
      Toast.show("Ooops, você está sem conexão! Verifica sua rede wifi ou dados móveis e tente novamente!", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return false;
    } catch (e) {
      Toast.show(e.toString(), context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return false;
    }

  }


}