import 'package:ocstapi/ocstapi.dart';

class TagRequest extends Serializable {
  int id;
  int usuarioId;
  String nome;
  String descricao;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'nome': nome,
      'descricao': descricao,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    usuarioId = object['usuarioId'] as int;
    nome = object['nome'] as String;
    descricao = object['descricao'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    return validateResult;
  }
}
