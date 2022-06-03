import 'package:intl/intl.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_pet_service.dart';

class ClientePetController extends ResourceController {
  ClientePetController(this.context) : service = ClientePetService(context);
  ManagedContext context;
  final ClientePetService service;

  @Operation.get('id')
  Future<Response> obterClientePetPorId(@Bind.path('id') int id) async {
    try {
      return Response.ok(await service.obterClientePetPorId(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClientePetPorId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('clienteId')
  Future<Response> obterClientePetsPorClienteId(
      @Bind.path('clienteId') int id) async {
    try {
      return await service.obterClientePetsPorClienteId(id).then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'clienteId': m.cliente.id,
                  'clienteNome': m.cliente.nome,
                  'nome': m.nome,
                  'raca': m.raca,
                  'anoNascimento': m.anoNascimento,
                  'mesNascimento': m.mesNascimento,
                  'cor': m.cor,
                  'observacao': m.observacao,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClientePetsPorClienteId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('clientePetId', 'atendimentoServicoId')
  Future<Response> obterAtendimentoServicoObjeto(
      @Bind.path('clientePetId') int clientePetId,
      @Bind.path('atendimentoServicoId') int atendimentoServicoId) async {
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');

    try {
      return await service
          .obterAtendimentoServicoObjeto(clientePetId, atendimentoServicoId)
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
                  'clientePetId': m.clientePet.id,
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

  // @Operation.get('clientePetIdEmUso')
  // Future<Response> petClienteEstaEmUso(
  //     @Bind.path('clientePetIdEmUso') int clientePetIdEmUso) async {
  //   try {
  //     final resultado =
  //         await service.petClienteEstaEmUso(clientePetIdEmUso);
  //     if (resultado != null) {
  //       return Response.ok({'resposta': 'SIM'});
  //     } else {
  //       return Response.ok({'resposta': 'NAO'});
  //     }
  //   } catch (e) {
  //     print(e);
  //     return Response.serverError(body: {
  //       'message': 'ERRO [petClienteEstaEmUso]',
  //       'exception': e.toString()
  //     });
  //   }
  // }
}
