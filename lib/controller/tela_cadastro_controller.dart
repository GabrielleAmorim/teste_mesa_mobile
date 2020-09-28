import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/service/tela_cadastro_service.dart';
import 'package:toast/toast.dart';

class TelaCadastroController extends GetxController{

  final TelaCadastroService _telaCadastroService = new TelaCadastroService();
  final dataNascimento = ''.obs;
  final isLoading = false.obs;

  @override
  void onInit() {}

  Future<bool> cadastrar (String nome, String email, String senha, BuildContext context) async {
    try{
      this.isLoading.value = true;
      var token = await _telaCadastroService.cadastrar(nome, email, senha);
      this.isLoading.value = false;
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', token);
      Toast.show("Usuário cadastrado com sucesso!", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
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

  changeDataNascimento(String data){
    this.dataNascimento.value = data;
    update();
  }


}