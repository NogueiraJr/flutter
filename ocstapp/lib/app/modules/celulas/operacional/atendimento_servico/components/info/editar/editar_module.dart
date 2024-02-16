import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/info/editar/editar_controller.dart';
import 'package:OCSTApp/app/repositories/atendimento_servico_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/info/editar/editar_page.dart';

class AtendimentoServicoInfoEditarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AtendimentoServicoInfoEditarController(
            i.get<AtendimentoServicoRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => AtendimentoServicoInfoEditarPage()),
      ];

  static Inject get to => Inject<AtendimentoServicoInfoEditarModule>.of();
}
