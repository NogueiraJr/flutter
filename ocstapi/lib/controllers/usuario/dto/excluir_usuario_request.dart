import 'package:ocstapi/ocstapi.dart';

class ExcluirUsuarioRequest extends Serializable {
  String login;

  @override
  Map<String, dynamic> asMap() {
    return {'login': login};
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    login = object['login'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    if (login == null || login.isEmpty) {
      mapValidate['login'] = 'Login Obrigatório';
    }

    return mapValidate;
  }
}
