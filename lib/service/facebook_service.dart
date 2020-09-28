import 'dart:async';
import 'dart:convert';

import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/models/noticia.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';


class FacebookService{

  static String BASE_URL = 'graph.facebook.com';
  static int TIMEOUT = 25;


  static carregarInfosUsuarioFacebook(String accessToken, String userId) async{
    try{
      String request = '/${userId}';
      print(userId);
      print(accessToken);
      Map<String, String> params = {
        'access_token': accessToken,
        'fields': 'name,email'
      };
      var response = await serviceGet(request, params: params);
      print(json.decode(response.body));
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

  static Future<http.Response> serviceGet(String rota, {params}) async {
    try {
      var uri_url = Uri.https(BASE_URL, rota, params);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String token = await sharedPreferences.getString('token');
      var header = {"Content-Type": "application/json", "Authorization": token};
      var response = await http.get(uri_url, headers: header).timeout(Duration(seconds: TIMEOUT));
      return response;
    } on SocketException {
      throw SemConexaoException();
    }
    on TimeoutException {
      throw SemConexaoException();
    }
    catch (e) {
      throw Exception(e.toString());
    }
  }

}