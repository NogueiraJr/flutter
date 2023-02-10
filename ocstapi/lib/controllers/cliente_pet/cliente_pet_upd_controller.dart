import 'package:ocstapi/controllers/cliente_pet/dto/cliente_pet_upd_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_pet_service.dart';

class ClientePetUpdController extends ResourceController {
  ClientePetUpdController(this.context) : service = ClientePetService(context);
  ManagedContext context;
  final ClientePetService service;

  @Operation.post()
  Future<Response> clientePetUpd(
      @Bind.body() ClientePetUpdRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.clientePetUpd(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [clientePetUpd]', 'exception': e.toString()});
    }
  }
}
