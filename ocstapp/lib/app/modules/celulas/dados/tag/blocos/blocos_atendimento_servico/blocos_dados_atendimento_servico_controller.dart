import 'package:mobx/mobx.dart';

part 'blocos_dados_atendimento_servico_controller.g.dart';

class BlocosDadosAtendimentoServicosController = _BlocosDadosAtendimentoServicosControllerBase
    with _$BlocosDadosAtendimentoServicosController;

abstract class _BlocosDadosAtendimentoServicosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
