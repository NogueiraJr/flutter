import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/sistema/sistema_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class SistemaRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/sistemas/ativos')
        .link(() => JwtAuthentication(context))
        .link(() => SistemaController(context));
    router
        .route('/sistema/usuario/gravar')
        .link(() => JwtAuthentication(context))
        .link(() => SistemaController(context));
    router
        .route('/sistema/usuario/escolhido/:login')
        //.link(() => JwtAuthentication(context))
        .link(() => SistemaController(context));
    router
        .route('/sistemadados/usuario/escolhido/:loginSistema')
        //.link(() => JwtAuthentication(context))
        .link(() => SistemaController(context));
  }
}
