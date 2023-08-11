import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/veiculo/cliente_veiculo_editar/cliente_veiculo_editar_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/veiculo/cliente_veiculo_editar/cliente_veiculo_editar_page.dart';

class ClienteVeiculoEditarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClienteVeiculoEditarController(i.get<ClienteRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ClienteVeiculoEditarPage()),
      ];

  static Inject get to => Inject<ClienteVeiculoEditarModule>.of();
}
