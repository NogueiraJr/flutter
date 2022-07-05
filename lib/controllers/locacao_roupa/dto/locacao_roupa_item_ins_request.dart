import '../../../ocstapi.dart';

class LocacaoRoupaItemInsRequest extends Serializable {
  int produtoId;
  // int locacaoId;
  int qtde;
  String observacao;

  @override
  Map<String, dynamic> asMap() {
    return {
      'produtoId': produtoId,
      // 'locacaoId': locacaoId,
      'descricao': observacao,
      'qtde': qtde,
      'observacao': observacao,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    produtoId = object['produtoId'] as int;
    // locacaoId = object['locacaoId'] as int;
    observacao = object['observacao'] as String;

    qtde = object['qtde'] as int;
    observacao = object['observacao'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (produtoId == null) {
      validateResult['produtoId'] = 'Id do Produto é necessário';
    }
    // if (locacaoId == null) {
    //   validateResult['locacaoId'] = 'Id da Locação é necessária';
    // }
    if (qtde == null) {
      validateResult['qtde'] = 'Quantidade não informada';
    }
    return validateResult;
  }
}
