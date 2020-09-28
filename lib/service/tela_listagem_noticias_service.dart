import 'dart:convert';

import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/models/noticia.dart';
import 'package:teste_mesa_mobile/service/http.dart';
import 'package:teste_mesa_mobile/service/request.dart';

class TelaListagemNoticiasService{

  Future<List<Noticia>> loadDestaques() async{
    try{
      String request = Request.rotaDestaques();
      var response = await HttpService.serviceGet(request);
      var jsonDecode = json.decode(response.body);
      if(response.statusCode == 200){
        List<Noticia> retorno = new List<Noticia>();
        var data = jsonDecode["data"];
        for (var item in data) {
          Noticia noticia = new Noticia(title: item['title'], description: item['description'], content: item['content'], author: item['author'], published_at: item['published_at'],
              highlight: item['highlight'], url: item['url'], image_url: item['image_url'], favorite: false);
          retorno.add(noticia);
        }
        return retorno;
      } else {
        throw Exception(jsonDecode['message']);
      }
    }
    on SemConexaoException {
      throw SemConexaoException();
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  Future<List<Noticia>> loadNoticias(Map<String, String> params, pageIndex) async{
    try{
      String request = Request.rotaNoticias();
      var response = await HttpService.serviceGet(request, params: params);
      var jsonDecode = json.decode(response.body);
      if(response.statusCode == 200){
        List<Noticia> retorno = new List<Noticia>();
        var data = jsonDecode["data"];
        print(pageIndex);
        for (int i = 0; i < data.length; i++){
          var item = data[i];
          Noticia noticia = new Noticia(title: item['title'], description: item['description'], content: item['content'], author: item['author'], published_at: item['published_at'],
              highlight: item['highlight'], url: item['url'], image_url: item['image_url'], favorite: false, pageIndex: pageIndex, indiceFavorito: (pageIndex * 10) + i);
          retorno.add(noticia);
        }
        return retorno;
      } else {
        throw Exception(jsonDecode['message']);
      }
    }
    on SemConexaoException {
      throw SemConexaoException();
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

}