import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/produto/produto_controller.dart';
import 'package:ocstapi/controllers/produto/produto_del_controller.dart';
import 'package:ocstapi/controllers/produto/produto_ins_controller.dart';
import 'package:ocstapi/controllers/produto/produto_item_del_controller.dart';
import 'package:ocstapi/controllers/produto/produto_item_ins_controller.dart';
import 'package:ocstapi/controllers/produto/produto_upd_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class ProdutoRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/produto/ins')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoInsController(context));
    router
        .route('/produto/upd')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoUpdController(context));
    router
        .route('/produto/del')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoDelController(context));
    router
        .route('/produto/:id')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoController(context));
    router
        .route('/produto/resumo/:idProdutoResumo')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoController(context));
    router
        .route('/produto/usuario/:idUsuario')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoController(context));
    router
        .route('/produto/codigo/:codigo')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoController(context));
    router
        .route('/produto/nome/:nome')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoController(context));
    router
        .route('/produto/descricao/:descricao')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoController(context));
    router
        .route('/produto/empresa/:idUsuarioEmpresa/:amostra')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoController(context));
    router
        .route('/produto/itens/:idProduto')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoController(context));
    router
        .route('/produto/itens/ins')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoItemInsController(context));
    router
        .route('/produto/itens/del')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoItemDelController(context));
    router
        .route('/produto/composicao/disponiveis/:idProdutoASerComposto')
        .link(() => JwtAuthentication(context))
        .link(() => ProdutoController(context));
  }
}
