import 'package:mobx/mobx.dart';

part 'blocos_dados_oficina_carros_controller.g.dart';

class BlocosDadosOficinaCarrosController = _BlocosDadosOficinaCarrosControllerBase
    with _$BlocosDadosOficinaCarrosController;

abstract class _BlocosDadosOficinaCarrosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
