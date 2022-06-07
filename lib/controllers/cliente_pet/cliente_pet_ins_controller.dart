import 'package:ocstapi/controllers/cliente_pet/dto/cliente_pet_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_pet_service.dart';

class ClientePetInsController extends ResourceController {
  ClientePetInsController(this.context) : service = ClientePetService(context);
  ManagedContext context;
  final ClientePetService service;

  @Operation.post()
  Future<Response> clientePetIns(
      @Bind.body() ClientePetInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.clientePetIns(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [clientePetIns]', 'exception': e.toString()});
    }
  }
}
