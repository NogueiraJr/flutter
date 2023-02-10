import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_retirar_request.dart';
import 'package:ocstapi/services/locacao_roupa_service.dart';

import '../../ocstapi.dart';

class LocacaoRoupaRetirarController extends ResourceController {
  LocacaoRoupaRetirarController(this.context)
      : service = LocacaoRoupaService(context);
  ManagedContext context;
  final LocacaoRoupaService service;

  @Operation.post()
  Future<Response> locacaoRetirar(
      @Bind.body() LocacaoRoupaRetirarRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.locacaoRetirar(request);
      return Response.ok({'message': 'Retirada gravada com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao retirar a Locação',
        'exception': e.toString()
      });
    }
  }
}
