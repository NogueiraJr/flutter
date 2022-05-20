import 'package:ocstapi/controllers/cliente/dto/cliente_upd_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_service.dart';

class ClienteUpdController extends ResourceController {
  ClienteUpdController(this.context) : service = ClienteService(context);
  ManagedContext context;
  final ClienteService service;

  @Operation.post()
  Future<Response> clienteUpd(@Bind.body() ClienteUpdRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.clienteUpd(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [clienteUpd]', 'exception': e.toString()});
    }
  }
}
