import 'package:ocstapi/ocstapi.dart';

class TagDelRequest extends Serializable {
  int id;
  int usuarioId;
  String tudo;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'tudo': tudo,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    usuarioId = object['usuarioId'] as int;
    tudo = object['tudo'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (id == null) {
      validateResult['id'] = 'Id da Tag é necessário';
    }
    if (usuarioId == null) {
      validateResult['usuarioId'] = 'Usuário Dono da Tag é necessário';
    }
    if (tudo == null) {
      validateResult['tudo'] =
          'Necessário definir se apaga a Tag do Sistema inteiro ou apenas do Cadastro dela';
    }
    return validateResult;
  }
}
