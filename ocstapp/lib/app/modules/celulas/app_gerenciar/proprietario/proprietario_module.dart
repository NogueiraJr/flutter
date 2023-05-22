import 'package:OCSTApp/app/modules/celulas/app_gerenciar/proprietario/proprietario_controller.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/proprietario/proprietario_page.dart';

class ProprietarioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProprietarioController(i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProprietarioPage()),
      ];

  static Inject get to => Inject<ProprietarioModule>.of();
}
