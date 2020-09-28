class LoginIncorretoException implements Exception {

  String errorMessage() {
    return 'Usuário ou senha incorreto!';
  }

}