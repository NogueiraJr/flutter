import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/atendimento_servico_info_service.dart';

class AtendimentoServicoInfoInsController extends ResourceController {
  AtendimentoServicoInfoInsController(this.context)
      : service = AtendimentoServicoInfoService(context);
  ManagedContext context;
  final AtendimentoServicoInfoService service;

  @Operation.post()
  Future<Response> ins(
      @Bind.body() AtendimentoServicoInfoInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.ins(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [ins]', 'exception': e.toString()});
    }
  }
}
