import 'package:OCSTApp/app/modules/celulas/dados/produto/crud/produto_cadastro/produto_cadastro_controller.dart';
import 'package:OCSTApp/app/repositories/produto_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/crud/produto_cadastro/produto_cadastro_page.dart';

class ProdutoCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProdutoCadastroController(
            i.get<ProdutoRepository>(), i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProdutoCadastroPage()),
      ];

  static Inject get to => Inject<ProdutoCadastroModule>.of();
}
