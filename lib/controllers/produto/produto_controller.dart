import 'dart:convert';

import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/produto_service.dart';

class ProdutoController extends ResourceController {
  ProdutoController(this.context) : service = ProdutoService(context);
  ManagedContext context;
  final ProdutoService service;

  @Operation.get('id')
  Future<Response> obterProdutoPorId(@Bind.path('id') int id) async {
    try {
      return Response.ok(await service.obterProdutoPorId(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterProdutoPorId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idProdutoResumo')
  Future<Response> obterResumoProdutoPorIdProduto(
      @Bind.path('idProdutoResumo') int id) async {
    try {
      // return Response.ok(await service.obterResumoProdutoPorIdProduto(id));
      return await service
          .obterResumoProdutoPorIdProduto(id)
          .then((data) async {
        return {
          'id': data.id,
          'codigo': data.codigo,
          'nome': data.nome,
          'descricao': data.descricao,
          'custo': data.custo ?? 0,
          'preco': data.preco ?? 0,
          'tags': data.tags ?? "",
          'usuarioId': data.usuario.id,
          'usuarioNome': data.usuario.pessoa,
          'compoe':
              await service.obterProdutoItemPorIdProdutoFilho(id).then((data) {
            return data
                .map((m) => {
                      'id': m.produto.id,
                      'usuarioId': 0,
                      'usuarioNome': '',
                      'codigo': m.produto.codigo,
                      'nome': m.produto.nome,
                      'descricao': m.produto.descricao,
                      'custo': m.produto.custo,
                      'preco': m.produto.preco,
                      'tags': m.produto.tags,
                      'compostoDe': [],
                      'compoe': [],
                    })
                .toList();
          }),
          'composto':
              await service.obterProdutoItemPorIdProdutoPai(id).then((data) {
            return data
                .map((m) => {
                      'id': m.produtoItem.id,
                      'usuarioId': 0,
                      'usuarioNome': '',
                      'codigo': m.produtoItem.codigo,
                      'nome': m.produtoItem.nome,
                      'descricao': m.produtoItem.descricao,
                      'custo': m.produtoItem.custo,
                      'preco': m.produtoItem.preco,
                      'tags': m.produtoItem.tags,
                      'compostoDe': [],
                      'compoe': [],
                    })
                .toList();
          })
        };
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterResumoProdutoPorIdProduto]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idUsuario')
  Future<Response> obterProdutosPorIdUsuario(
      @Bind.path('idUsuario') int idUsuario) async {
    try {
      return Response.ok(await service.obterProdutosPorIdUsuario(idUsuario));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterProdutosPorIdUsuario]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idUsuarioEmpresa', 'amostra')
  Future<Response> obterAmostraProdutosDaEmpresaInteiraPorUmIdUsuario(
      @Bind.path('idUsuarioEmpresa') String login,
      @Bind.path('amostra') int qtdeAmostra) async {
    try {
      return await service
          .obterAmostraProdutosDaEmpresa(login, qtdeAmostra)
          .then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'codigo': m.codigo,
                  'nome': m.nome,
                  'descricao': m.descricao,
                  'custo': m.custo ?? 0,
                  'preco': m.preco ?? 0,
                  'tags': m.tags ?? "",
                  'usuarioId': m.usuario.id,
                  'usuarioNome': m.usuario.pessoa,
                  'compostoDe': m.produtos.length,
                  'compoe': m.produtosItens.length
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterProdutosDaEmpresaInteiraPorUmIdUsuario]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('codigo')
  Future<Response> obterProdutosPorCodigo(
      @Bind.path('codigo') String codigo) async {
    try {
      return Response.ok(await service.obterProdutosPorNome(codigo));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterProdutosPorCodigo]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('nome')
  Future<Response> obterProdutosPorNome(@Bind.path('nome') String nome) async {
    try {
      return Response.ok(await service.obterProdutosPorNome(nome));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterProdutosPorNome]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('descricao')
  Future<Response> obterProdutosPorDescricao(
      @Bind.path('descricao') String descricao) async {
    try {
      return Response.ok(await service.obterProdutosPorDescricao(descricao));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterProdutosPorDescricao]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idProduto')
  Future<Response> obterProdutoItemPorIdProdutoPai(
      @Bind.path('idProduto') int id) async {
    try {
      return await service.obterProdutoItemPorIdProdutoPai(id).then((data) {
        return data
            .map((m) => {
                  'id': m.produtoItem.id,
                  'codigo': m.produtoItem.codigo,
                  'nome': m.produtoItem.nome,
                  'descricao': m.produtoItem.descricao,
                  'custo': m.produtoItem.custo,
                  'preco': m.produtoItem.preco,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterProdutoPorIdComProdutoItem]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idProdutoASerComposto')
  Future<Response> obterItensAindaDisponiveisParaComposicao(
      @Bind.path('idProdutoASerComposto') int id) async {
    try {
      final usuarioId = await service.obterUsuarioIdPorProdutoId(id);
      final produtos = await service.obterProdutosPorIdUsuario(usuarioId);
      final composicao = await service.obterProdutoItemPorIdProdutoPai(id);

      //Remover o próprio Produto Pai da Composição
      produtos.removeWhere((w) => w.id == id);
      //Remover os Produtos já presentes na Composição.
      for (var item in composicao) {
        produtos.removeWhere((w) => w.id == item.produtoItem.id);
      }

      return Response.ok(produtos
          .map((m) => {
                'id': m.id,
                'codigo': m.codigo,
                'nome': m.nome,
                'descricao': m.descricao,
              })
          .toList());
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterItensAindaDisponiveisParaComposicao]',
        'exception': e.toString()
      });
    }
  }
}
