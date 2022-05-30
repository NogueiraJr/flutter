import 'package:ocstapi/controllers/cliente_manequim/dto/cliente_manequim_upd_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_manequim_service.dart';

class ClienteManequimUpdController extends ResourceController {
  ClienteManequimUpdController(this.context)
      : service = ClienteManequimService(context);
  ManagedContext context;
  final ClienteManequimService service;

  @Operation.post()
  Future<Response> clienteManequimUpd(
      @Bind.body() ClienteManequimUpdRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.clienteManequimUpd(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [clienteManequimUpd]',
        'exception': e.toString()
      });
    }
  }
}
