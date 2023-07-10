import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/cliente_editar/cliente_editar_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/cliente_editar/cliente_editar_page.dart';

class ClienteEditarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClienteEditarController(i.get<ClienteRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClienteEditarPage()),
      ];

  static Inject get to => Inject<ClienteEditarModule>.of();
}
