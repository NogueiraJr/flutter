import 'package:mobx/mobx.dart';

part 'calendario_controller.g.dart';

class AtendimentoServicoCalendarioController = _CalendarioControllerBase
    with _$AtendimentoServicoCalendarioController;

abstract class _CalendarioControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
