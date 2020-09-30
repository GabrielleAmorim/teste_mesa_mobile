import 'dart:async';
import 'dart:convert';

import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/models/noticia.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import 'package:teste_mesa_mobile/service/http.dart';


class FacebookService{

  String BASE_URL = 'graph.facebook.com';
  static int TIMEOUT = 25;


  carregarInfosUsuarioFacebook(String accessToken, String userId) async{
    try{
      String request = '/${userId}';
      Map<String, String> params = {
        'access_token': accessToken,
        'fields': 'name,email'
      };
      var response = await HttpService.serviceGet(this.BASE_URL, request, params: params);
      var jsonDecode = json.decode(response.body);
      if(response.statusCode == 200){
        return jsonDecode;
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