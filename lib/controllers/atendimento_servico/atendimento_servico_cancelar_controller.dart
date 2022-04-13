import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_cancelar_request.dart';
import 'package:ocstapi/services/atendimento_servico_service.dart';

class AtendimentoServicoCancelarController extends ResourceController {
  AtendimentoServicoCancelarController(this.context)
      : service = AtendimentoServicoService(context);
  ManagedContext context;
  final AtendimentoServicoService service;

  @Operation.post()
  Future<Response> cancelar(
      @Bind.body() AtendimentoServicoCancelarRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.cancelar(request);
      return Response.ok({'message': 'Cancelado com sucesso'});
    } catch (e) {
      return Response.serverError(
          body: {'message': 'Erro ao cancelar', 'exception': e.toString()});
    }
  }
}
