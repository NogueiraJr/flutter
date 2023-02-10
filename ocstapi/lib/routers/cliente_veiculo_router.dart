import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/cliente_veiculo/cliente_veiculo_controller.dart';
import 'package:ocstapi/controllers/cliente_veiculo/cliente_veiculo_del_controller.dart';
import 'package:ocstapi/controllers/cliente_veiculo/cliente_veiculo_ins_controller.dart';
import 'package:ocstapi/controllers/cliente_veiculo/cliente_veiculo_upd_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class ClienteVeiculoRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/cliente/veiculo/ins')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteVeiculoInsController(context));
    router
        .route('/cliente/veiculo/upd')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteVeiculoUpdController(context));
    router
        .route('/cliente/veiculo/del')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteVeiculoDelController(context));
    router
        .route('/cliente/veiculo/:id')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteVeiculoController(context));
    router
        .route('/cliente/veiculo/cliente/:clienteId')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteVeiculoController(context));

    router
        .route(
            '/cliente/veiculo/cliente/:clienteVeiculoId/:atendimentoServicoId')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteVeiculoController(context));
    router
        .route('/cliente/veiculo/em/uso/:clienteVeiculoIdEmUso')
        .link(() => JwtAuthentication(context))
        .link(() => ClienteVeiculoController(context));
  }
}
