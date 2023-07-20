import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/manequim/cliente_manequim_editar/cliente_manequim_editar_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/manequim/cliente_manequim_editar/cliente_manequim_editar_page.dart';

class ClienteManequimEditarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
            (i) => ClienteManequimEditarController(i.get<ClienteRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ClienteManequimEditarPage()),
      ];

  static Inject get to => Inject<ClienteManequimEditarModule>.of();
}
