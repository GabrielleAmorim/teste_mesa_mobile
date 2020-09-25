import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';

class HttpService{

  static int TIMEOUT = 25;
  static String BASE_URL = "mesa-news-api.herokuapp.com";

  static Future<http.Response> servicePost(String url, Map data, String token, {Map params}) async {
    var body = json.encode(data);
    try {
      var uri_url = Uri.https(BASE_URL, url, params);
      final response = await http.post(uri_url, headers: {"Content-Type": "application/json", "token": token}, body: body).timeout(Duration(seconds: TIMEOUT));
      return response;
    } on SocketException {
      throw SemConexaoException();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}