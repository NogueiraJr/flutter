import 'package:ocstapi/ocstapi.dart';

class ComplementarUsuarioRequest extends Serializable {
  String login;
  String empresa;
  String pessoa;

  @override
  Map<String, dynamic> asMap() {
    return {
      'login': login,
      'empresa': empresa,
      'pessoa': pessoa,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    login = object['login'] as String;
    empresa = object['empresa'] as String;
    pessoa = object['pessoa'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    if (empresa == null || empresa.isEmpty) {
      mapValidate['empresa'] = 'Empresa Obrigatória';
    }
    if (pessoa == null || pessoa.isEmpty) {
      mapValidate['pessoa'] = 'Pessoa Obrigatória';
    }

    return mapValidate;
  }
}
