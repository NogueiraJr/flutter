import 'package:ocstapi/ocstapi.dart';

class TagUpdRequest extends Serializable {
  int id;
  int usuarioId;
  String nomeAntigo;
  String nomeNovo;
  String descricao;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'nomeAntigo': nomeAntigo,
      'nomeNovo': nomeNovo,
      'descricao': descricao,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    usuarioId = object['usuarioId'] as int;
    nomeAntigo = object['nomeAntigo'] as String;
    nomeNovo = object['nomeNovo'] as String;
    descricao = object['descricao'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (id == null) {
      validateResult['id'] = 'Id da Tag é necessária';
    }
    if (usuarioId == null) {
      validateResult['usuarioId'] = 'Usuário Dono da Tag é necessário';
    }
    if (nomeNovo == null) {
      validateResult['nomeAntigo'] = 'Antigo nome da Tag não informado';
    }
    if (nomeNovo == null) {
      validateResult['nomeNovo'] = 'Novo nome da Tag não informado';
    }
    return validateResult;
  }
}
