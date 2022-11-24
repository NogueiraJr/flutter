import 'package:ocstapi/controllers/usuario/dto/gravar_sistema_usuario_request.dart';
import 'package:ocstapi/model/sistema_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/ocstapi.dart';

class SistemaRepository {
  SistemaRepository(this.context);
  final ManagedContext context;

  Future<List<SistemaModel>> obterSistemasAtivos() {
    final q = Query<SistemaModel>(context)
      ..where((w) => w.sistemaAtivo).equalTo('S')
      ..sortBy((s) => s.id, QuerySortOrder.ascending);
    return q.fetch();
  }

  Future<void> gravarSistemaUsuario(GravarSistemaUsuarioRequest request) async {
    final query = Query<UsuarioModel>(context)
      ..values.usuariosistema.id = request.idSistema
      ..where((w) => w.id).equalTo(request.id);
    await query.update();
  }

  Future<int> obterSistemaEscolhidoPeloUsuario(String login) async {
    try {
      final ret = await (Query<UsuarioModel>(context)
            ..where((w) => w.login).equalTo(login.toUpperCase()))
          .fetchOne()
          .then((t) => t.usuariosistema.id);
      return ret;
    } catch (e) {
      return 0;
    }
  }

  Future<SistemaModel> obterSistemaDoUsuarioPai(int idSistema) async {
    try {
      final ret = await (Query<SistemaModel>(context)
            ..where((w) => w.id).equalTo(idSistema))
          .fetchOne();
      return ret;
    } catch (e) {
      return null;
    }
  }

  Future<SistemaModel> obterDadosDoSistemaEscolhidoPeloUsuario(
      String login) async {
    try {
      final idSistema = await (Query<UsuarioModel>(context)
            ..where((w) => w.login).equalTo(login.toUpperCase()))
          .fetchOne()
          .then((t) => t.usuariosistema.id ?? 0);
      return await (Query<SistemaModel>(context)
            ..where((w) => w.id).equalTo(idSistema))
          .fetchOne();
    } catch (e) {
      return null;
    }
  }
}
