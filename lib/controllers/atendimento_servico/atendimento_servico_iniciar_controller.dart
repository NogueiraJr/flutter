import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_iniciar_request.dart';
import 'package:ocstapi/services/atendimento_servico_service.dart';

class AtendimentoServicoIniciarController extends ResourceController {
  AtendimentoServicoIniciarController(this.context)
      : service = AtendimentoServicoService(context);
  ManagedContext context;
  final AtendimentoServicoService service;

  @Operation.post()
  Future<Response> iniciar(
      @Bind.body() AtendimentoServicoIniciarRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.iniciar(request);
      return Response.ok({'message': 'Iniciado com sucesso'});
    } catch (e) {
      return Response.serverError(
          body: {'message': 'Erro ao iniciar', 'exception': e.toString()});
    }
  }
}
