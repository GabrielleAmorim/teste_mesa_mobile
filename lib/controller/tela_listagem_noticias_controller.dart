import 'package:get/get.dart';
import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/models/noticia.dart';
import 'package:teste_mesa_mobile/service/tela_listagem_noticias_service.dart';

class TelaListagemNoticiasController extends GetxController{

  final TelaListagemNoticiasService _telaListagemNoticiasService = new TelaListagemNoticiasService();

  final noticiasDestaques = new List<Noticia>().obs;

  @override
  void onInit() {
    this.loadDestaques();
  }

  loadDestaques() async {
    try{
      var response = await _telaListagemNoticiasService.loadDestaques();
      print(response);
      Map data = {
        "success": true,
        "message": "Destaques obtidos com sucesso!"
      };
      return data;
    }
    on SemConexaoException{
      print("sem conexao");
      Map data = {
        "success": false,
        "message": "Ooops, você está sem conexão! Verifica sua rede wifi ou dados móveis e tente novamente!"
      };
      return data;
    }
    catch(e){
      print("erro");
      print(e.toString());
      Map data = {
        "success": false,
        "message": e.toString()
      };
      return data;
    }
  }

}