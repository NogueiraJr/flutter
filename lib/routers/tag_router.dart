import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/tag/tag_controller.dart';
import 'package:ocstapi/controllers/tag/tag_ins_controller.dart';
import 'package:ocstapi/controllers/tag/tag_del_controller.dart';
import 'package:ocstapi/controllers/tag/tag_upd_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class TagRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/tag/ins')
        .link(() => JwtAuthentication(context))
        .link(() => TagInsController(context));
    router
        .route('/tag/upd')
        .link(() => JwtAuthentication(context))
        .link(() => TagUpdController(context));
    router
        .route('/tag/del')
        .link(() => JwtAuthentication(context))
        .link(() => TagDelController(context));
    router
        .route('/tag/:id')
        .link(() => JwtAuthentication(context))
        .link(() => TagController(context));
    router
        .route('/tag/usuario/:idUsuario')
        .link(() => JwtAuthentication(context))
        .link(() => TagController(context));
    router
        .route('/tag/nome/:nome/:usuarioId/:id')
        .link(() => JwtAuthentication(context))
        .link(() => TagController(context));
    router
        .route('/tag/empresa/:idUsuarioEmpresa/:amostra')
        .link(() => JwtAuthentication(context))
        .link(() => TagController(context));
  }
}
