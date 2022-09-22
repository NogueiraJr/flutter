import '../../../ocstapi.dart';

class UsuarioAcessoRequest extends Serializable {
  int usuarioId;
  int menuId;

  @override
  Map<String, dynamic> asMap() {
    return {
      'usuarioId': usuarioId,
      'menuId': menuId,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    usuarioId = object['usuarioId'] as int;
    menuId = object['menuId'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    if (usuarioId == null) {
      mapValidate['usuarioId'] = 'Id do Usuário Obrigatório';
    }
    if (menuId == null) {
      mapValidate['menuId'] = 'Id do Menu Obrigatório';
    }

    return mapValidate;
  }
}
