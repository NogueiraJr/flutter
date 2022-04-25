import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_ins_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_novovalor_request.dart';
import 'package:ocstapi/services/atendimento_servico_service.dart';

class AtendimentoServicoNovoValorController extends ResourceController {
  AtendimentoServicoNovoValorController(this.context)
      : service = AtendimentoServicoService(context);
  ManagedContext context;
  final AtendimentoServicoService service;

  @Operation.post()
  Future<Response> gravarNovoValor(
      @Bind.body() AtendimentoServicoNovoValorRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.gravarNovoValor(request);
      return Response.ok({'message': 'Gravado com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao Gravar Novo Valor',
        'exception': e.toString()
      });
    }
  }
}
