import 'package:mobx/mobx.dart';

part 'blocos_dados_locacao_roupas_controller.g.dart';

class BlocosDadosLocacaoRoupasController = _BlocosDadosLocacaoRoupasControllerBase
    with _$BlocosDadosLocacaoRoupasController;

abstract class _BlocosDadosLocacaoRoupasControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
