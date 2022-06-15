import 'package:ocstapi/controllers/cliente_veiculo/dto/cliente_veiculo_del_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_veiculo_service.dart';

class ClienteVeiculoDelController extends ResourceController {
  ClienteVeiculoDelController(this.context)
      : service = ClienteVeiculoService(context);
  ManagedContext context;
  final ClienteVeiculoService service;

  @Operation.post()
  Future<Response> clienteVeiculoDel(
      @Bind.body() ClienteVeiculoDelRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(
          {'resposta': await service.clienteVeiculoDel(request)});
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [clienteVeiculoDel]',
        'exception': e.toString()
      });
    }
  }
}
