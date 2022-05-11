import 'package:ocstapi/controllers/atendimento_servico_item/dto/atendimento_servico_item_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/atendimento_servico_item_service.dart';

class AtendimentoServicoItemInsController extends ResourceController {
  AtendimentoServicoItemInsController(this.context)
      : service = AtendimentoServicoItemService(context);
  ManagedContext context;
  final AtendimentoServicoItemService service;

  @Operation.post()
  Future<Response> del(
      @Bind.body() AtendimentoServicoItemInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok({'resposta': await service.ins(request)});
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [ins]', 'exception': e.toString()});
    }
  }
}
