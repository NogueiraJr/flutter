import 'package:OCSTApp/app/modules/celulas/dados/tag/crud/tag_editar/tag_editar_controller.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/tag/crud/tag_editar/tag_editar_page.dart';

class TagEditarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TagEditarController(
            i.get<TagRepository>(), i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TagEditarPage()),
      ];

  static Inject get to => Inject<TagEditarModule>.of();
}
