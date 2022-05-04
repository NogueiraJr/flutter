import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_ins_request.dart';
import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_upd_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/atendimento_servico_info_service.dart';

class AtendimentoServicoInfoUpdController extends ResourceController {
  AtendimentoServicoInfoUpdController(this.context)
      : service = AtendimentoServicoInfoService(context);
  ManagedContext context;
  final AtendimentoServicoInfoService service;

  @Operation.post()
  Future<Response> upd(
      @Bind.body() AtendimentoServicoInfoUpdRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.upd(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [upd]', 'exception': e.toString()});
    }
  }
}
