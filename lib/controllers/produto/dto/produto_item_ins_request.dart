import 'package:ocstapi/ocstapi.dart';

class ProdutoItemInsRequest extends Serializable {
  int produtoId;
  int produtoItemId;

  @override
  Map<String, dynamic> asMap() {
    return {
      'produtoId': produtoId,
      'produtoItemId': produtoItemId,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    produtoId = object['produtoId'] as int;
    produtoItemId = object['produtoItemId'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (produtoId == null) {
      validateResult['produtoId'] = 'Id do Produto Principal é necessário';
    }
    if (produtoItemId == null) {
      validateResult['produtoItemId'] = 'id do Produto Item é necessário';
    }
    return validateResult;
  }
}
