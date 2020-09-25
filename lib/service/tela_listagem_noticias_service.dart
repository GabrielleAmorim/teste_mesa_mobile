import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:teste_mesa_mobile/models/noticia.dart';
import 'package:teste_mesa_mobile/service/http.dart';
import 'package:teste_mesa_mobile/service/request.dart';

class TelaListagemNoticiasService{

  Future<List<Noticia>> loadDestaques() async{
    try{
      String request = Request.rotaDestaques();
      GetStorage box = GetStorage();
      String token = await box.read('token');
      var response = await HttpService.serviceGet(request, token);
      var jsonDecode = json.decode(response.body);
      if(response.statusCode == 200){
        List<Noticia> retorno = new List<Noticia>();
        var data = jsonDecode["data"];
        for (var item in data) {
          Noticia noticia = new Noticia(title: item['title'], description: item['description'], content: item['content'], author: item['author'], published_at: item['published_at'],
              highlight: item['highlight'], url: item['url'], image_url: item['image_url']);
          retorno.add(noticia);
        }
        return retorno;
      } else {
        throw Exception(jsonDecode['message']);
      }
    }
    catch(e){
      throw Exception(e.toString());
    }

  }

}