import 'package:OCSTApp/app/modules/celulas/dados/tag/crud/tag_cadastro/tag_cadastro_controller.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/tag/crud/tag_cadastro/tag_cadastro_page.dart';

class TagCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TagCadastroController(
            i.get<TagRepository>(), i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TagCadastroPage()),
      ];

  static Inject get to => Inject<TagCadastroModule>.of();
}
