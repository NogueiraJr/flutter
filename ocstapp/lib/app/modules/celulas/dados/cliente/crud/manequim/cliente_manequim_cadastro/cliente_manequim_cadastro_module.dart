import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/manequim/cliente_manequim_cadastro/cliente_manequim_cadastro_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/manequim/cliente_manequim_cadastro/cliente_manequim_cadastro_page.dart';

class ClienteManequimCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            ClienteManequimCadastroController(i.get<ClienteRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ClienteManequimCadastroPage()),
      ];

  static Inject get to => Inject<ClienteManequimCadastroModule>.of();
}
