import 'package:intl/intl.dart';
import 'package:ocstapi/services/atendimento_servico_info_service.dart';

import '../../ocstapi.dart';

class AtendimentoServicoInfoController extends ResourceController {
  AtendimentoServicoInfoController(this.context)
      : service = AtendimentoServicoInfoService(context);
  ManagedContext context;
  final AtendimentoServicoInfoService service;

  @Operation.get('id')
  Future<Response> consultarAtendimentoServicoInfoPorId(
      @Bind.path('id') int id) async {
    try {
      final DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
      return service.consultarAtendimentoServicoInfoPorId(id).then((data) {
        return data
            .map((c) => {
                  'id': c.id,
                  'usuarioId': c.usuario.id,
                  'usuarioPessoa': c.usuario.pessoa ?? '',
                  'atendimentoServicoId': c.atendimentoServico.id,
                  'descricao': c.descricao ?? '',
                  'quando': dateFormat.format(c.quando.toLocal()),
                  'quandoAlterado': c.quandoAlterado != null
                      ? dateFormat.format(c.quandoAlterado.toLocal())
                      : dateFormat.format(c.quando.toLocal()),
                  'observacao': c.observacao ?? '',
                  'tags': c.tags ?? '',
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [consultarAtendimentoServicoInfoPorId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('usuarioId')
  Future<Response> consultarAtendimentoServicoInfoPorUsuarioId(
      @Bind.path('usuarioId') int id) async {
    try {
      final DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
      return service
          .consultarAtendimentoServicoInfoPorUsuarioId(id)
          .then((data) {
        return data
            .map((c) => {
                  'id': c.id,
                  'usuarioId': c.usuario.id,
                  'usuarioPessoa': c.usuario.pessoa ?? '',
                  'atendimentoServicoId': c.atendimentoServico.id,
                  'descricao': c.descricao ?? '',
                  'quando': dateFormat.format(c.quando.toLocal()),
                  'quandoAlterado': c.quandoAlterado != null
                      ? dateFormat.format(c.quandoAlterado.toLocal())
                      : dateFormat.format(c.quando.toLocal()),
                  'observacao': c.observacao ?? '',
                  'tags': c.tags ?? '',
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [consultarAtendimentoServicoInfoPorUsuarioId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('atendimentoServicoId')
  Future<Response> consultarAtendimentoServicoInfoPorAtendimentoServicoId(
      @Bind.path('atendimentoServicoId') int id) async {
    try {
      final DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
      return service
          .consultarAtendimentoServicoInfoPorAtendimentoServicoId(id)
          .then((data) {
        return data
            .map((c) => {
                  'id': c.id,
                  'usuarioId': c.usuario.id,
                  'usuarioPessoa': c.usuario.pessoa ?? '',
                  'atendimentoServicoId': c.atendimentoServico.id,
                  'descricao': c.descricao ?? '',
                  'quando': dateFormat.format(c.quando.toLocal()),
                  'quandoAlterado': c.quandoAlterado != null
                      ? dateFormat.format(c.quandoAlterado.toLocal())
                      : dateFormat.format(c.quando.toLocal()),
                  'observacao': c.observacao ?? '',
                  'tags': c.tags ?? '',
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [consultarAtendimentoServicoInfo]',
        'exception': e.toString()
      });
    }
  }
}
