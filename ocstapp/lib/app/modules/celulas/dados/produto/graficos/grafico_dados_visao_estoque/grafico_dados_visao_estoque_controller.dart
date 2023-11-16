import 'package:mobx/mobx.dart';

part 'grafico_dados_visao_estoque_controller.g.dart';

class GraficoDadosVisaoEstoqueController = _GraficoDadosVisaoEstoqueControllerBase
    with _$GraficoDadosVisaoEstoqueController;

abstract class _GraficoDadosVisaoEstoqueControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
