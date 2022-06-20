import 'package:ocstapi/ocstapi.dart';

class FornecedorDelRequest extends Serializable {
  int id;
  int usuarioId;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    usuarioId = object['usuarioId'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (id == null) {
      validateResult['id'] = 'Id do Cliente é necessário';
    }
    if (usuarioId == null) {
      validateResult['usuarioId'] = 'Usuário Dono do Fornecedor é necessário';
    }
    return validateResult;
  }
}
