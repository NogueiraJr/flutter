import '../../../ocstapi.dart';

class UsuarioDelegarRequest extends Serializable {
  int quem;
  int para;

  @override
  Map<String, dynamic> asMap() {
    return {
      'quem': quem,
      'para': para,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    quem = object['quem'] as int;
    para = object['para'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    if (quem == null) {
      mapValidate['quem'] = 'Id Filho Obrigatório';
    }
    if (para == null) {
      mapValidate['para'] = 'Id Pai Obrigatório';
    }

    return mapValidate;
  }
}
