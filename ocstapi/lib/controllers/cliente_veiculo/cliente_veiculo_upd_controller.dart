import 'package:ocstapi/controllers/cliente_veiculo/dto/cliente_veiculo_upd_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_veiculo_service.dart';

class ClienteVeiculoUpdController extends ResourceController {
  ClienteVeiculoUpdController(this.context)
      : service = ClienteVeiculoService(context);
  ManagedContext context;
  final ClienteVeiculoService service;

  @Operation.post()
  Future<Response> clienteVeiculoUpd(
      @Bind.body() ClienteVeiculoUpdRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.clienteVeiculoUpd(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [clienteVeiculoUpd]',
        'exception': e.toString()
      });
    }
  }
}
