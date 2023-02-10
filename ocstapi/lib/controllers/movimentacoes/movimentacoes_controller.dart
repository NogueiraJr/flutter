import 'package:intl/intl.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/salvar_movimentacao_request.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/services/movimentacoes_service.dart';

import '../../ocstapi.dart';

class MovimentacoesController extends ResourceController {
  MovimentacoesController(this.context)
      : service = MovimentacoesService(context);
  final ManagedContext context;
  final MovimentacoesService service;

  @Operation.get('ref', 'id')
  Future<Response> buscarMovimentacoesPorFaturamento(
      @Bind.path('ref') String ref, @Bind.path('id') int id) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    final UsuarioModel usuario = request.attachments['userId'] as UsuarioModel;
    //Buscar as Movimentações
    return service
        .buscarMovimentacoesPorFaturamento(usuario, ref, id)
        .then((data) {
      return data
          .map((m) => {
                'id': m.id,
                'dataMovimentacao': m.dataMovimentacao != null
                    ? dateFormat.format(m.dataMovimentacao.toLocal())
                    : '',
                'dataEfetivacao': m.dataEfetivacao != null
                    ? dateFormat.format(m.dataEfetivacao.toLocal())
                    : '',
                'descricao': m.descricao,
                'valor': m.valor,

                //'catagoriaNome': m.categoria.nome,
                'categoria': {
                  'id': m.categoria.id,
                  'nome': m.categoria.nome,
                  'tipo': m.categoria.tipoCategoria.toString()
                },

                'tags': m.tags,
                'parcela': m.parcela,

                // 'atendimentoServicoDescricao': m.atendimentoServico != null
                //     ? m.atendimentoServico.descricao
                //     : '',
                // 'atendimentoServicoObservacao': m.atendimentoServico != null
                //     ? m.atendimentoServico.observacao
                //     : ''
                'atendimentoServico': {
                  'id': m.atendimentoServico != null
                      ? m.atendimentoServico.id
                      : 0,
                  'descricao': m.atendimentoServico != null
                      ? m.atendimentoServico.descricao
                      : '',
                  'observacao': m.atendimentoServico != null
                      ? m.atendimentoServico.observacao
                      : '',
                  'tags': m.atendimentoServico != null
                      ? m.atendimentoServico.tags
                      : '',
                  //   'clienteNome': m.atendimentoServico.cliente.nome,
                }
              })
          .toList();
    }).then((lista) => Response.ok(lista));
  }

  @Operation.get('anoMes')
  Future<Response> buscarTodasMovimentacoes() {
    final anoMes = request.path.variables['anoMes'];
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    final UsuarioModel usuario = request.attachments['userId'] as UsuarioModel;
    //Buscar as Movimentações
    return service.buscarMovimentacoes(usuario, anoMes).then((data) {
      return data
          .map((m) => {
                'id': m.id,
                'dataMovimentacao': m.dataMovimentacao != null
                    ? dateFormat.format(m.dataMovimentacao.toLocal())
                    : '',
                'dataEfetivacao': m.dataEfetivacao != null
                    ? dateFormat.format(m.dataEfetivacao.toLocal())
                    : '',
                'descricao': m.descricao,
                'valor': m.valor,
                'categoria': {
                  'id': m.categoria.id,
                  'nome': m.categoria.nome,
                  'tipo': m.categoria.tipoCategoria.toString()
                },
                'tags': m.tags,
                'parcela': m.parcela,
                'atendimentoServico': {
                  'id': m.atendimentoServico != null
                      ? m.atendimentoServico.id
                      : 0,
                  'descricao': m.atendimentoServico != null
                      ? m.atendimentoServico.descricao
                      : '',
                  'observacao': m.atendimentoServico != null
                      ? m.atendimentoServico.observacao
                      : '',
                  //   'clienteNome': m.atendimentoServico.cliente.nome,
                }
              })
          .toList();
    }).then((lista) => Response.ok(lista));
  }

  @Operation.get('totalAnoMes')
  Future<Response> recuperarTotalMesAno(
      @Bind.path('totalAnoMes') String mesAno) async {
    final usuario = request.attachments['userId'] as UsuarioModel;
    final resultado =
        await service.recuperarTotalMovimentacaoPorTipo(usuario, mesAno);
    return Response.ok(resultado);
  }

  @Operation.post()
  Future<Response> salvarMovimento(
      @Bind.body() SalvarMovimentacaoRequest requestSalvar) async {
    try {
      final validate = requestSalvar.validate();
      if (validate.isNotEmpty) {
        return Response.badRequest(body: validate);
      }
      final usuario = request.attachments['userId'] as UsuarioModel;

      await service.salvarMovimentacao(usuario, requestSalvar);
      return Response.ok({});
    } catch (e) {
      return Response.serverError(
          body: {'message': 'Erro ao salvar Movimentação'});
    }
  }
}
