import 'dart:convert';
import 'dart:io';

import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/service/http.dart';
import 'package:teste_mesa_mobile/service/request.dart';

class TelaCadastroService{


  Future<String> cadastrar(String nome, String email, String senha) async{
    try{
      String request = Request.rotaCadastro();
      Map data = {
        "name": nome,
        "email": email,
        "password": senha
      };
      var response = await HttpService.servicePost(request, data);
      var jsonDecode = json.decode(response.body);
      if(response.statusCode == 201){
        String token = jsonDecode['token'];
        return token;
      } else {
        throw Exception(jsonDecode['errors'][0]['message']);
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