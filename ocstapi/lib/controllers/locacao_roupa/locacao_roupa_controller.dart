import 'package:intl/intl.dart';
import 'package:ocstapi/services/locacao_roupa_service.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../ocstapi.dart';

class LocacaoRoupaController extends ResourceController {
  LocacaoRoupaController(this.context) : service = LocacaoRoupaService(context);
  ManagedContext context;
  final LocacaoRoupaService service;

  @Operation.get('id')
  Future<Response> obterLocacaoRoupaPorId(@Bind.path('id') int id) async {
    try {
      return Response.ok(await service.obterLocacaoRoupaPorId(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterLocacaoRoupaPorId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('clienteId')
  Future<Response> obterLocacaoRoupaPorClienteId(
      @Bind.path('clienteId') int id) async {
    final DateFormat dF = DateFormat('dd-MM-yyyy hh:mm');
    try {
      return service.obterLocacaoRoupaPorClienteId(id).then((data) {
        return data
            .map((c) => {
                  'id': c.id,
                  'descricao': c.descricao,
                  'provar': c.provar != null ? dF.format(c.provar) : null,
                  'retirar': c.retirar != null ? dF.format(c.retirar) : null,
                  'devolver': c.devolver != null ? dF.format(c.devolver) : null,
                  'retirado': c.retirado != null ? dF.format(c.retirado) : null,
                  'devolvido':
                      c.devolvido != null ? dF.format(c.devolvido) : null,
                  'valor': c.valor,
                  'observacao': c.observacao,
                  'ativo': c.ativo,
                  'clienteId': c.cliente.id,
                  'clienteNome': c.cliente.nome,
                  'usuarioId': c.usuario.id,
                  'usuarioPessoa': c.usuario.pessoa,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterLocacaoRoupaPorClienteId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('usuarioId')
  Future<Response> obterLocacaoRoupaPorUsuarioId(
      @Bind.path('usuarioId') int id) async {
    await initializeDateFormatting().then((_) => {});
    // final DateFormat dF = DateFormat.Hm('pt_BR');
    final DateFormat dF = DateFormat('dd/MM/yyyy HH:mm');
    final DateFormat dFS = DateFormat('EEEE', 'pt_BR');
    try {
      return service.obterLocacaoRoupaPorUsuarioId(id).then((data) {
        return data
            .map((c) => {
                  'id': c.id,
                  'descricao': c.descricao,
                  'provar':
                      c.provar != null ? dF.format(c.provar.toLocal()) : null,
                  'retirar':
                      c.retirar != null ? dF.format(c.retirar.toLocal()) : null,
                  'devolver': c.devolver != null
                      ? dF.format(c.devolver.toLocal())
                      : null,
                  'retirado': c.retirado != null
                      ? dF.format(c.retirado.toLocal())
                      : null,
                  'devolvido': c.devolvido != null
                      ? dF.format(c.devolvido.toLocal())
                      : null,
                  //
                  'provarSemana':
                      c.provar != null ? dFS.format(c.provar.toLocal()) : null,
                  'retirarSemana': c.retirar != null
                      ? dFS.format(c.retirar.toLocal())
                      : null,
                  'devolverSemana': c.devolver != null
                      ? dFS.format(c.devolver.toLocal())
                      : null,
                  'retiradoSemana': c.retirado != null
                      ? dFS.format(c.retirado.toLocal())
                      : null,
                  'devolvidoSemana': c.devolvido != null
                      ? dFS.format(c.devolvido.toLocal())
                      : null,
                  //
                  'valor': c.valor,
                  'observacao': c.observacao,
                  'ativo': c.ativo,
                  'clienteId': c.cliente.id,
                  'clienteNome': c.cliente.nome,
                  'usuarioId': c.usuario.id,
                  'usuarioPessoa': c.usuario.pessoa,
                  'tags': c.tags,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterLocacaoRoupaPorUsuarioId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('usuarioEmpresaId', 'ref')
  Future<Response> obterLocacaoRoupaPorUsuarioEmpresaId(
      @Bind.path('usuarioEmpresaId') int id,
      @Bind.path('ref') String ref) async {
    await initializeDateFormatting().then((_) => {});
    // final DateFormat dF = DateFormat.Hm('pt_BR');
    final DateFormat dF = DateFormat('dd/MM/yyyy HH:mm');
    final DateFormat dFS = DateFormat('EEEE', 'pt_BR');
    try {
      return service.obterLocacaoRoupaPorUsuarioEmpresaId(id, ref).then((data) {
        return data
            .map((c) => {
                  'id': c.id,
                  'descricao': c.descricao,
                  'provar':
                      c.provar != null ? dF.format(c.provar.toLocal()) : null,
                  'retirar':
                      c.retirar != null ? dF.format(c.retirar.toLocal()) : null,
                  'devolver': c.devolver != null
                      ? dF.format(c.devolver.toLocal())
                      : null,
                  'retirado': c.retirado != null
                      ? dF.format(c.retirado.toLocal())
                      : null,
                  'devolvido': c.devolvido != null
                      ? dF.format(c.devolvido.toLocal())
                      : null,
                  //
                  'provarSemana':
                      c.provar != null ? dFS.format(c.provar.toLocal()) : null,
                  'retirarSemana': c.retirar != null
                      ? dFS.format(c.retirar.toLocal())
                      : null,
                  'devolverSemana': c.devolver != null
                      ? dFS.format(c.devolver.toLocal())
                      : null,
                  'retiradoSemana': c.retirado != null
                      ? dFS.format(c.retirado.toLocal())
                      : null,
                  'devolvidoSemana': c.devolvido != null
                      ? dFS.format(c.devolvido.toLocal())
                      : null,
                  //
                  'valor': c.valor,
                  'observacao': c.observacao,
                  'ativo': c.ativo,
                  'clienteId': c.cliente.id,
                  'clienteNome': c.cliente.nome,
                  'usuarioId': c.usuario.id,
                  'usuarioPessoa': c.usuario.pessoa,
                  'tags': c.tags,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterLocacaoRoupaPorUsuarioEmpresaId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('locacaoRoupaId')
  Future<Response> consultarProdutosDaLocacao(
      @Bind.path('locacaoRoupaId') int id) async {
    try {
      return service.consultarProdutosDaLocacao(id).then((data) {
        return data
            .map((c) => {
                  'itemLocacaoId': c.id,
                  'locacaoRoupaId': c.locacaoRoupa.id,
                  'itemLocacaoQtde': c.qtde,
                  'itemLocacaoObservacao': c.observacao,
                  'produtoId': c.produto.id,
                  'produtoCodigo': c.produto.codigo,
                  'produtoNome': c.produto.nome,
                  'produtoDescricao': c.produto.descricao,
                  'produtoPreco': c.produto.preco,
                  'produtoTags': c.produto.tags,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [consultarProdutosDaLocacao]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('usuarioEmpresaId', 'refQtde')
  Future<Response> obterQtdeLocacoes(@Bind.path('usuarioEmpresaId') int id,
      @Bind.path('refQtde') String ref) async {
    await initializeDateFormatting().then((_) => {});
    try {
      final numero = await service.obterQtdeLocacoes(id, ref);
      return Response.ok({'resposta': numero.toString()});
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterQtdeLocacoes]',
        'exception': e.toString()
      });
    }
  }
}
