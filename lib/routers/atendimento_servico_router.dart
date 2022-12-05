import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/atendimento_servico/atendimento_servico_arquivar_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico/atendimento_servico_cancelar_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico/atendimento_servico_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico/atendimento_servico_finalizar_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico/atendimento_servico_iniciar_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico/atendimento_servico_inicio_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico/atendimento_servico_ins_controller.dart';
import 'package:ocstapi/controllers/atendimento_servico/atendimento_servico_novovalor_controller.dart';

import '../ocstapi.dart';

class AtendimentoServicoRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/atendimento/servico/:id')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoController(context));
    router
        .route('/atendimento/servico/cliente/:clienteId')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoController(context));
    router
        .route('/atendimento/servico/usuario/:usuarioId')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoController(context));
    router
        .route(
            '/atendimento/servico/empresa/:usuarioEmpresaId/:ref/:opc/:quando')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoController(context));
    router
        .route('/atendimento/servico/ins')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoInsController(context));
    router
        .route('/atendimento/servico/produtos/:atendimentoServicoId')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoController(context));
    router
        .route('/atendimento/servico/inicio')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoInicioController(context));
    router
        .route('/atendimento/servico/iniciar')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoIniciarController(context));
    router
        .route('/atendimento/servico/finalizar')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoFinalizarController(context));
    router
        .route('/atendimento/servico/arquivar')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoArquivarController(context));
    router
        .route('/atendimento/servico/cancelar')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoCancelarController(context));
    router
        .route('/atendimento/servico/novovalor')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoNovoValorController(context));

    router
        .route('/atendimento/servico/qtdes/:usuarioEmpresaId/:refQtde')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoController(context));

    //refOficinaCarros
    router
        .route('/atendimento/servico/veiculo/:atendimentoServicoIdVeiculo')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoController(context));

    //refPetShop
    router
        .route('/atendimento/servico/pet/:atendimentoServicoIdPet')
        .link(() => JwtAuthentication(context))
        .link(() => AtendimentoServicoController(context));
  }
}
