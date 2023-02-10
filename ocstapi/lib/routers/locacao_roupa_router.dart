import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/locacao_roupa/locacao_roupa_arquivar_controller.dart';
import 'package:ocstapi/controllers/locacao_roupa/locacao_roupa_cancelar_controller.dart';
import 'package:ocstapi/controllers/locacao_roupa/locacao_roupa_controller.dart';
import 'package:ocstapi/controllers/locacao_roupa/locacao_roupa_devolver_controller.dart';
import 'package:ocstapi/controllers/locacao_roupa/locacao_roupa_ins_controller.dart';
import 'package:ocstapi/controllers/locacao_roupa/locacao_roupa_retirar_controller.dart';

import '../ocstapi.dart';

class LocacaoRoupaRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/locacao/roupa/:id')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaController(context));
    router
        .route('/locacao/roupa/cliente/:clienteId')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaController(context));
    router
        .route('/locacao/roupa/usuario/:usuarioId')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaController(context));
    router
        .route('/locacao/roupa/empresa/:usuarioEmpresaId/:ref')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaController(context));
    router
        .route('/locacao/roupa/ins')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaInsController(context));
    router
        .route('/locacao/roupa/produtos/:locacaoRoupaId')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaController(context));
    router
        .route('/locacao/roupa/retirar')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaRetirarController(context));
    router
        .route('/locacao/roupa/devolver')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaDevolverController(context));
    router
        .route('/locacao/roupa/arquivar')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaArquivarController(context));
    router
        .route('/locacao/roupa/cancelar')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaCancelarController(context));

    router
        .route('/locacao/roupa/qtdes/:usuarioEmpresaId/:refQtde')
        .link(() => JwtAuthentication(context))
        .link(() => LocacaoRoupaController(context));
  }
}
