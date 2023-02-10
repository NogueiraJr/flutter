import 'package:ocstapi/ocstapi.dart';

class LocacaoRoupaDevolverRequest extends Serializable {
  int usuarioId;
  int locacaoId;
  DateTime devolvido;

  @override
  Map<String, dynamic> asMap() {
    return {
      'usuarioId': usuarioId,
      'locacaoId': locacaoId,
      'devolvido': devolvido,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    usuarioId = object['usuarioId'] as int;
    locacaoId = object['locacaoId'] as int;

    final _devolvido = object['devolvido'] as String;
    devolvido = _devolvido != null ? DateTime.parse(_devolvido) : null;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (usuarioId == null) {
      validateResult['usuarioId'] = 'Id do Usuário é necessário';
    }
    if (locacaoId == null) {
      validateResult['locacaoId'] = 'Id da Locação é necessária';
    }
    if (devolvido == null) {
      validateResult['devolvido'] = 'Data da Devolução não informada';
    }
    return validateResult;
  }
}
