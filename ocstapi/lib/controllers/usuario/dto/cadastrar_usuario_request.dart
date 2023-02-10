import 'package:ocstapi/ocstapi.dart';

class CadastrarUsuarioRequest extends Serializable {
  String login;
  String senha;
  String email;
  String ativo;
  int codigo;

  @override
  Map<String, dynamic> asMap() {
    return {
      'login': login,
      'senha': senha,
      'email': email,
      'ativo': ativo,
      'codigo': codigo,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    login = object['login'] as String;
    senha = object['senha'] as String;
    email = object['email'] as String;
    ativo = object['ativo'] as String;
    codigo = object['codigo'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    if (login == null || login.isEmpty) {
      mapValidate['login'] = 'Login Obrigatório';
    }
    if (senha == null || senha.isEmpty) {
      mapValidate['senha'] = 'Senha Obrigatória';
    }
    if (email == null || email.isEmpty) {
      mapValidate['email'] = 'Email Obrigatório';
    }

    return mapValidate;
  }
}
