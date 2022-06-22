import 'package:ocstapi/ocstapi.dart';

class FornecedorUpdRequest extends Serializable {
  int id;
  int usuarioId;
  String nome;
  String telefone;
  String email;
  String tags;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'tags': tags,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    usuarioId = object['usuarioId'] as int;
    nome = object['nome'] as String;
    telefone = object['telefone'] as String;
    email = object['email'] as String;
    tags = object['tags'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (id == null) {
      validateResult['id'] = 'Id do Fornecedor é necessário';
    }
    if (usuarioId == null) {
      validateResult['usuarioId'] = 'Usuário Dono do Fornecedor é necessário';
    }
    if (nome == null) {
      validateResult['nome'] = 'Nome não informado';
    }
    if (telefone == null) {
      validateResult['telefone'] = 'Telefone não informado';
    }
    if (email == null) {
      validateResult['email'] = 'Email não informado';
    }
    return validateResult;
  }
}
