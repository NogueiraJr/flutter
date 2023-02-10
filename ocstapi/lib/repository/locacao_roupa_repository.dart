import 'dart:convert';

import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_arquivar_request.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_cancelar_request.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_devolver_request.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_ins_request.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_retirar_request.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_upd_request.dart';
import 'package:ocstapi/model/locacao_roupa_item_model.dart';
import 'package:ocstapi/model/locacao_roupa_model.dart';
import 'package:ocstapi/repository/cliente_repository.dart';
import 'package:ocstapi/repository/produto_repository.dart';
import 'package:ocstapi/repository/usuario_repository.dart';

import '../ocstapi.dart';

class LocacaoRoupaRepository {
  LocacaoRoupaRepository(this.context)
      : usuarioRepository = UsuarioRepository(context),
        clienteRepository = ClienteRepository(context),
        produtoRepository = ProdutoRepository(context);
  final ManagedContext context;
  final UsuarioRepository usuarioRepository;
  final ClienteRepository clienteRepository;
  final ProdutoRepository produtoRepository;

  Future<LocacaoRoupaModel> obterLocacaoRoupaPorId(int id) async {
    try {
      final query = Query<LocacaoRoupaModel>(context)
        ..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<LocacaoRoupaModel>> obterLocacaoRoupaPorClienteId(int id) async {
    try {
      final query = Query<LocacaoRoupaModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.cliente.id).equalTo(id);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<LocacaoRoupaModel>> obterLocacaoRoupaPorUsuarioId(int id) async {
    try {
      final query = Query<LocacaoRoupaModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.usuario.id).equalTo(id)
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> locacaoIns(LocacaoRoupaInsRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final cliente =
          await clienteRepository.obterClientePorId(request.clienteId);
      final model = LocacaoRoupaModel();
      model.usuario = usuario;
      model.cliente = cliente;
      model.descricao = request.descricao ?? "";
      model.provar = request.provar;
      model.retirar = request.retirar;
      model.devolver = request.devolver;
      model.valor = request.valor;
      model.observacao = request.observacao ?? "";
      model.tags = request.tags ?? "";
      model.ativo = request.ativo ?? "S";
      final locacaoId = await context.insertObject(model).then((t) => t.id);
      await locacaoItensIns(locacaoId, request.locacaoRoupaItens);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // ignore: type_annotate_public_apis
  T cast<T>(x) => x is T ? x : null;

  Future<void> locacaoItensIns(int locacaoId, String itens) async {
    try {
      final map = jsonDecode(itens);
      final produtosEscolhidos = map["produtosEscolhidos"];
      final model = LocacaoRoupaItemModel();
      // ignore: prefer_foreach
      for (var produto in produtosEscolhidos) {
        model.produto = await produtoRepository
            .obterProdutoPorId(cast<int>(produto["produtoId"]));
        model.locacaoRoupa = await obterLocacaoRoupaPorId(locacaoId);
        model.qtde = cast<int>(produto["qtde"]);
        model.observacao = cast<String>(produto["observacao"]);
        await context.insertObject(model);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<LocacaoRoupaItemModel>> consultarProdutosDaLocacao(int id) async {
    try {
      final query = Query<LocacaoRoupaItemModel>(context)
        ..join(object: (j) => j.produto)
        // ..join(object: (j) => j.locacaoRoupa)
        ..where((w) => w.locacaoRoupa.id).equalTo(id)
        ..sortBy((s) => s.id, QuerySortOrder.ascending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> locacaoRetirar(LocacaoRoupaRetirarRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<LocacaoRoupaModel>(context)
        ..values.usuario = usuario
        ..values.retirado = request.retirado
        ..where((w) => w.id).equalTo(request.locacaoId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> locacaoDevolver(LocacaoRoupaDevolverRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<LocacaoRoupaModel>(context)
        ..values.usuario = usuario
        ..values.devolvido = request.devolvido
        ..where((w) => w.id).equalTo(request.locacaoId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> locacaoArquivar(LocacaoRoupaArquivarRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<LocacaoRoupaModel>(context)
        ..values.usuario = usuario
        ..values.ativo = 'N'
        ..where((w) => w.id).equalTo(request.locacaoId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> locacaoCancelar(LocacaoRoupaCancelarRequest request) async {
    try {
      final query = Query<LocacaoRoupaModel>(context)
        ..where((w) => w.id).equalTo(request.locacaoId);
      final ret = await query.delete();
      return ret > 0;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<int> obterQtdeLocacoes(int id, String ref) async {
    try {
      switch (ref) {
        case 'ativas':
          return await obterQtdeLocacoesAtivas(id);
          break;
        case 'retirar':
          return await obterQtdeLocacoesParaRetirar(id);
          break;
        case 'devolver':
          return await obterQtdeLocacoesParaDevolver(id);
          break;
        case 'devolvidas':
          return await obterQtdeLocacoesDevolvidas(id);
          break;
        case 'arquivadas':
          return await obterQtdeLocacoesArquivadas(id);
          break;
      }
      return 0;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> obterQtdeLocacoesAtivas(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.ativo).equalTo('S');
      final ret = await query.fetch();
      return ret.length;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> obterQtdeLocacoesParaRetirar(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.retirar).isNotNull()
        ..where((w) => w.retirado).isNull()
        ..where((w) => w.ativo).equalTo('S');
      final ret = await query.fetch();
      return ret.length;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> obterQtdeLocacoesParaDevolver(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.devolver).isNotNull()
        ..where((w) => w.retirado).isNotNull()
        ..where((w) => w.devolvido).isNull()
        ..where((w) => w.ativo).equalTo('S');
      final ret = await query.fetch();
      return ret.length;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> obterQtdeLocacoesDevolvidas(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.devolvido).isNotNull()
        ..where((w) => w.ativo).equalTo('S');
      final ret = await query.fetch();
      return ret.length;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> obterQtdeLocacoesArquivadas(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.ativo).equalTo('N');
      final ret = await query.fetch();
      return ret.length;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<LocacaoRoupaModel>> obterLocacaoRoupaPorUsuarioEmpresaId(
      int id, String ref) async {
    try {
      switch (ref) {
        case 'ativas':
          return await obterTodasLocacoesRoupasAtivas(id);
          break;
        case 'retirar':
          return await obterLocacoesParaRetirar(id);
          break;
        case 'devolver':
          return await obterLocacoesParaDevolver(id);
          break;
        case 'devolvidas':
          return await obterLocacoesDevolvidas(id);
          break;
        case 'arquivadas':
          return await obterLocacoesArquivadas(id);
          break;
      }
      return await obterTodasLocacoesRoupas(id);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<LocacaoRoupaModel>> obterTodasLocacoesRoupas(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        // ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<LocacaoRoupaModel>> obterTodasLocacoesRoupasAtivas(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<LocacaoRoupaModel>> obterLocacoesParaRetirar(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.retirar).isNotNull()
        ..where((w) => w.retirado).isNull()
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<LocacaoRoupaModel>> obterLocacoesParaDevolver(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.devolver).isNotNull()
        ..where((w) => w.retirado).isNotNull()
        ..where((w) => w.devolvido).isNull()
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<LocacaoRoupaModel>> obterLocacoesDevolvidas(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.devolvido).isNotNull()
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<LocacaoRoupaModel>> obterLocacoesArquivadas(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<LocacaoRoupaModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.ativo).equalTo('N')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> locacaoRoupaUpdTagsApenas(LocacaoRoupaUpdRequest request) async {
    try {
      final query = Query<LocacaoRoupaModel>(context)
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
}
