import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_inicio_request.dart';
import 'package:ocstapi/services/atendimento_servico_service.dart';

class AtendimentoServicoInicioController extends ResourceController {
  AtendimentoServicoInicioController(this.context)
      : service = AtendimentoServicoService(context);
  ManagedContext context;
  final AtendimentoServicoService service;

  @Operation.post()
  Future<Response> inicio(
      @Bind.body() AtendimentoServicoInicioRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.inicio(request);
      return Response.ok({'message': 'Inicio alterado com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao alterar o inicio',
        'exception': e.toString()
      });
    }
  }
}
