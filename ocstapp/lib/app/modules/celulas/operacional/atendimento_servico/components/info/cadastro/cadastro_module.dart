import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/info/cadastro/cadastro_controller.dart';
import 'package:OCSTApp/app/repositories/atendimento_servico_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/info/cadastro/cadastro_page.dart';

class AtendimentoServicoInfoCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AtendimentoServicoInfoCadastroController(
            i.get<AtendimentoServicoRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => AtendimentoServicoInfoCadastroPage()),
      ];

  static Inject get to => Inject<AtendimentoServicoInfoCadastroModule>.of();
}
