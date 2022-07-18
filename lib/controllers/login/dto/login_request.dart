import 'package:ocstapi/ocstapi.dart';

class LoginRequest extends Serializable {
  String login;
  String senha;

  @override
  Map<String, dynamic> asMap() {
    return {'login': login, 'senha': senha};
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    login = object['login'] as String;
    senha = object['senha'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (login == null || login.trim().isEmpty) {
      validateResult['login'] = 'Login deve ser informado';
    }

    if (senha == null || senha.trim().isEmpty) {
      validateResult['senha'] = 'Senha deve ser informada';
    }

    return validateResult;
  }
}
