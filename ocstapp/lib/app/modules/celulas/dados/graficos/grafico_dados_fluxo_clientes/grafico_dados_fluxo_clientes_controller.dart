import 'package:mobx/mobx.dart';

part 'grafico_dados_fluxo_clientes_controller.g.dart';

class GraficoDadosFluxoClientesController = _GraficoDadosFluxoClientesControllerBase
    with _$GraficoDadosFluxoClientesController;

abstract class _GraficoDadosFluxoClientesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
