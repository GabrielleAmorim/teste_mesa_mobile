import 'package:get/get.dart';
import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/models/noticia.dart';
import 'package:teste_mesa_mobile/service/tela_listagem_noticias_service.dart';

class TelaListagemNoticiasController extends GetxController{

  final TelaListagemNoticiasService _telaListagemNoticiasService = new TelaListagemNoticiasService();

  final noticiasDestaques = new List<Noticia>().obs;
  final PER_PAGE = 20.obs;

  @override
  void onInit() {
    this.loadDestaques();
  }

  loadDestaques() async {
    try{
      var response = await _telaListagemNoticiasService.loadDestaques();
      this.noticiasDestaques.value = response;
      update();
      return true;
    }
    on SemConexaoException{
      return false;
    }
    catch(e){
      return false;
    }
  }

  Future<List<Noticia>> loadNoticias(int currentPage) async{
    try{
      var response = await _telaListagemNoticiasService.loadNoticias(currentPage, this.PER_PAGE.value);
      return response;
    }
    on SemConexaoException {
      return [];
    }
    catch(e){
      return [];
    }
  }

}