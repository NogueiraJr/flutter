import 'package:mobx/mobx.dart';

part 'grafico_dados_compras_semanais_controller.g.dart';

class GraficoDadosComprasSemanaisController = _GraficoDadosComprasSemanaisControllerBase
    with _$GraficoDadosComprasSemanaisController;

abstract class _GraficoDadosComprasSemanaisControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
