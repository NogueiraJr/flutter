import 'package:mobx/mobx.dart';

part 'grafico_dados_movimento_estoque_controller.g.dart';

class GraficoDadosMovimentoEstoqueController = _GraficoDadosMovimentoEstoqueControllerBase
    with _$GraficoDadosMovimentoEstoqueController;

abstract class _GraficoDadosMovimentoEstoqueControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
