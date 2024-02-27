import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/operacoes/cadastro/cadastro_controller.dart';
import 'package:OCSTApp/app/repositories/atendimento_servico_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/operacoes/cadastro/cadastro_page.dart';

class AtendimentoServicoCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AtendimentoServicoCadastroController(
            i.get<AtendimentoServicoRepository>(), i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => AtendimentoServicoCadastroPage()),
      ];

  static Inject get to => Inject<AtendimentoServicoCadastroModule>.of();
}
