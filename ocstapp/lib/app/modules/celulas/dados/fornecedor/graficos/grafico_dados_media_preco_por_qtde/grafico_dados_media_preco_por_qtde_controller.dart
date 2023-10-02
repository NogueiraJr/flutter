import 'package:mobx/mobx.dart';

part 'grafico_dados_media_preco_por_qtde_controller.g.dart';

class GraficoDadosMediaPrecoPorQtdeController = _GraficoDadosMediaPrecoPorQtdeControllerBase
    with _$GraficoDadosMediaPrecoPorQtdeController;

abstract class _GraficoDadosMediaPrecoPorQtdeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
