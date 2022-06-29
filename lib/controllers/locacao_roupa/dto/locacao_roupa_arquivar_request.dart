import 'package:ocstapi/ocstapi.dart';

class LocacaoRoupaArquivarRequest extends Serializable {
  int usuarioId;
  int locacaoId;

  @override
  Map<String, dynamic> asMap() {
    return {
      'usuarioId': usuarioId,
      'locacaoId': locacaoId,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    usuarioId = object['usuarioId'] as int;
    locacaoId = object['locacaoId'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (usuarioId == null) {
      validateResult['usuarioId'] = 'Id do Usuário é necessário';
    }
    if (locacaoId == null) {
      validateResult['locacaoId'] = 'Id da Locação é necessária';
    }
    return validateResult;
  }
}
