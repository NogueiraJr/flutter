import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/fornecedor/fornecedor_controller.dart';
import 'package:ocstapi/controllers/fornecedor/fornecedor_del_controller.dart';
import 'package:ocstapi/controllers/fornecedor/fornecedor_ins_controller.dart';
import 'package:ocstapi/controllers/fornecedor/fornecedor_upd_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class FornecedorRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/fornecedor/ins')
        .link(() => JwtAuthentication(context))
        .link(() => FornecedorInsController(context));
    router
        .route('/fornecedor/upd')
        .link(() => JwtAuthentication(context))
        .link(() => FornecedorUpdController(context));
    router
        .route('/fornecedor/del')
        .link(() => JwtAuthentication(context))
        .link(() => FornecedorDelController(context));
    router
        .route('/fornecedor/:id')
        .link(() => JwtAuthentication(context))
        .link(() => FornecedorController(context));
    router
        .route('/fornecedor/usuario/:idUsuario')
        .link(() => JwtAuthentication(context))
        .link(() => FornecedorController(context));
    router
        .route('/fornecedor/nome/:nome')
        .link(() => JwtAuthentication(context))
        .link(() => FornecedorController(context));
    router
        .route('/fornecedor/celular/:celular')
        .link(() => JwtAuthentication(context))
        .link(() => FornecedorController(context));
    router
        .route('/fornecedor/email/:email')
        .link(() => JwtAuthentication(context))
        .link(() => FornecedorController(context));
    router
        .route('/fornecedor/empresa/:idUsuarioEmpresa/:amostra')
        .link(() => JwtAuthentication(context))
        .link(() => FornecedorController(context));
  }
}
