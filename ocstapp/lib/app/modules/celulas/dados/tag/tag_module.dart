import 'package:OCSTApp/app/modules/celulas/dados/tag/blocos/blocos_atendimento_servico/blocos_dados_atendimento_servico_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/tag/blocos/blocos_dados_lanchonete/blocos_dados_lanchonete_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/tag/blocos/blocos_dados_locacao_roupas/blocos_dados_locacao_roupas_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/tag/tag_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/tag/tag_page.dart';

class TagModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BlocosDadosAtendimentoServicosController()),
        Bind((i) => BlocosDadosLanchoneteController()),
        Bind((i) => BlocosDadosLocacaoRoupasController()),
        Bind((i) => TagController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TagPage()),
      ];

  static Inject get to => Inject<TagModule>.of();
}
