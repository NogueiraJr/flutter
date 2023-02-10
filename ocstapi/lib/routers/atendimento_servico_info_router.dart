import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/atendimento_servico_info/atendimento_servico_info_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico_info/atendimento_servico_info_del_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico_info/atendimento_servico_info_ins_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico_info/atendimento_servico_info_upd_controller.dart';

import '../ocstapi.dart';

class AtendimentoServicoInfoRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/atendimento/servico/info/:id')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoInfoController(context));
    router
        .route('/atendimento/servico/info/usuario/:usuarioId')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoInfoController(context));
    router
        .route('/atendimento/servico/info/atendimento/:atendimentoServicoId')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoInfoController(context));
    router
        .route('/atendimento/servico/info/ins')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoInfoInsController(context));
    router
        .route('/atendimento/servico/info/upd')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoInfoUpdController(context));
    router
        .route('/atendimento/servico/info/del')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoInfoDelController(context));
  }
}
