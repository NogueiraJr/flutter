import 'package:ocstapi/controllers/cliente_pet/dto/cliente_pet_del_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_pet_service.dart';

class ClientePetDelController extends ResourceController {
  ClientePetDelController(this.context) : service = ClientePetService(context);
  ManagedContext context;
  final ClientePetService service;

  @Operation.post()
  Future<Response> clientePetDel(
      @Bind.body() ClientePetDelRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok({'resposta': await service.clientePetDel(request)});
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [clientePetDel]', 'exception': e.toString()});
    }
  }
}
