import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/service/tela_login_service.dart';
import 'package:toast/toast.dart';


class TelaLoginController extends GetxController{

  final TelaLoginService telaLoginService = new TelaLoginService();

  final isLoading = false.obs;

  @override
  void onInit() {}

  login (String email, String senha, BuildContext context) async {
    try{
      this.isLoading.value = true;
      var token = await telaLoginService.login(email, senha);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', token);
      this.isLoading.value = false;
      return true;
    } on SemConexaoException {
      this.isLoading.value = false;
      Toast.show("Ooops, você está sem conexão! Verifica sua rede wifi ou dados móveis e tente novamente!", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return false;
    } catch (e) {
      this.isLoading.value = false;
      Toast.show(e.toString(), context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return false;
    }

  }


}