import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_arquivar_request.dart';
import 'package:ocstapi/services/atendimento_servico_service.dart';

class AtendimentoServicoArquivarController extends ResourceController {
  AtendimentoServicoArquivarController(this.context)
      : service = AtendimentoServicoService(context);
  ManagedContext context;
  final AtendimentoServicoService service;

  @Operation.post()
  Future<Response> arquivar(
      @Bind.body() AtendimentoServicoArquivarRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.arquivar(request);
      return Response.ok({'message': 'Arquivado com sucesso'});
    } catch (e) {
      return Response.serverError(
          body: {'message': 'Erro ao arquivar', 'exception': e.toString()});
    }
  }
}
