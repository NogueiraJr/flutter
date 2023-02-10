import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_cancelar_request.dart';
import 'package:ocstapi/services/locacao_roupa_service.dart';

import '../../ocstapi.dart';

class LocacaoRoupaCancelarController extends ResourceController {
  LocacaoRoupaCancelarController(this.context)
      : service = LocacaoRoupaService(context);
  ManagedContext context;
  final LocacaoRoupaService service;

  @Operation.post()
  Future<Response> locacaoCancelar(
      @Bind.body() LocacaoRoupaCancelarRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.locacaoCancelar(request);
      return Response.ok({'message': 'Locação cancelada com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao cancelar a Locação',
        'exception': e.toString()
      });
    }
  }
}
