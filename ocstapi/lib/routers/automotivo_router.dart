import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/automotivo/automotivo_controller.dart';

import '../ocstapi.dart';

class AutomotivoRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/automotivo/estatisticas/:id')
        .link(() => JwtAuthentication(context))
        .link(() => AutomotivoController(context));
  }
}
