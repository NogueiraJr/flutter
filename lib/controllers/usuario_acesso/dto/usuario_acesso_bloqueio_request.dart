import '../../../ocstapi.dart';

class UsuarioAcessoBloqueioRequest extends Serializable {
  int id;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    if (id == null) {
      mapValidate['id'] = 'Id do Usuário Obrigatório';
    }

    return mapValidate;
  }
}
