
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/service/tela_cadastro_service.dart';
import 'package:teste_mesa_mobile/view/tela_inicial.dart';
import 'package:toast/toast.dart';

class TelaCadastroController extends GetxController{

  final TelaCadastroService _telaCadastroService = new TelaCadastroService();

  @override
  void onInit() {}

  Future<bool> cadastrar (String nome, String email, String senha, BuildContext context) async {
    try{
      var token = await _telaCadastroService.cadastrar(nome, email, senha);
      Toast.show("Usuário cadastrado com sucesso!", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      //Get.offAll(TelaInicial());
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