import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/crud/colaborador_editar/colaborador_editar_controller.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/crud/colaborador_editar/colaborador_editar_page.dart';

class ColaboradorEditarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ColaboradorEditarController(i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ColaboradorEditarPage()),
      ];

  static Inject get to => Inject<ColaboradorEditarModule>.of();
}
