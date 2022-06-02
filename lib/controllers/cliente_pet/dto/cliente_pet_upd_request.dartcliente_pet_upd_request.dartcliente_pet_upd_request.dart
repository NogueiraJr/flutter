import 'package:ocstapi/ocstapi.dart';

class ClientePetUpdRequest extends Serializable {
  int id;
  int clienteId;
  String nome;
  String raca;
  String anoNascimento;
  String mesNascimento;
  String cor;
  String observacao;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'clienteId': clienteId,
      'nome': nome,
      'raca': raca,
      'anoNascimento': anoNascimento,
      'mesNascimento': mesNascimento,
      'cor': cor,
      'observacao': observacao,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    clienteId = object['clienteId'] as int;
    nome = object['nome'] as String;
    raca = object['raca'] as String;
    anoNascimento = object['anoNascimento'] as String;
    mesNascimento = object['mesNascimento'] as String;
    cor = object['cor'] as String;
    observacao = object['observacao'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (id == null) {
      validateResult['id'] = 'Id é necessário';
    }
    if (clienteId == null) {
      validateResult['clienteId'] = 'Cliente é necessário';
    }
    if (nome == null) {
      validateResult['nome'] = 'Nome não informado';
    }
    if (raca == null) {
      validateResult['raca'] = 'Raça não informada';
    }
    return validateResult;
  }
}
