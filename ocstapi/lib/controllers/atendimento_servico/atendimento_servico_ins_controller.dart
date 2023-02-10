import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_ins_request.dart';
import 'package:ocstapi/services/atendimento_servico_service.dart';

class AtendimentoServicoInsController extends ResourceController {
  AtendimentoServicoInsController(this.context)
      : service = AtendimentoServicoService(context);
  ManagedContext context;
  final AtendimentoServicoService service;

  @Operation.post()
  Future<Response> ins(
      @Bind.body() AtendimentoServicoInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.ins(request);
      return Response.ok({'message': 'Inserido com sucesso'});
    } catch (e) {
      return Response.serverError(
          body: {'message': 'Erro ao Inserir', 'exception': e.toString()});
    }
  }
}
