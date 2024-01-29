import 'package:mobx/mobx.dart';

part 'blocos_operacional_atendimento_servico_controller.g.dart';

class BlocosOperacionalAtendimentoServicosController = _BlocosOperacionalAtendimentoServicosControllerBase
    with _$BlocosOperacionalAtendimentoServicosController;

abstract class _BlocosOperacionalAtendimentoServicosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
