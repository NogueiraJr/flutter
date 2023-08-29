import 'package:OCSTApp/app/modules/celulas/dados/cliente/blocos/blocos_dados_atendimento_servico/blocos_dados_atendimento_servico_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_escolher/escolher_cliente_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/graficos/grafico_dados_classificacao_clientes/grafico_dados_classificacao_clientes_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/graficos/grafico_dados_fluxo_clientes/grafico_dados_fluxo_clientes_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/blocos/blocos_dados_lanchonete/blocos_dados_lanchonete_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/blocos/blocos_dados_locacao_roupas/blocos_dados_locacao_roupas_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_page.dart';

class ClienteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => EscolherClienteController()),
        Bind((i) => GraficoDadosClassificacaoClientesController()),
        Bind((i) => GraficoDadosFluxoClientesController()),
        Bind((i) => BlocosDadosLanchoneteController()),
        Bind((i) => BlocosDadosAtendimentoServicosController()),
        Bind((i) => BlocosDadosLocacaoRoupasController()),
        Bind((i) => ClienteController()),
        //Bind((i) =>
        //CadastroClienteController(i.get<CadastroClienteRepository>())),
        //Bind((i) => CadastroClienteController(i.get<UsuarioRepository>())),

        //Bind((i) => CadastroClienteController(
        //    i.get<ClienteRepository>(), i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClientePage()),
      ];

  static Inject get to => Inject<ClienteModule>.of();
}
