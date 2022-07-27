import '../../../ocstapi.dart';

class SalvarMovimentacaoRequest extends Serializable {
  String operacao;
  int id;
  int atendimentoServicoId;
  int categoria;
  DateTime dataMovimentacao;
  String descricao;
  double valor;
  String parcela;
  String tags;
  DateTime dataEfetivacao;

  @override
  Map<String, dynamic> asMap() {
    return {
      'operacao': operacao,
      'id': id,
      'atendimentoServicoId': atendimentoServicoId,
      'categoria': categoria,
      'descricao': descricao,
      'dataMovimentacao': dataMovimentacao,
      'valor': valor,
      'parcela': parcela,
      'tags': tags,
      'dataEfetivacao': dataEfetivacao
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    operacao = object['operacao'] as String;
    id = object['id'] as int;
    atendimentoServicoId = object['atendimentoServicoId'] as int;
    categoria = object['categoria'] as int;
    descricao = object['descricao'] as String;
    final dataMovimentacaoStr = object['dataMovimentacao'] as String;
    dataMovimentacao = dataMovimentacaoStr != null
        ? DateTime.parse(dataMovimentacaoStr)
        : null;
    valor = object['valor'] as double;
    parcela = object['parcela'] as String;
    tags = object['tags'] as String;
    final dataEfetivacaoStr = object['dataEfetivacao'] as String;
    dataEfetivacao =
        dataEfetivacaoStr != null ? DateTime.parse(dataEfetivacaoStr) : null;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (operacao == null) {
      validateResult['operacao'] = 'Operação não informada';
    }
    if (descricao == null) {
      validateResult['descricao'] = 'Descrição não informada';
    }
    if (categoria == null) {
      validateResult['categoria'] = 'Categoria não informada';
    }
    if (valor == null) {
      validateResult['valor'] = 'Valor não informado';
    }
    if (dataMovimentacao == null) {
      validateResult['dataMovimentacao'] = 'Data de Movimentação não informada';
    }
    return validateResult;
  }
}
