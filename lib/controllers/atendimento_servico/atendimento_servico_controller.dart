import 'package:intl/intl.dart';
import 'package:ocstapi/services/atendimento_servico_service.dart';
import 'package:intl/date_symbol_data_local.dart';

class AtendimentoServicoController extends ResourceController {
  AtendimentoServicoController(this.context)
      : service = AtendimentoServicoService(context);
  ManagedContext context;
  final AtendimentoServicoService service;

  @Operation.get('id')
  Future<Response> obterAtendimentoServicoPorId(@Bind.path('id') int id) async {
    try {
      return Response.ok(await service.obterAtendimentoServicoPorId(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterAtendimentoServicoPorId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('clienteId')
  Future<Response> obterAtendimentoServicoPorClienteId(
      @Bind.path('clienteId') int id) async {
    final DateFormat dF = DateFormat('dd-MM-yyyy hh:mm');
    try {
      return service.obterAtendimentoServicoPorClienteId(id).then((data) {
        return data
            .map((c) => {
                  'id': c.id,
                  'descricao': c.descricao,
                  'iniciar': c.iniciar != null ? dF.format(c.iniciar) : null,
                  'finalizar':
                      c.finalizar != null ? dF.format(c.finalizar) : null,
                  'iniciado': c.iniciado != null ? dF.format(c.iniciado) : null,
                  'finalizado':
                      c.finalizado != null ? dF.format(c.finalizado) : null,
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
        'message': 'ERRO [obterAtendimentoServicoPorClienteId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('usuarioId')
  Future<Response> obterAtendimentoServicoPorUsuarioId(
      @Bind.path('usuarioId') int id) async {
    await initializeDateFormatting().then((_) => {});
    // final DateFormat dF = DateFormat.Hm('pt_BR');
    final DateFormat dF = DateFormat('dd/MM/yyyy HH:mm');
    final DateFormat dFS = DateFormat('EEEE', 'pt_BR');
    try {
      return service.obterAtendimentoServicoPorUsuarioId(id).then((data) {
        return data
            .map((c) => {
                  'id': c.id,
                  'descricao': c.descricao,
                  'iniciar':
                      c.iniciar != null ? dF.format(c.iniciar.toLocal()) : null,
                  'finalizar': c.finalizar != null
                      ? dF.format(c.finalizar.toLocal())
                      : null,
                  'iniciado': c.iniciado != null
                      ? dF.format(c.iniciado.toLocal())
                      : null,
                  'finalizado': c.finalizado != null
                      ? dF.format(c.finalizado.toLocal())
                      : null,
                  //
                  'iniciarSemana': c.iniciar != null
                      ? dFS.format(c.iniciar.toLocal())
                      : null,
                  'finalizarSemana': c.finalizar != null
                      ? dFS.format(c.finalizar.toLocal())
                      : null,
                  'iniciadoSemana': c.iniciado != null
                      ? dFS.format(c.iniciado.toLocal())
                      : null,
                  'finalizadoSemana': c.finalizado != null
                      ? dFS.format(c.finalizado.toLocal())
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
        'message': 'ERRO [obterAtendimentoServicoPorUsuarioId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('usuarioEmpresaId', 'ref', 'opc', 'quando')
  Future<Response> obterAtendimentoServicoPorUsuarioEmpresaId(
      @Bind.path('usuarioEmpresaId') int id,
      @Bind.path('ref') String ref,
      @Bind.path('opc') String opc,
      @Bind.path('quando') String quando) async {
    await initializeDateFormatting().then((_) => {});
    // final DateFormat dF = DateFormat.Hm('pt_BR');
    final DateFormat dF = DateFormat('dd/MM/yyyy HH:mm');
    final DateFormat dFS = DateFormat('EEEE', 'pt_BR');
    try {
      return service
          .obterAtendimentoServicoPorUsuarioEmpresaId(id, ref, opc, quando)
          .then((data) {
        return data
            .map((c) => {
                  'id': c.id,
                  'descricao': c.descricao,
                  'iniciar':
                      c.iniciar != null ? dF.format(c.iniciar.toLocal()) : null,
                  'finalizar': c.finalizar != null
                      ? dF.format(c.finalizar.toLocal())
                      : null,
                  'iniciado': c.iniciado != null
                      ? dF.format(c.iniciado.toLocal())
                      : null,
                  'finalizado': c.finalizado != null
                      ? dF.format(c.finalizado.toLocal())
                      : null,
                  //
                  'iniciarSemana': c.iniciar != null
                      ? dFS.format(c.iniciar.toLocal())
                      : null,
                  'finalizarSemana': c.finalizar != null
                      ? dFS.format(c.finalizar.toLocal())
                      : null,
                  'iniciadoSemana': c.iniciado != null
                      ? dFS.format(c.iniciado.toLocal())
                      : null,
                  'finalizadoSemana': c.finalizado != null
                      ? dFS.format(c.finalizado.toLocal())
                      : null,
                  //
                  'valor': c.valor,
                  'observacao': c.observacao,
                  'ativo': c.ativo,
                  'usuarioId': c.usuario.id,
                  'usuarioPessoa': c.usuario.pessoa,
                  'clienteId': c.cliente.id,
                  'clienteNome': c.cliente.nome,
                  // //refOficinaCarros
                  // 'clienteVeiculoId':
                  //     c.atendimentoServicoObjeto.first.clienteVeiculo != null
                  //         ? c.atendimentoServicoObjeto.first.clienteVeiculo.id
                  //         : 0,
                  // //
                  'tags': c.tags,
                  'faturado': c.movimentacoes
                      .any((w) => w.atendimentoServico.id == c.id),
                  'faturadoQtdeParcelas': c.movimentacoes
                      .where((w) => w.atendimentoServico.id == c.id)
                      .length
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterAtendimentoServicoPorUsuarioEmpresaId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('atendimentoServicoId')
  Future<Response> consultarProdutosDoAtendimento(
      @Bind.path('atendimentoServicoId') int id) async {
    try {
      return service.consultarProdutosDoAtendimento(id).then((data) {
        return data
            .map((c) => {
                  'atendimentoServicoId': c.atendimentoServico.id,
                  'itemAtendimentoServicoId': c.id,
                  'itemAtendimentoServicoQtde': c.qtde,
                  'itemAtendimentoServicoObservacao': c.observacao,
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
  Future<Response> obterQtde(@Bind.path('usuarioEmpresaId') int id,
      @Bind.path('refQtde') String ref) async {
    await initializeDateFormatting().then((_) => {});
    try {
      final numero = await service.obterQtdes(id, ref);
      return Response.ok({'resposta': numero.toString()});
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterQtdeLocacoes]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('atendimentoServicoIdVeiculo')
  Future<Response> obterClienteVeiculoPorIdAtendimento(
      @Bind.path('atendimentoServicoIdVeiculo') int id) async {
    try {
      return Response.ok(await service.obterClienteVeiculoPorIdAtendimento(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClienteVeiculoPorIdAtendimento]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('atendimentoServicoIdPet')
  Future<Response> obterClientePetPorIdAtendimento(
      @Bind.path('atendimentoServicoIdPet') int id) async {
    try {
      return Response.ok(await service.obterClientePetPorIdAtendimento(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClientePetPorIdAtendimento]',
        'exception': e.toString()
      });
    }
  }
}
