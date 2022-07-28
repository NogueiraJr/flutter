import '../../../ocstapi.dart';

class ApagarParcelasMovimentacaoRequest extends Serializable {
  int id;
  String ref;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'ref': ref,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    ref = object['ref'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (id == null) {
      validateResult['id'] = 'Id não informado';
    }
    if (ref == null) {
      validateResult['ref'] = 'Ref não informado';
    }
    return validateResult;
  }
}
