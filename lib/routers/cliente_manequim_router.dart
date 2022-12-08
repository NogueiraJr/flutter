import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/cliente_manequim/cliente_manequim_controller.dart';
import 'package:ocstapi/controllers/cliente_manequim/cliente_manequim_ins_controller.dart';
import 'package:ocstapi/controllers/cliente_manequim/cliente_manequim_upd_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class ClienteManequimRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/cliente/manequim/ins')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteManequimInsController(context));
    router
        .route('/cliente/manequim/upd')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteManequimUpdController(context));
    router
        .route('/cliente/manequim/:id')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteManequimController(context));
    router
        .route('/cliente/manequim/cliente/:clienteId')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteManequimController(context));
    router
        .route('/cliente/manequim/cliente/hoje/:clienteIdHoje')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteManequimController(context));
  }
}
