import 'package:OCSTApp/app/modules/celulas/dados/produto/crud/produto_editar/produto_editar_controller.dart';
import 'package:OCSTApp/app/repositories/produto_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/crud/produto_editar/produto_editar_page.dart';

class ProdutoEditarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProdutoEditarController(i.get<ProdutoRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProdutoEditarPage()),
      ];

  static Inject get to => Inject<ProdutoEditarModule>.of();
}
