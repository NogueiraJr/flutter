import 'package:mobx/mobx.dart';

part 'blocos_dados_lanchonete_controller.g.dart';

class BlocosDadosLanchoneteController = _BlocosDadosLanchoneteControllerBase
    with _$BlocosDadosLanchoneteController;

abstract class _BlocosDadosLanchoneteControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
