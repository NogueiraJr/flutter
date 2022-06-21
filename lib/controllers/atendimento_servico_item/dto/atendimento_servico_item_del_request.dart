import 'package:ocstapi/ocstapi.dart';

class AtendimentoServicoItemDelRequest extends Serializable {
  int id;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (id == null) {
      validateResult['id'] = 'Id do Serviço Item é necessário';
    }
    return validateResult;
  }
}