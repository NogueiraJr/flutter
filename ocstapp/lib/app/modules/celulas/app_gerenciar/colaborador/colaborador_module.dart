import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/colaborador_controller.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/colaborador_page.dart';

class ColaboradorModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ColaboradorController(i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ColaboradorPage()),
      ];

  static Inject get to => Inject<ColaboradorModule>.of();
}
