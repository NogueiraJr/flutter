import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_devolver_request.dart';
import 'package:ocstapi/services/locacao_roupa_service.dart';

import '../../ocstapi.dart';

class LocacaoRoupaDevolverController extends ResourceController {
  LocacaoRoupaDevolverController(this.context)
      : service = LocacaoRoupaService(context);
  ManagedContext context;
  final LocacaoRoupaService service;

  @Operation.post()
  Future<Response> locacaoDevolver(
      @Bind.body() LocacaoRoupaDevolverRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.locacaoDevolver(request);
      return Response.ok({'message': 'Devolução gravada com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao devolver a Locação',
        'exception': e.toString()
      });
    }
  }
}
