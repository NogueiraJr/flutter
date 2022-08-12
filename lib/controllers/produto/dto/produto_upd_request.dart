import 'package:ocstapi/ocstapi.dart';

class ProdutoUpdRequest extends Serializable {
  int id;
  int usuarioId;
  String codigo;
  String nome;
  String descricao;
  double custo;
  double preco;
  String tags;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'codigo': codigo,
      'nome': nome,
      'descricao': descricao,
      'custo': custo,
      'preco': preco,
      'tags': tags,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    usuarioId = object['usuarioId'] as int;
    codigo = object['codigo'] as String;
    nome = object['nome'] as String;
    descricao = object['descricao'] as String;
    custo = object['custo'] as double;
    preco = object['preco'] as double;
    tags = object['tags'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (id == null) {
      validateResult['id'] = 'Id do Produto é necessário';
    }
    if (usuarioId == null) {
      validateResult['usuarioId'] = 'Usuário Dono do Produto é necessário';
    }
    if (codigo == null) {
      validateResult['codigo'] = 'Código não informado';
    }
    if (nome == null) {
      validateResult['nome'] = 'Nome não informado';
    }
    if (descricao == null) {
      validateResult['descricao'] = 'Descrição não informada';
    }
    return validateResult;
  }
}
