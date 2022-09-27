import 'package:ocstapi/controllers/usuario_acesso/dto/usuario_acesso_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

class UsuarioAcessoController extends ResourceController {
  UsuarioAcessoController(this.context)
      : usuarioService = UsuarioService(context);
  ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> criarAcessoUsuario(
      @Bind.body() UsuarioAcessoRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await usuarioService.criarAcessoUsuario(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [criarAcessoUsuario]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('login')
  Future<Response> obterAcessosUsuario(@Bind.path('login') String login) async {
    try {
      return await usuarioService.obterAcessosUsuario(login).then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'idMenu': m.menu.id,
                  'menuPai': m.menu.menuPai ?? '',
                  'menuRef': m.menu.menuRef,
                  'menuNome': m.menu.menuNome,
                  'menuDescricao': m.menu.menuDescricao,
                  'menuFigura': m.menu.menuFigura,
                  'menuModuloExec': m.menu.menuModuloExec,
                  'menuAtivo': m.menu.menuAtivo
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterAcessosUsuario]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('loginAcesso', 'loginPai')
  Future<Response> obterAcessosDisponiveisUsuario(
      @Bind.path('loginAcesso') String loginAcesso,
      @Bind.path('loginPai') String loginPai) async {
    try {
      return await usuarioService
          .obterAcessosDisponiveis(loginAcesso, loginPai)
          .then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'idMenu': m.menu.id,
                  'menuPai': m.menu.menuPai ?? '',
                  'menuRef': m.menu.menuRef,
                  'menuNome': m.menu.menuNome,
                  'menuDescricao': m.menu.menuDescricao,
                  'menuFigura': m.menu.menuFigura,
                  'menuModuloExec': m.menu.menuModuloExec,
                  'menuAtivo': m.menu.menuAtivo
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterAcessosDisponiveisUsuario]',
        'exception': e.toString()
      });
    }
  }
}
