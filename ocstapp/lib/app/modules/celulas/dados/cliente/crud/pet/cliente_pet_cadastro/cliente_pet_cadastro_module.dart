import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/pet/cliente_pet_cadastro/cliente_pet_cadastro_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/pet/cliente_pet_cadastro/cliente_pet_cadastro_page.dart';

class ClientePetCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientePetCadastroController(i.get<ClienteRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ClientePetCadastroPage()),
      ];

  static Inject get to => Inject<ClientePetCadastroModule>.of();
}
