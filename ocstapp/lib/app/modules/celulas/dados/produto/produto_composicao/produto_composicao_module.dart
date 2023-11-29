import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_composicao/produto_composicao_controller.dart';
import 'package:OCSTApp/app/repositories/produto_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_composicao/produto_composicao_page.dart';

class ProdutoComposicaoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProdutoComposicaoController(i.get<ProdutoRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ProdutoComposicaoPage()),
      ];

  static Inject get to => Inject<ProdutoComposicaoModule>.of();
}
