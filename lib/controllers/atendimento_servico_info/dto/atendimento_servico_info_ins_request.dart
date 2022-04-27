import 'package:ocstapi/ocstapi.dart';

class AtendimentoServicoInfoInsRequest extends Serializable {
  int id;
  int usuarioId;
  int atendimentoServicoId;
  String descricao;
  String tags;
  String observacao;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'atendimentoServicoId': atendimentoServicoId,
      'descricao': descricao,
      'tags': tags,
      'observacao': observacao,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    usuarioId = object['usuarioId'] as int;
    atendimentoServicoId = object['atendimentoServicoId'] as int;
    descricao = object['descricao'] as String;
    tags = object['tags'] as String;
    observacao = object['observacao'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (atendimentoServicoId == null) {
      validateResult['atendimentoServicoId'] = 'Atendimento é necessário';
    }
    if (usuarioId == null) {
      validateResult['usuarioId'] = 'Cliente é necessário';
    }
    return validateResult;
  }
}
