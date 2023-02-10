import 'package:ocstapi/ocstapi.dart';

class FornecedorInsRequest extends Serializable {
  int usuarioId;
  String nome;
  String telefone;
  String email;
  String tags;
  String ativo;

  @override
  Map<String, dynamic> asMap() {
    return {
      'usuarioId': usuarioId,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'tags': tags,
      'ativo': ativo,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    usuarioId = object['usuarioId'] as int;
    nome = object['nome'] as String;
    telefone = object['telefone'] as String;
    email = object['email'] as String;
    tags = object['tags'] as String;
    ativo = object['ativo'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
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
    //if (tags == null) {
    //  validateResult['tags'] = 'Tags não informado';
    //}
    if (ativo == null) {
      validateResult['ativo'] = 'Ativo não informado';
    }
    return validateResult;
  }
}
