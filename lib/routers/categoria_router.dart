import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/categorias/categorias_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class CategoriaRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/categorias/:tipo')
        .link(() => JwtAuthentication(context))
        .link(() => CategoriasController(context));
  }
}
