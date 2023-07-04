import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/cliente_cadastro/cliente_cadastro_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/cliente_cadastro/cliente_cadastro_page.dart';

class ClienteCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClienteCadastroController(
            i.get<ClienteRepository>(), i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClienteCadastroPage()),
      ];

  static Inject get to => Inject<ClienteCadastroModule>.of();
}
