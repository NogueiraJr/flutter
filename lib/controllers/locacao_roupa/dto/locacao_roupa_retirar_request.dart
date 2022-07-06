import 'package:ocstapi/ocstapi.dart';

class LocacaoRoupaRetirarRequest extends Serializable {
  int usuarioId;
  int locacaoId;
  DateTime retirado;

  @override
  Map<String, dynamic> asMap() {
    return {
      'usuarioId': usuarioId,
      'locacaoId': locacaoId,
      'retirado': retirado,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    usuarioId = object['usuarioId'] as int;
    locacaoId = object['locacaoId'] as int;

    final _retirado = object['retirado'] as String;
    retirado = _retirado != null ? DateTime.parse(_retirado) : null;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (usuarioId == null) {
      validateResult['usuarioId'] = 'Id do Usuário é necessário';
    }
    if (locacaoId == null) {
      validateResult['locacaoId'] = 'Id da Locação é necessária';
    }
    if (retirado == null) {
      validateResult['retirado'] = 'Data da Retirada não informada';
    }
    return validateResult;
  }
}
