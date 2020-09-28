import 'package:get/get.dart';
import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/models/noticia.dart';
import 'package:teste_mesa_mobile/service/tela_listagem_noticias_service.dart';

class TelaListagemNoticiasController extends GetxController{

  final TelaListagemNoticiasService _telaListagemNoticiasService = new TelaListagemNoticiasService();

  final noticiasDestaques = new List<Noticia>().obs;
  final PER_PAGE = 10;
  final noticias = new List<Noticia>().obs;
  final noticiasFavoritas = new List<Noticia>();

  final dataFiltro = ''.obs;
  final dataFormatada = ''.obs;
  final apenasFavoritos = false.obs;


  @override
  void onInit() {
    this.loadDestaques();
  }

  loadDestaques() async {
    try{
      if(this.apenasFavoritos.value){
        List<Noticia> favoritos = new List<Noticia>();
        for(int i = 0; i < this.noticiasDestaques.length; i++){
          if (this.noticiasDestaques[i].favorite){
            favoritos.add(this.noticiasDestaques[i]);
          }
        }
        this.noticiasDestaques.value = favoritos;
      } else {
        var response = await _telaListagemNoticiasService.loadDestaques();
        this.noticiasDestaques.value = response;
        update();
        return true;
      }
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
      if (!this.apenasFavoritos.value){
        if (this.dataFormatada.value != ''){
          Map<String, String> params = {
            'current_page': currentPage.toString(),
            'per_page': this.PER_PAGE.toString(),
            'published_at': this.dataFormatada.value.toString()
          };
          var response = await _telaListagemNoticiasService.loadNoticias(params);
          this.noticias.value += response;
          return response;
        } else {
          Map<String, String> params = {
            'current_page': currentPage.toString(),
            'per_page': this.PER_PAGE.toString()
          };
          var response = await _telaListagemNoticiasService.loadNoticias(params);
          this.noticias.value += response;
          return response;
        }
      } else {
        List<Noticia> noticiasFavoritas = new List<Noticia>();
        List<Noticia> noticiasRetorno = new List<Noticia>();
        int indiceInicial = currentPage * PER_PAGE;
        int indiceFinal = indiceInicial + PER_PAGE;
        for(int i = 0; i < this.noticias.length; i++){
          if(this.noticias[i].favorite){
            noticiasFavoritas.add(this.noticias[i]);
          }
        }
        for(int i = indiceInicial; i < indiceFinal; i++){
          if (i >= noticiasFavoritas.length) {
            break;
          }
          else {
            noticiasRetorno.add(this.noticias[i]);
          }
        }
        return noticiasRetorno;
      }
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
    if(this.apenasFavoritos.value){
      this.loadDestaques();
    }
    this.noticiasDestaques.update((value) {});
  }

  setNoticiaFavorite (index){
    this.noticias[index].favorite = !this.noticias[index].favorite;
    if(this.apenasFavoritos.value){
      this.loadNoticias(1);
    }
    this.noticias.update((value) {});
  }

  changeData(String dataFiltro, String dataFormatada){
    this.dataFiltro.value = dataFiltro;
    this.dataFormatada.value = dataFormatada;
    update();
  }

  changeApenasFavoritos(bool value){
    this.apenasFavoritos.value = value;
    this.loadDestaques();
    update();
  }

  limparFiltro(){
    this.dataFiltro.value = '';
    this.dataFormatada.value = '';
    update();
    this.apenasFavoritos.value = false;
    update();
  }

}