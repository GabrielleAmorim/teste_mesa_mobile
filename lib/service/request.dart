class Request {

  static String rotaLogin(){
    return '/v1/client/auth/signin';
  }

  static String rotaCadastro(){
    return '/v1/client/auth/signup';
  }

  static String rotaDestaques(){
    return '/v1/client/news/highlights';
  }

  static String rotaNoticias(){
    return '/v1/client/news';
  }
}