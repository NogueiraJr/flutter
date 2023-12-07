import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_escolher/escolher_produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_escolher/escolher_produto_page.dart';

class EscolherProdutoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => EscolherProdutoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => EscolherProdutoPage()),
      ];

  static Inject get to => Inject<EscolherProdutoModule>.of();
}
