import 'package:mobx/mobx.dart';

part 'grafico_dados_classificacao_clientes_controller.g.dart';

class GraficoDadosClassificacaoClientesController = _GraficoDadosClassificacaoClientesControllerBase
    with _$GraficoDadosClassificacaoClientesController;

abstract class _GraficoDadosClassificacaoClientesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
