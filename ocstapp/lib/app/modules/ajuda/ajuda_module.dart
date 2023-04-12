import 'package:OCSTApp/app/modules/ajuda/ajuda_controller.dart';
import 'package:OCSTApp/app/modules/usuarios/login/login_module.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/ajuda/ajuda_page.dart';

class AjudaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AjudaController(i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AjudaPage()),
        Router('/login', module: LoginModule()),
      ];

  static Inject get to => Inject<AjudaModule>.of();
}
