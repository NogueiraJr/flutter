import 'package:OCSTApp/app/modules/celulas/app_gerenciar/proprietario/cadastro/proprietario_editar/proprietario_editar_controller.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/proprietario/cadastro/proprietario_editar/proprietario_editar_page.dart';

class ProprietarioEditarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProprietarioEditarController(i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ProprietarioEditarPage()),
      ];

  static Inject get to => Inject<ProprietarioEditarModule>.of();
}
