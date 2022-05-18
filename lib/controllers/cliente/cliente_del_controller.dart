import 'package:ocstapi/controllers/cliente/dto/cliente_del_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_service.dart';

class ClienteDelController extends ResourceController {
  ClienteDelController(this.context) : service = ClienteService(context);
  ManagedContext context;
  final ClienteService service;

  @Operation.post()
  Future<Response> clienteDel(@Bind.body() ClienteDelRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok({'resposta': await service.clienteDel(request)});
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [clienteDel]', 'exception': e.toString()});
    }
  }
}
