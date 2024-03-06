import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/operacoes/faturar/faturar_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_page.dart';

class AtendimentoServicoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FaturarAtendimentoController()),
        Bind((i) => AtendimentoServicoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => AtendimentoServicoPage()),
      ];

  static Inject get to => Inject<AtendimentoServicoModule>.of();
}
