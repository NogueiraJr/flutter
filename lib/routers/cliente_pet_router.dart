import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/cliente_pet/cliente_pet_controller.dart';
import 'package:ocstapi/controllers/cliente_pet/cliente_pet_del_controller.dart';
import 'package:ocstapi/controllers/cliente_pet/cliente_pet_ins_controller.dart';
import 'package:ocstapi/controllers/cliente_pet/cliente_pet_upd_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class ClientePetRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/cliente/pet/ins')
        .link(() => JwtAuthentication(context))
        .link(() => ClientePetInsController(context));
    router
        .route('/cliente/pet/upd')
        .link(() => JwtAuthentication(context))
        .link(() => ClientePetUpdController(context));
    router
        .route('/cliente/pet/del')
        .link(() => JwtAuthentication(context))
        .link(() => ClientePetDelController(context));
    router
        .route('/cliente/pet/:id')
        .link(() => JwtAuthentication(context))
        .link(() => ClientePetController(context));
    router
        .route('/cliente/pet/cliente/:clienteId')
        .link(() => JwtAuthentication(context))
        .link(() => ClientePetController(context));

    router
        .route('/cliente/pet/cliente/:clienteVeiculoId/:atendimentoServicoId')
        .link(() => JwtAuthentication(context))
        .link(() => ClientePetController(context));
    router
        .route('/cliente/pet/em/uso/:clienteVeiculoIdEmUso')
        .link(() => JwtAuthentication(context))
        .link(() => ClientePetController(context));
  }
}
