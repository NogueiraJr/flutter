import 'package:OCSTApp/app/modules/celulas/dados/produto/graficos/grafico_dados_movimento_estoque/grafico_dados_movimento_estoque_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/graficos/grafico_dados_visao_estoque/grafico_dados_visao_estoque_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/blocos/blocos_dados_oficina_carros/blocos_dados_oficina_carros_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/blocos/blocos_dados_locacao_roupas/blocos_dados_locacao_roupas_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/blocos/blocos_dados_lanchonete/blocos_dados_lanchonete_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_page.dart';

class ProdutoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GraficoDadosMovimentoEstoqueController()),
        Bind((i) => GraficoDadosVisaoEstoqueController()),
        Bind((i) => BlocosDadosOficinaCarrosController()),
        Bind((i) => BlocosDadosLocacaoRoupasController()),
        Bind((i) => BlocosDadosLanchoneteController()),
        Bind((i) => ProdutoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProdutoPage()),
      ];

  static Inject get to => Inject<ProdutoModule>.of();
}
