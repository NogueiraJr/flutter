import 'package:ocstapi/ocstapi.dart';

class GravarSistemaUsuarioRequest extends Serializable {
  int id;
  int idSistema;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'idSistema': idSistema,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    idSistema = object['idSistema'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    if (id == null) {
      mapValidate['id'] = 'Id do Usuário Obrigatório';
    }
    if (idSistema == null) {
      mapValidate['idSistema'] =
          'Id Do Sistema escolhido pelo Usuario Obrigatório';
    }

    return mapValidate;
  }
}
