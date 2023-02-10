import 'package:ocstapi/controllers/cliente/dto/cliente_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_service.dart';

class ClienteInsController extends ResourceController {
  ClienteInsController(this.context) : service = ClienteService(context);
  ManagedContext context;
  final ClienteService service;

  @Operation.post()
  Future<Response> clienteIns(@Bind.body() ClienteInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.clienteIns(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [clienteIns]', 'exception': e.toString()});
    }
  }
}
