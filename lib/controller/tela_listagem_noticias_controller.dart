import 'package:get/get.dart';
import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/models/noticia.dart';
import 'package:teste_mesa_mobile/service/tela_listagem_noticias_service.dart';

class TelaListagemNoticiasController extends GetxController{

  final TelaListagemNoticiasService _telaListagemNoticiasService = new TelaListagemNoticiasService();

  final noticiasDestaques = new List<Noticia>().obs;
  final PER_PAGE = 10;
  final noticias = new List<Noticia>().obs;

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
      var response = await _telaListagemNoticiasService.loadNoticias(currentPage, this.PER_PAGE);
      this.noticias.value += response;
      return response;
    }
    on SemConexaoException {
      return [];
    }
    catch(e){
      return [];
    }
  }

  setDestaqueFavorite(index){
    this.noticiasDestaques[index].favorite = !this.noticiasDestaques[index].favorite;
    this.noticiasDestaques.update((value) {});
  }

  setNoticiaFavorite (index){
    this.noticias[index].favorite = !this.noticias[index].favorite;
    this.noticias.update((value) {});
  }

  printFavoritos(){
    List<Noticia> favoritos = new List<Noticia>();
    for(int i = 0; i < this.noticiasDestaques.length; i++){
      if (this.noticiasDestaques[i].favorite){
        favoritos.add(this.noticiasDestaques[i]);
      }
    }
    for(int i = 0; i < this.noticias.length; i++){
      if (this.noticias[i].favorite){
        favoritos.add(this.noticias[i]);
      }
    }
  }



}