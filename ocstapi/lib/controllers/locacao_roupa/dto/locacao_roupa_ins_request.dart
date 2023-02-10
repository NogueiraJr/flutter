import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_item_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';

class LocacaoRoupaInsRequest extends Serializable {
  int usuarioId;
  int clienteId;
  String descricao;
  DateTime provar;
  DateTime retirar;
  DateTime devolver;
  double valor;
  String observacao;
  String tags;
  String ativo;

  // List<dynamic> locacaoRoupaItens;
  String locacaoRoupaItens;

  @override
  Map<String, dynamic> asMap() {
    return {
      'usuarioId': usuarioId,
      'clienteId': clienteId,
      'descricao': descricao,
      'provar': provar,
      'retirar': retirar,
      'devolver': devolver,
      'valor': valor,
      'observacao': observacao,
      'tags': tags,
      'ativo': ativo,
      'locacaoRoupaItens': locacaoRoupaItens,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    usuarioId = object['usuarioId'] as int;
    clienteId = object['clienteId'] as int;
    descricao = object['descricao'] as String;

    final _provar = object['provar'] as String;
    provar = _provar != null ? DateTime.parse(_provar) : null;

    final _retirar = object['retirar'] as String;
    retirar = _retirar != null ? DateTime.parse(_retirar) : null;

    final _devolver = object['devolver'] as String;
    devolver = _devolver != null ? DateTime.parse(_devolver) : null;

    valor = object['valor'] as double;
    observacao = object['observacao'] as String;
    tags = object['tags'] as String;
    ativo = object['ativo'] as String;
    locacaoRoupaItens = object['locacaoRoupaItens'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (usuarioId == null) {
      validateResult['usuarioId'] = 'Usuário Dono do Fornecedor é necessário';
    }
    if (clienteId == null) {
      validateResult['clienteId'] = 'Cliente é necessário';
    }
    if (descricao == null) {
      validateResult['descricao'] = 'Nome não informado';
    }
    if (valor == null) {
      validateResult['valor'] = 'Valor não informado';
    }
    if (provar == null) {
      validateResult['provar'] = 'Data da Prova não informada';
    }
    if (retirar == null) {
      validateResult['retirar'] = 'Data da Retirada não informada';
    }
    if (devolver == null) {
      validateResult['devolver'] = 'Data da Devolução não informada';
    }
    if (ativo == null) {
      validateResult['ativo'] = 'Ativo não informado';
    }
    return validateResult;
  }
}
