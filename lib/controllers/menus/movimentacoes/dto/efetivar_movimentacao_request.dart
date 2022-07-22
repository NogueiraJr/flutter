import '../../../ocstapi.dart';

class EfetivarMovimentacaoRequest extends Serializable {
  int id;
  DateTime dataEfetivacao;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'dataEfetivacao': dataEfetivacao,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    final dataEfetivacaoStr = object['dataEfetivacao'] as String;
    dataEfetivacao =
        dataEfetivacaoStr != null ? DateTime.parse(dataEfetivacaoStr) : null;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    return validateResult;
  }
}
