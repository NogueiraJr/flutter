import 'package:ocstapi/model/menu_model.dart';
import 'package:ocstapi/model/menu_sistema_model.dart';
import 'package:ocstapi/model/usuario_acesso_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/menu_repository.dart';

class MenuService {
  MenuService(this.context) : repository = MenuRepository(context);
  final ManagedContext context;
  final MenuRepository repository;

  Future<List<MenuModel>> obterMenusPorMenuPai(String menuPai) {
    return repository.obterMenusPorMenuPai(menuPai);
  }

  Future<List<UsuarioAcessoModel>> obterMenusPorMenuPaiLiberadosParaUsuario(
      String menuPai, int idUsuario) {
    return repository.obterMenusPorMenuPaiLiberadosParaUsuario(
        menuPai, idUsuario);
  }

  Future<List<UsuarioAcessoModel>>
      obterMenusPorMenuPaiLiberadosParaUsuarioPorSistema(
          String menuPai, int idUsuario, int idSistema) {
    return repository.obterMenusPorMenuPaiLiberadosParaUsuarioPorSistema(
        menuPai, idUsuario, idSistema);
  }

  Future<List<MenuSistemaModel>> obterMenusPorMenuPaiPorSistema(
      String menuPai, int idSistema) {
    return repository.obterMenusPorMenuPaiPorSistema(menuPai, idSistema);
  }
}
