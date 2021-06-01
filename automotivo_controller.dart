import 'package:ocstapi/services/automotivo_service.dart';

import '../../ocstapi.dart';

class AutomotivoController extends ResourceController {
  AutomotivoController(this.context) : service = AutomotivoService(context);
  final ManagedContext context;
  final AutomotivoService service;

  @Operation.get('id')
  Future<Response> obterEstatisticasDeslocamento(
    @Bind.path('id') int id,
  ) async {
    try {
      return service
          .obterEstatisticasDeslocamento(id)
          .then((res) => res
              .map((c) => {
                    'id': c.id,
                    'velocMedia': c.velocMedia,
                    'tempoGasto': c.tempoGasto,
                    'distPercorida': c.distPercorida,
                    'litrosGastos': c.litrosGastos,
                  })
              .toList())
          .then((data) => Response.ok(data));
    } catch (e) {
      print(e);
      return Response.serverError(body: {'message': e.toString()});
    }
  }
}
