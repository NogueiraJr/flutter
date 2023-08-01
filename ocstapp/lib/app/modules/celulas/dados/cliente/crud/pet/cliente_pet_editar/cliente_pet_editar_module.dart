import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/pet/cliente_pet_editar/cliente_pet_editar_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/pet/cliente_pet_editar/cliente_pet_editar_page.dart';

class ClientePetEditarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientePetEditarController(i.get<ClienteRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ClientePetEditarPage()),
      ];

  static Inject get to => Inject<ClientePetEditarModule>.of();
}
