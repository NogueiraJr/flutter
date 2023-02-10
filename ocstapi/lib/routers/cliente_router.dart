import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/cliente/cliente_controller.dart';
import 'package:ocstapi/controllers/cliente/cliente_del_controller.dart';
import 'package:ocstapi/controllers/cliente/cliente_ins_controller.dart';
import 'package:ocstapi/controllers/cliente/cliente_upd_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class ClienteRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/cliente/ins')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteInsController(context));
    router
        .route('/cliente/upd')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteUpdController(context));
    router
        .route('/cliente/del')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteDelController(context));
    router
        .route('/cliente/:id')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteController(context));
    router
        .route('/cliente/usuario/:idUsuario')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteController(context));
    router
        .route('/cliente/nome/:nome')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteController(context));
    router
        .route('/cliente/celular/:celular')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteController(context));
    router
        .route('/cliente/email/:email')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteController(context));
    router
        .route('/cliente/empresa/:idUsuarioEmpresa/:amostra')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteController(context));
  }
}
