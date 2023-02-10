import 'package:ocstapi/controllers/cliente_manequim/dto/cliente_manequim_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_manequim_service.dart';

class ClienteManequimInsController extends ResourceController {
  ClienteManequimInsController(this.context)
      : service = ClienteManequimService(context);
  ManagedContext context;
  final ClienteManequimService service;

  @Operation.post()
  Future<Response> clienteManequimIns(
      @Bind.body() ClienteManequimInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.clienteManequimIns(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [clienteManequimIns]',
        'exception': e.toString()
      });
    }
  }
}
