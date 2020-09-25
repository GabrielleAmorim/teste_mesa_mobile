import 'dart:convert';
import 'dart:io';

import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/service/http.dart';
import 'package:teste_mesa_mobile/service/request.dart';

class TelaLoginService {

  final int STATUS_CODE_SUCCESS = 200;

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
        throw Exception(jsonDecode['message']);
      }
    } on SocketException {
      throw SemConexaoException();
    } catch(e){
      print(e.toString());
      throw Exception(e.toString());
    }
  }

}