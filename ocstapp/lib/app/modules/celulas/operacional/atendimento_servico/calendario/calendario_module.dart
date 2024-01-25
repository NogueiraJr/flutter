import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/calendario/calendario_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/calendario/calendario_page.dart';

class AtendimentoServicoCalendarioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AtendimentoServicoCalendarioController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => AtendimentoServicoCalendarioPage()),
      ];

  static Inject get to => Inject<AtendimentoServicoCalendarioModule>.of();
}
