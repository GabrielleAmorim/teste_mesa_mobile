import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_mesa_mobile/exception/login_incorreto_exception.dart';
import 'package:teste_mesa_mobile/exception/sem_conexao_exception.dart';
import 'package:teste_mesa_mobile/service/facebook_service.dart';
import 'package:teste_mesa_mobile/service/tela_login_service.dart';
import 'package:toast/toast.dart';


class TelaLoginController extends GetxController{

  final TelaLoginService telaLoginService = new TelaLoginService();
  static final FacebookLogin facebookSignIn = new FacebookLogin();


  final isLoading = false.obs;

  @override
  void onInit() {}

  login (String email, String senha, BuildContext context) async {
    try{
      this.isLoading.value = true;
      var token = await telaLoginService.login(email, senha);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', token);
      this.isLoading.value = false;
      return true;
    } on SemConexaoException {
      this.isLoading.value = false;
      Toast.show("Ooops, você está sem conexão! Verifique sua rede wifi ou dados móveis e tente novamente!", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return false;
    }
    on LoginIncorretoException {
      this.isLoading.value = false;
      Toast.show("Login ou senha incorreto!", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      return false;
    }
    catch (e) {
      this.isLoading.value = false;
      Toast.show(e.toString(), context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return false;
    }

  }

  loginComFacebook(BuildContext context) async {
    this.isLoading.value = true;
    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        var dadosUsuarioFacebook = await FacebookService.carregarInfosUsuarioFacebook(accessToken.token, accessToken.userId);
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', 'eyJhbGciOiJIUzI1NiJ9.eyJpZCI6NzgsImVtYWlsIjoiZ2FicmllbGxlcG9ydG8yMUBnbWFpbC5jb20ifQ.G5eExxK65ZFNyVb8hokWlvPn0v5T5VVc6gUIEnjZbAw');
        this.isLoading.value = false;
        return true;
        break;
      case FacebookLoginStatus.cancelledByUser:
        this.isLoading.value = false;
        Toast.show("Login cancelado pelo usuário!", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        return false;
        break;
      case FacebookLoginStatus.error:
        this.isLoading.value = false;
        Toast.show("Ocorreu um erro no processamento da requisição! - " + result.errorMessage, context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        return false;
        break;
    }
  }




}