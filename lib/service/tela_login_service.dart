import 'dart:convert';
import 'dart:io';

import 'package:teste_mesa_mobile/exception/login_incorreto_exception.dart';
import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/service/http.dart';
import 'package:teste_mesa_mobile/service/request.dart';

class TelaLoginService {

  final int STATUS_CODE_SUCCESS = 200;
  final String LOGIN_INCORRETO = "INVALID_CREDENTIALS";

  Future<String> login(String email, String senha) async{
    try{
      String request = Request.rotaLogin();
      Map data = {
        "email": email,
        "password": senha
      };
      var response = await HttpService.servicePost(request, data);
      var jsonDecode = json.decode(response.body);
      if(response.statusCode == this.STATUS_CODE_SUCCESS){
        String token = jsonDecode['token'];
        return token;
      } else {
        if(jsonDecode['code'] == this.LOGIN_INCORRETO){
          throw LoginIncorretoException();
        } else {
          throw Exception(jsonDecode['message']);
        }
      }
    } on SemConexaoException {
      throw SemConexaoException();
    }
    on LoginIncorretoException {
      throw LoginIncorretoException();
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

}