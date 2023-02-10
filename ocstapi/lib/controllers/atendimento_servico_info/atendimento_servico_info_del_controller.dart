import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_del_request.dart';
import 'package:ocstapi/services/atendimento_servico_info_service.dart';
import 'package:ocstapi/ocstapi.dart';

class AtendimentoServicoInfoDelController extends ResourceController {
  AtendimentoServicoInfoDelController(this.context)
      : service = AtendimentoServicoInfoService(context);
  ManagedContext context;
  final AtendimentoServicoInfoService service;

  @Operation.post()
  Future<Response> del(
      @Bind.body() AtendimentoServicoInfoDelRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok({'resposta': await service.del(request)});
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [del]', 'exception': e.toString()});
    }
  }
}
