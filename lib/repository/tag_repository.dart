import 'package:ocstapi/controllers/tag/dto/tag_del_request.dart';
import 'package:ocstapi/controllers/tag/dto/tag_ins_request.dart';
import 'package:ocstapi/controllers/tag/dto/tag_upd_request.dart';
import 'package:ocstapi/model/tag_model.dart';
import 'package:ocstapi/repository/usuario_repository.dart';

import '../ocstapi.dart';

class TagRepository {
  TagRepository(this.context) : usuarioRepository = UsuarioRepository(context);
  final ManagedContext context;
  final UsuarioRepository usuarioRepository;

  Future<TagModel> tagIns(TagInsRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final model = TagModel();
      model.usuario = usuario;
      model.nome = request.nomeNovo;
      model.descricao = request.descricao;
      return await context.insertObject(model);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> tagUpd(TagUpdRequest request) async {
    try {
      final query = Query<TagModel>(context)
        ..values.nome = request.nomeNovo
        ..values.descricao = request.descricao
        ..where((w) => w.id).equalTo(request.id)
        ..where((w) => w.usuario.id).equalTo(request.usuarioId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> tagDel(TagDelRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<TagModel>(context)
        ..where((w) => w.id).equalTo(request.id)
        ..where((w) => w.usuario.id).equalTo(usuario.id);
      return await query.delete() > 0;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<TagModel> obterTagPorId(int id) async {
    try {
      final query = Query<TagModel>(context)..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> obterNomeTagPorId(int id) async {
    try {
      final query = Query<TagModel>(context)..where((w) => w.id).equalTo(id);
      return await query.fetchOne().then((t) => t.nome);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<TagModel>> obterTagsPorIdUsuario(int idUsuario) async {
    try {
      final query = Query<TagModel>(context)
        ..where((w) => w.usuario.id).equalTo(idUsuario);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<TagModel>> obterTagsDaEmpresaDoUsuario(
      int idUsuario, List<int> idsUsuariosEmpresa) async {
    try {
      final idPai =
          await usuarioRepository.obterIdProprietarioDaEmpresa(idUsuario);
      idsUsuariosEmpresa.add(idPai); //Incluso o idPai, claro.

      return obterAmostraTagsDaEmpresa(idsUsuariosEmpresa, 1000);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<TagModel>> obterTagsPorNome(
      int id, String nome, List<int> usuariosDaEmpresa) async {
    try {
      if (id > 0) {
        final query = Query<TagModel>(context)
          ..where((w) => w.nome).equalTo(nome)
          ..where((w) => w.usuario.id).oneOf(usuariosDaEmpresa)
          ..where((w) => w.id).notEqualTo(id);
        return await query.fetch();
      } else {
        final query = Query<TagModel>(context)
          ..where((w) => w.nome).equalTo(nome)
          ..where((w) => w.usuario.id).oneOf(usuariosDaEmpresa);
        return await query.fetch();
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<TagModel>> obterAmostraTagsDaEmpresa(
      List<int> usuariosDaEmpresa, int qtdeAmostra) async {
    try {
      if (qtdeAmostra > 0) {
        final query = Query<TagModel>(context)
          ..join(object: (j) => j.usuario)
          ..where((w) => w.usuario.id).oneOf(usuariosDaEmpresa)
          ..fetchLimit = qtdeAmostra
          ..sortBy((s) => s.nome, QuerySortOrder.ascending);
        return await query.fetch();
      } else {
        final query = Query<TagModel>(context)
          ..join(object: (j) => j.usuario)
          ..where((w) => w.usuario.id).oneOf(usuariosDaEmpresa)
          ..sortBy((s) => s.id, QuerySortOrder.descending);
        return await query.fetch();
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
