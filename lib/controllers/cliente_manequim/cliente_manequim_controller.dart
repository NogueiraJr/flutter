import 'package:intl/intl.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_manequim_service.dart';

class ClienteManequimController extends ResourceController {
  ClienteManequimController(this.context)
      : service = ClienteManequimService(context);
  ManagedContext context;
  final ClienteManequimService service;

  @Operation.get('id')
  Future<Response> obterClienteManequimPorId(@Bind.path('id') int id) async {
    try {
      return Response.ok(await service.obterClienteManequimPorId(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClienteManequimPorId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('clienteId')
  Future<Response> obterClienteManequinsPorClienteId(
      @Bind.path('clienteId') int id) async {
    final DateFormat dF = DateFormat('dd/MM/yyyy');
    try {
      return await service.obterClienteManequinsPorClienteId(id).then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'clienteId': m.cliente.id,
                  'clienteNome': m.cliente.nome,
                  'data': m.data != null ? dF.format(m.data.toLocal()) : null,
                  'busto': m.busto,
                  'cintura': m.cintura,
                  'quadril': m.quadril,
                  'altura': m.altura,
                  'peso': m.peso,
                  'pescoco': m.pescoco,
                  'ombro': m.ombro,
                  'torax': m.torax,
                  'bracoLargura': m.bracoLargura,
                  'bracoComprimento': m.bracoComprimento,
                  'costasLargura': m.costasLargura,
                  'quadrilAltura': m.quadrilAltura,
                  'barriga': m.barriga,
                  'coxaLargura': m.coxaLargura,
                  'pernaComprimento': m.pernaComprimento,
                  'observacao': m.observacao,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClienteManequinsPorClienteId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('clienteIdHoje')
  Future<Response> obterQtdeClienteManequinsPorClienteIdHoje(
      @Bind.path('clienteIdHoje') int id) async {
    try {
      final DateFormat dF = DateFormat('yyyy-MM-dd');
      final numero =
          await service.obterClienteManequinsPorClienteId(id).then((data) {
        return data
            .where((w) => dF.format(w.data) == dF.format(DateTime.now()))
            .length;
      });
      return Response.ok({'resposta': numero.toString()});
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterQtdeClienteManequinsPorClienteIdHoje]',
        'exception': e.toString()
      });
    }
  }
}
