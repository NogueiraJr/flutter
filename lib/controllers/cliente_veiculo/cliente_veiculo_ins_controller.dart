import 'package:ocstapi/controllers/cliente_veiculo/dto/cliente_veiculo_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_veiculo_service.dart';

class ClienteVeiculoInsController extends ResourceController {
  ClienteVeiculoInsController(this.context)
      : service = ClienteVeiculoService(context);
  ManagedContext context;
  final ClienteVeiculoService service;

  @Operation.post()
  Future<Response> clienteVeiculoIns(
      @Bind.body() ClienteVeiculoInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.clienteVeiculoIns(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [clienteVeiculoIns]',
        'exception': e.toString()
      });
    }
  }
}
