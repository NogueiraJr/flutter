import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/graficos/grafico_dados_compras_semanais/grafico_dados_compras_semanais_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/graficos/grafico_dados_media_preco_por_qtde/grafico_dados_media_preco_por_qtde_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/blocos/blocos_dados_oficina_carros/blocos_dados_oficina_carros_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/blocos/blocos_dados_lanchonete/blocos_dados_lanchonete_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/fornecedor_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/fornecedor_page.dart';

class FornecedorModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GraficoDadosComprasSemanaisController()),
        Bind((i) => GraficoDadosMediaPrecoPorQtdeController()),
        Bind((i) => BlocosDadosOficinaCarrosController()),
        Bind((i) => BlocosDadosLanchoneteController()),
        Bind((i) => FornecedorController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FornecedorPage()),
      ];

  static Inject get to => Inject<FornecedorModule>.of();
}
