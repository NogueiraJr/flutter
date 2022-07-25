import '../../../ocstapi.dart';

class FaturarMovimentacaoRequest extends Serializable {
  int idUsuario;
  int idAtendimentoServico;
  int idCategoria;
  String qtdeParcelas;
  String descricao;
  double numberValue;
  DateTime dataInicial;
  String tags;

  @override
  Map<String, dynamic> asMap() {
    return {
      'idUsuario': idUsuario,
      'idAtendimentoServico': idAtendimentoServico,
      'idCategoria': idCategoria,
      'qtdeParcelas': qtdeParcelas,
      'descricao': descricao,
      'numberValue': numberValue,
      'dataInicial': dataInicial,
      'tags': tags,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    idUsuario = object['idUsuario'] as int;
    idAtendimentoServico = object['idAtendimentoServico'] as int;
    idCategoria = object['idCategoria'] as int;
    qtdeParcelas = object['qtdeParcelas'] as String;
    descricao = object['descricao'] as String;
    numberValue = object['numberValue'] as double;
    final dataInicialStr = object['dataInicial'] as String;
    dataInicial =
        dataInicialStr != null ? DateTime.parse(dataInicialStr) : null;
    tags = object['tags'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    return validateResult;
  }
}
