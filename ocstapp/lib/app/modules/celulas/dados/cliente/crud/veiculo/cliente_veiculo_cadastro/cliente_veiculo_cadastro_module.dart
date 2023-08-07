import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/veiculo/cliente_veiculo_cadastro/cliente_veiculo_cadastro_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/veiculo/cliente_veiculo_cadastro/cliente_veiculo_cadastro_page.dart';

class ClienteVeiculoCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            ClienteVeiculoCadastroController(i.get<ClienteRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ClienteVeiculoCadastroPage()),
      ];

  static Inject get to => Inject<ClienteVeiculoCadastroModule>.of();
}
