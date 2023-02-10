import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/menu_service.dart';

class MenusController extends ResourceController {
  MenusController(this.context) : service = MenuService(context);
  final ManagedContext context;
  final MenuService service;

  @Operation.get('menuPai')
  Future<Response> obterMenusPorMenuPai() async {
    final menuPai = request.path.variables['menuPai'];
    return service.obterMenusPorMenuPai(menuPai).then((data) {
      return data
          .map((m) => {
                'id': m.id,
                'menuPai': m.menuPai,
                'menuRef': m.menuRef,
                'menuNome': m.menuNome,
                'menuDescricao': m.menuDescricao,
                'menuFigura': m.menuFigura,
                'menuModuloExec': m.menuModuloExec,
                'menuAtivo': m.menuAtivo
              })
          .toList();
    }).then((r) => Response.ok(r));
  }

  @Operation.get('menuPai', 'idUsuario')
  Future<Response> obterMenusPorMenuPaiLiberadosParaUsuario(
    @Bind.path('menuPai') String menuPai,
    @Bind.path('idUsuario') int idUsuario,
  ) async {
    return service
        .obterMenusPorMenuPaiLiberadosParaUsuario(menuPai, idUsuario)
        .then((data) {
      return data
          .map((m) => {
                'id': m.id,
                'menuPai': m.menu.menuPai,
                'menuRef': m.menu.menuRef,
                'menuNome': m.menu.menuNome,
                'menuDescricao': m.menu.menuDescricao,
                'menuFigura': m.menu.menuFigura,
                'menuModuloExec': m.menu.menuModuloExec,
                'menuAtivo': m.menu.menuAtivo
              })
          .toList();
    }).then((r) => Response.ok(r));
  }

  @Operation.get('menuPai', 'idUsuario', 'idSistema')
  Future<Response> obterMenusPorMenuPaiLiberadosParaUsuarioPorSistema(
    @Bind.path('menuPai') String menuPai,
    @Bind.path('idUsuario') int idUsuario,
    @Bind.path('idSistema') int idSistema,
  ) async {
    return service
        .obterMenusPorMenuPaiLiberadosParaUsuarioPorSistema(
            menuPai, idUsuario, idSistema)
        .then((data) {
      return data
          .map((m) => {
                'id': m.id,
                'menuPai': m.menu.menuPai,
                'menuRef': m.menu.menuRef,
                'menuNome': m.menu.menuNome,
                'menuDescricao': m.menu.menuDescricao,
                'menuFigura': m.menu.menuFigura,
                'menuModuloExec': m.menu.menuModuloExec,
                'menuAtivo': m.menu.menuAtivo
              })
          .toList();
    }).then((r) => Response.ok(r));
  }

  @Operation.get('menuPai', 'idSistema')
  Future<Response> obterMenusPorMenuPaiPorSistema(
    @Bind.path('menuPai') String menuPai,
    @Bind.path('idSistema') int idSistema,
  ) async {
    return service
        .obterMenusPorMenuPaiPorSistema(menuPai, idSistema)
        .then((data) {
      return data
          .map((m) => {
                'id': m.menu.id,
                'menuPai': m.menu.menuPai,
                'menuRef': m.menu.menuRef,
                'menuNome': m.menu.menuNome,
                'menuDescricao': m.menu.menuDescricao,
                'menuFigura': m.menu.menuFigura,
                'menuModuloExec': m.menu.menuModuloExec,
                'menuAtivo': m.menu.menuAtivo
              })
          .toList();
    }).then((r) => Response.ok(r));
  }
}
