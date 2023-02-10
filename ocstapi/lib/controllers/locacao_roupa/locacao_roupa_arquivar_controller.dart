import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_arquivar_request.dart';
import 'package:ocstapi/services/locacao_roupa_service.dart';

import '../../ocstapi.dart';

class LocacaoRoupaArquivarController extends ResourceController {
  LocacaoRoupaArquivarController(this.context)
      : service = LocacaoRoupaService(context);
  ManagedContext context;
  final LocacaoRoupaService service;

  @Operation.post()
  Future<Response> locacaoArquivar(
      @Bind.body() LocacaoRoupaArquivarRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await service.locacaoArquivar(request);
      return Response.ok({'message': 'Locação arquivada com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao arquivar a Locação',
        'exception': e.toString()
      });
    }
  }
}
