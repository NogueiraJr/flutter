import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_finalizar_request.dart';
import 'package:ocstapi/services/atendimento_servico_service.dart';

class AtendimentoServicoFinalizarController extends ResourceController {
  AtendimentoServicoFinalizarController(this.context)
      : service = AtendimentoServicoService(context);
  ManagedContext context;
  final AtendimentoServicoService service;

  @Operation.post()
  Future<Response> finalizar(
      @Bind.body() AtendimentoServicoFinalizarRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.finalizar(request);
      return Response.ok({'message': 'Finalizado com sucesso'});
    } catch (e) {
      return Response.serverError(
          body: {'message': 'Erro ao finalizar', 'exception': e.toString()});
    }
  }
}
