import 'package:ocstapi/controllers/fornecedor/dto/fornecedor_del_request.dart';
import 'package:ocstapi/controllers/fornecedor/dto/fornecedor_ins_request.dart';
import 'package:ocstapi/controllers/fornecedor/dto/fornecedor_upd_request.dart';
import 'package:ocstapi/model/fornecedor_model.dart';
import 'package:ocstapi/repository/usuario_repository.dart';

import '../ocstapi.dart';

class FornecedorRepository {
  FornecedorRepository(this.context)
      : usuarioRepository = UsuarioRepository(context);
  final ManagedContext context;
  final UsuarioRepository usuarioRepository;

  Future<FornecedorModel> fornecedorIns(FornecedorInsRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final model = FornecedorModel();
      model.usuario = usuario;
      model.nome = request.nome;
      model.telefone = request.telefone;
      model.email = request.email;
      model.tags = request.tags;
      model.ativo = request.ativo;
      return await context.insertObject(model);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> fornecedorUpd(FornecedorUpdRequest request) async {
    try {
      //final usuarioId = await usuarioRepository
      //    .consultarUsuarioPorId(request.usuarioId)
      //    .then((r) => r.id);
      final query = Query<FornecedorModel>(context)
        ..values.nome = request.nome
        ..values.email = request.email
        ..values.telefone = request.telefone
        ..values.tags = request.tags
        ..where((w) => w.id).equalTo(request.id)
        ..where((w) => w.usuario.id).equalTo(request.usuarioId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> fornecedorUpdTagsApenas(FornecedorUpdRequest request) async {
    try {
      final query = Query<FornecedorModel>(context)
        ..values.tags = request.tags
        ..where((w) => w.id).equalTo(request.id)
        ..where((w) => w.usuario.id).equalTo(request.usuarioId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> fornecedorDel(FornecedorDelRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<FornecedorModel>(context)
        ..where((w) => w.id).equalTo(request.id)
        ..where((w) => w.usuario.id).equalTo(usuario.id);
      return await query.delete() > 0;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<FornecedorModel> obterFornecedorPorId(int id) async {
    try {
      final query = Query<FornecedorModel>(context)
        ..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<FornecedorModel>> obterFornecedoresPorIdUsuario(
      int idUsuario) async {
    try {
      final query = Query<FornecedorModel>(context)
        ..where((w) => w.usuario.id).equalTo(idUsuario);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<FornecedorModel>> obterFornecedoresPorNome(String nome) async {
    try {
      final query = Query<FornecedorModel>(context)
        ..where((w) => w.nome).contains(nome);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<FornecedorModel>> obterFornecedoresPorTelefone(
      String telefone) async {
    try {
      final query = Query<FornecedorModel>(context)
        ..where((w) => w.telefone).contains(telefone);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<FornecedorModel>> obterFornecedoresPorEmail(String email) async {
    try {
      final query = Query<FornecedorModel>(context)
        ..where((w) => w.email).contains(email);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<FornecedorModel>> obterAmostraFornecedoresDaEmpresa(
      List<int> usuariosDaEmpresa, int qtdeAmostra) async {
    try {
      if (qtdeAmostra > 0) {
        final query = Query<FornecedorModel>(context)
          ..join(object: (j) => j.usuario)
          ..where((w) => w.usuario.id).oneOf(usuariosDaEmpresa)
          ..fetchLimit = qtdeAmostra
          ..sortBy((s) => s.id, QuerySortOrder.descending);
        return await query.fetch();
      } else {
        final query = Query<FornecedorModel>(context)
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

  Future<List<FornecedorModel>> obterFornecedoresDaEmpresaDoUsuario(
      int idUsuario, List<int> idsUsuariosEmpresa) async {
    try {
      final idPai =
          await usuarioRepository.obterIdProprietarioDaEmpresa(idUsuario);
      idsUsuariosEmpresa.add(idPai); //Incluso o idPai, claro.

      return obterAmostraFornecedoresDaEmpresa(idsUsuariosEmpresa, 1000);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
