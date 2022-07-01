import 'package:ocstapi/ocstapi.dart';

class LocacaoRoupaCancelarRequest extends Serializable {
  int locacaoId;

  @override
  Map<String, dynamic> asMap() {
    return {
      'locacaoId': locacaoId,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    locacaoId = object['locacaoId'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (locacaoId == null) {
      validateResult['locacaoId'] = 'Id da Locação é necessária';
    }
    return validateResult;
  }
}
