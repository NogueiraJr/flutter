import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/atendimento_servico_item/atendimento_servico_item_del_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico_item/atendimento_servico_item_ins_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico_item/atendimento_servico_item_upd_controller.dart';

import '../ocstapi.dart';

class AtendimentoServicoItemRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/atendimento/servico/produto/ins')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoItemInsController(context));
    router
        .route('/atendimento/servico/produto/del')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoItemDelController(context));
    router
        .route('/atendimento/servico/produto/upd')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoItemUpdController(context));
  }
}
