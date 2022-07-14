import 'package:intl/intl.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_ins_request.dart';
import 'package:ocstapi/services/locacao_roupa_service.dart';

import '../../ocstapi.dart';

class LocacaoRoupaInsController extends ResourceController {
  LocacaoRoupaInsController(this.context)
      : service = LocacaoRoupaService(context);
  ManagedContext context;
  final LocacaoRoupaService service;

  @Operation.post()
  Future<Response> locacaoIns(
      @Bind.body() LocacaoRoupaInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.locacaoIns(request);
      return Response.ok({'message': 'Locação gravada com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao gravar a Locação',
        'exception': e.toString()
      });
    }
  }
}
