import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/movimentacoes/apagar_parcelas_movimentacao_controller.dart';
import 'package:ocstapi/controllers/movimentacoes/movimentacoes_controller.dart';
import 'package:ocstapi/controllers/movimentacoes/movimentacoes_del_controller.dart';
import 'package:ocstapi/controllers/movimentacoes/movimentacoes_efetivar_controller.dart';
import 'package:ocstapi/controllers/movimentacoes/movimentacoes_faturar_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class MovimentacoesRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/movimentacoes/faturamento/:ref/:id')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesController(context));
    router
        .route('/movimentacoes/:anoMes')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesController(context));
    router
        .route('/movimentacoes/total/:totalAnoMes')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesController(context));
    router
        .route('/movimentacoes')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesController(context));
    router
        .route('/movimentacoes/del')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesDelController(context));
    router
        .route('/movimentacoes/parcelas/del')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesParcelasDelController(context));
    router
        .route('/movimentacoes/faturar')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesFaturarController(context));
    router
        .route('/movimentacoes/efetivar')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesEfetivarController(context));
  }
}
