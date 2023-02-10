import 'package:ocstapi/controllers/produto/dto/produto_del_request.dart';
import 'package:ocstapi/controllers/produto/dto/produto_ins_request.dart';
import 'package:ocstapi/controllers/produto/dto/produto_item_del_request.dart';
import 'package:ocstapi/controllers/produto/dto/produto_item_ins_request.dart';
import 'package:ocstapi/controllers/produto/dto/produto_upd_request.dart';
import 'package:ocstapi/model/produto_item_model.dart';
import 'package:ocstapi/model/produto_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/repository/usuario_repository.dart';

import '../ocstapi.dart';

class ProdutoRepository {
  ProdutoRepository(this.context)
      : usuarioRepository = UsuarioRepository(context);
  final ManagedContext context;
  final UsuarioRepository usuarioRepository;

  Future<ProdutoModel> produtoIns(ProdutoInsRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final model = ProdutoModel();
      model.usuario = usuario;
      model.codigo = request.codigo;
      model.nome = request.nome;
      model.descricao = request.descricao;
      model.custo = request.custo;
      model.preco = request.preco;
      model.tags = request.tags;
      model.ativo = "S";
      return await context.insertObject(model);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> produtoUpd(ProdutoUpdRequest request) async {
    try {
      final query = Query<ProdutoModel>(context)
        ..values.codigo = request.codigo
        ..values.nome = request.nome
        ..values.descricao = request.descricao
        ..values.custo = request.custo
        ..values.preco = request.preco
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

  Future<bool> produtoUpdTagsApenas(ProdutoUpdRequest request) async {
    try {
      final query = Query<ProdutoModel>(context)
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

  Future<String> produtoDel(ProdutoDelRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<ProdutoModel>(context)
        ..where((w) => w.id).equalTo(request.id)
        ..where((w) => w.usuario.id).equalTo(usuario.id);
      return await query.delete() > 0
          ? 'Apaguei o Produto com sucesso.'
          : 'Não achei o Produto para apagar.';
    } catch (e) {
      print(e);
      return 'Problemas ao apagar o Produto.';
    }
  }

  Future<ProdutoModel> obterProdutoPorId(int id) async {
    try {
      final query = Query<ProdutoModel>(context)
        ..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ProdutoModel>> obterProdutosPorIdUsuario(int idUsuario) async {
    try {
      final query = Query<ProdutoModel>(context)
        ..where((w) => w.usuario.id).equalTo(idUsuario);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ProdutoModel>> obterProdutosDaEmpresaDoUsuario(
      int idUsuario, List<int> idsUsuariosEmpresa) async {
    try {
      final idPai =
          await usuarioRepository.obterIdProprietarioDaEmpresa(idUsuario);
      // final idsUsuariosEmpresa =
      //     await usuarioRepository.obterListaIdsUsuariosFilhosPorIdPai(idPai);
      idsUsuariosEmpresa.add(idPai); //Incluso o idPai, claro.

      return obterAmostraProdutosDaEmpresa(idsUsuariosEmpresa, 1000);
      // final query = Query<ProdutoModel>(context)
      //   ..where((w) => w.usuario.id).contains(idsUsuariosEmpresa.toString());
      // return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ProdutoModel>> obterProdutosPorCodigo(String codigo) async {
    try {
      final query = Query<ProdutoModel>(context)
        ..where((w) => w.codigo).contains(codigo);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ProdutoModel>> obterProdutosPorNome(String nome) async {
    try {
      final query = Query<ProdutoModel>(context)
        ..where((w) => w.nome).contains(nome);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ProdutoModel>> obterProdutosPorDescricao(String descricao) async {
    try {
      final query = Query<ProdutoModel>(context)
        ..where((w) => w.descricao).contains(descricao);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ProdutoModel>> obterAmostraProdutosDaEmpresa(
      List<int> usuariosDaEmpresa, int qtdeAmostra) async {
    try {
      if (qtdeAmostra > 0) {
        final query = Query<ProdutoModel>(context)
          ..join(object: (j) => j.usuario)
          //para contar quantos produtos compoem este produto
          ..join(set: (j) => j.produtos)
          //para contar quantos produtos são compostos por este produto
          ..join(set: (j) => j.produtosItens)
          ..where((w) => w.usuario.id).oneOf(usuariosDaEmpresa)
          ..fetchLimit = qtdeAmostra
          ..sortBy((s) => s.id, QuerySortOrder.descending);
        return await query.fetch();
      } else {
        final query = Query<ProdutoModel>(context)
          ..join(object: (j) => j.usuario)
          //para contar quantos produtos compoem este produto
          ..join(set: (j) => j.produtos)
          //para contar quantos produtos são compostos por este produto
          ..join(set: (j) => j.produtosItens)
          ..where((w) => w.usuario.id).oneOf(usuariosDaEmpresa)
          ..sortBy((s) => s.id, QuerySortOrder.descending);
        return await query.fetch();
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ProdutoItemModel>> obterProdutoItemPorIdProdutoPai(int id) async {
    try {
      final query = Query<ProdutoItemModel>(context)
        ..join(object: (j) => j.produtoItem)
        ..where((w) => w.produto.id).equalTo(id)
        ..sortBy((s) => s.id, QuerySortOrder.ascending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ProdutoItemModel>> obterProdutoItemPorIdProdutoFilho(
      int id) async {
    try {
      final query = Query<ProdutoItemModel>(context)
        ..join(object: (j) => j.produto)
        ..where((w) => w.produtoItem.id).equalTo(id)
        ..sortBy((s) => s.id, QuerySortOrder.ascending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ProdutoItemModel> produtoItemIns(ProdutoItemInsRequest request) async {
    try {
      final produto = await obterProdutoPorId(request.produtoId);
      final produtoItem = await obterProdutoPorId(request.produtoItemId);
      final model = ProdutoItemModel();
      model.produto = produto;
      model.produtoItem = produtoItem;
      return await context.insertObject(model);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> produtoItemDel(ProdutoItemDelRequest request) async {
    try {
      final query = Query<ProdutoItemModel>(context);
      if (request.produtoItemId > 0) {
        //Apagar o Produto em todos os produtos onde ele existe.
        query.where((w) => w.produtoItem.id).equalTo(request.produtoItemId);
      }
      if (request.produtoId > 0) {
        //Apagar todas as Composições do Produto.
        query.where((w) => w.produto.id).equalTo(request.produtoId);
      }
      //Só apaga se um (ou os dois) caso(s) acima for(em) verdadeiro(s).
      if (request.produtoItemId > 0 || request.produtoId > 0) {
        return await query.delete() > 0
            ? 'Apaguei o Produto com sucesso.'
            : 'Não achei o Produto para apagar.';
      } else {
        return 'Não apaguei o Produto.\nProblemas com alguma alguma dependência.';
      }
    } catch (e) {
      print(e);
      return 'Problemas ao apagar o Produto.';
    }
  }

  Future<ProdutoModel> obterResumoProdutoPorIdProduto(int id) async {
    try {
      final query = Query<ProdutoModel>(context)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
