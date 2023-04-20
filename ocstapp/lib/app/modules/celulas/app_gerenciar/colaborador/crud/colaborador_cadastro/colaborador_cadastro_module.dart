import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/crud/colaborador_cadastro/colaborador_cadastro_controller.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/crud/colaborador_cadastro/colaborador_cadastro_page.dart';

class ColaboradorCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ColaboradorCadastroController(i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ColaboradorCadastroPage()),
      ];

  static Inject get to => Inject<ColaboradorCadastroModule>.of();
}
