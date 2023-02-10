import 'package:ocstapi/ocstapi.dart';

class ConsultarUsuarioRequest extends Serializable {
  String login;
  String pessoa;
  String empresa;
  String email;
  String ativo;

  @override
  Map<String, dynamic> asMap() {
    return {
      'login': login,
      'pessoa': pessoa,
      'empresa': empresa,
      'email': email,
      'ativo': ativo,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    login = object['login'] as String;
    pessoa = object['pessoa'] as String;
    empresa = object['empresa'] as String;
    email = object['email'] as String;
    ativo = object['ativo'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    //if (login == null || login.isEmpty) {
    //  mapValidate['login'] = 'Login Obrigatório';
    //}
    //if (pessoa == null || pessoa.isEmpty) {
    //  mapValidate['pessoa'] = 'Pessoa Obrigatória';
    //}
    //if (email == null || email.isEmpty) {
    //  mapValidate['email'] = 'Email Obrigatório';
    //}

    return mapValidate;
  }
}
