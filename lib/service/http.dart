import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';

import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/util/values.dart';

class HttpService{

  static int TIMEOUT = 25;

  static Future<http.Response> serviceGet(String baseUrl, String rota, {params}) async {
    try {
      var uri_url = Uri.https(baseUrl, rota, params);
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

  static Future<http.Response> servicePost(String url, Map data, {Map params}) async {
    var body = json.encode(data);
    try {
      var uri_url = Uri.https(Values.BASE_URL, url, params);
      final response = await http.post(uri_url, headers: {"Content-Type": "application/json"}, body: body).timeout(Duration(seconds: TIMEOUT));
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