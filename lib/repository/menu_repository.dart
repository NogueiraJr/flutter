import 'package:ocstapi/model/menu_model.dart';
import 'package:ocstapi/model/menu_sistema_model.dart';
import 'package:ocstapi/model/usuario_acesso_model.dart';
import 'package:ocstapi/ocstapi.dart';

class MenuRepository {
  MenuRepository(this.context);
  final ManagedContext context;
  Future<List<MenuModel>> obterMenusPorMenuPai(String menuPai) {
    final q = Query<MenuModel>(context)
      ..where((w) => w.menuAtivo).equalTo('S')
      ..where((w) => w.menuPai).equalTo(menuPai)
      ..sortBy((s) => s.id, QuerySortOrder.ascending);
    return q.fetch();
  }

  Future<List<UsuarioAcessoModel>> obterMenusPorMenuPaiLiberadosParaUsuario(
      String menuPai, int idUsuario) {
    final q = Query<UsuarioAcessoModel>(context)
      ..join(object: (w) => w.menu)
          .sortBy((s) => s.menuOrdem, QuerySortOrder.ascending)
      ..where((w) => w.menu.menuAtivo).equalTo('S')
      ..where((w) => w.menu.menuPai).equalTo(menuPai)
      ..where((w) => w.usuario.id).equalTo(idUsuario)
      ..sortBy((s) => s.id, QuerySortOrder.ascending);
    return q.fetch();
  }

  Future<List<UsuarioAcessoModel>>
      obterMenusPorMenuPaiLiberadosParaUsuarioPorSistema(
          String menuPai, int idUsuario, int idSistema) {
    final menuSistema = Query<UsuarioAcessoModel>(context)
      ..join(object: (j) => j.menu)
          .sortBy((s) => s.menuOrdem, QuerySortOrder.ascending)
      ..join(object: (j) => j.usuario)
      ..where((w) => w.usuario.id).equalTo(idUsuario)
      ..where((w) => w.usuario.usuariosistema.id).equalTo(idSistema)
      ..where((w) => w.menu.menuPai).equalTo(menuPai)
      ..where((w) => w.menu.menuAtivo).equalTo('S');
    return menuSistema.fetch();
  }

  Future<List<MenuSistemaModel>> obterMenusPorMenuPaiPorSistema(
      String menuPai, int idSistema) {
    final q = Query<MenuSistemaModel>(context)
      ..join(object: (j) => j.menu)
          .sortBy((s) => s.menuOrdem, QuerySortOrder.ascending)
      ..join(object: (j) => j.sistema)
      ..where((w) => w.menu.menuAtivo).equalTo('S')
      ..where((w) => w.menu.menuPai).equalTo(menuPai)
      ..where((w) => w.sistema.id).equalTo(idSistema)
      ..sortBy((s) => s.id, QuerySortOrder.ascending);
    final ret = q.fetch();
    return ret;
  }
}
