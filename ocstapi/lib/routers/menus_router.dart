import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/menus/menus_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class MenusRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/menus/:menuPai')
        .link(() => JwtAuthentication(context))
        .link(() => MenusController(context));

    router
        .route('/menus/liberados/usuario/:menuPai/:idUsuario')
        .link(() => JwtAuthentication(context))
        .link(() => MenusController(context));

    router
        .route('/menus/liberados/usuario/:menuPai/:idUsuario/:idSistema')
        .link(() => JwtAuthentication(context))
        .link(() => MenusController(context));

    router
        .route('/menus/:menuPai/:idSistema')
        .link(() => JwtAuthentication(context))
        .link(() => MenusController(context));
  }
}
