import 'package:ocstapi/controllers/fornecedor/dto/fornecedor_upd_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/fornecedor_service.dart';

class FornecedorUpdController extends ResourceController {
  FornecedorUpdController(this.context) : service = FornecedorService(context);
  ManagedContext context;
  final FornecedorService service;

  @Operation.post()
  Future<Response> fornecedorUpd(
      @Bind.body() FornecedorUpdRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.fornecedorUpd(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [fornecedorUpd]', 'exception': e.toString()});
    }
  }
}
