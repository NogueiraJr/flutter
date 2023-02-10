import 'package:intl/intl.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_veiculo_service.dart';

class ClienteVeiculoController extends ResourceController {
  ClienteVeiculoController(this.context)
      : service = ClienteVeiculoService(context);
  ManagedContext context;
  final ClienteVeiculoService service;

  @Operation.get('id')
  Future<Response> obterClienteVeiculoPorId(@Bind.path('id') int id) async {
    try {
      return Response.ok(await service.obterClienteVeiculoPorId(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClienteVeiculoPorId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('clienteId')
  Future<Response> obterClienteVeiculosPorClienteId(
      @Bind.path('clienteId') int id) async {
    try {
      return await service.obterClienteVeiculosPorClienteId(id).then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'clienteId': m.cliente.id,
                  'clienteNome': m.cliente.nome,
                  'marca': m.marca,
                  'modelo': m.modelo,
                  'ano': m.ano,
                  'cor': m.cor,
                  'placa': m.placa,
                  'observacao': m.observacao,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClienteVeiculosPorClienteId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('clienteVeiculoId', 'atendimentoServicoId')
  Future<Response> obterAtendimentoServicoObjeto(
      @Bind.path('clienteVeiculoId') int clienteVeiculoId,
      @Bind.path('atendimentoServicoId') int atendimentoServicoId) async {
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');

    try {
      return await service
          .obterAtendimentoServicoObjeto(clienteVeiculoId, atendimentoServicoId)
          .then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'descricao': m.descricao,
                  'quando': dateFormat.format(m.quando),
                  'tags': m.tags,
                  'observacao': m.observacao,
                  'usuarioId': m.usuario.id,
                  'atendimentoServicoId': m.atendimentoServico.id,
                  'clienteVeiculoId': m.clienteVeiculo.id,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterAtendimentoServicoObjeto]',
        'exception': e.toString()
      });
    }
  }

  // @Operation.get('clienteVeiculoIdEmUso')
  // Future<Response> veiculoClienteEstaEmUso(
  //     @Bind.path('clienteVeiculoIdEmUso') int clienteVeiculoIdEmUso) async {
  //   try {
  //     final resultado =
  //         await service.veiculoClienteEstaEmUso(clienteVeiculoIdEmUso);
  //     if (resultado != null) {
  //       return Response.ok({'resposta': 'SIM'});
  //     } else {
  //       return Response.ok({'resposta': 'NAO'});
  //     }
  //   } catch (e) {
  //     print(e);
  //     return Response.serverError(body: {
  //       'message': 'ERRO [veiculoClienteEstaEmUso]',
  //       'exception': e.toString()
  //     });
  //   }
  // }
}
