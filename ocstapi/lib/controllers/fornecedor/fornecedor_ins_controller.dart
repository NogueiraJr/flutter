import 'package:ocstapi/controllers/fornecedor/dto/fornecedor_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/fornecedor_service.dart';

class FornecedorInsController extends ResourceController {
  FornecedorInsController(this.context) : service = FornecedorService(context);
  ManagedContext context;
  final FornecedorService service;

  @Operation.post()
  Future<Response> fornecedorIns(
      @Bind.body() FornecedorInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.fornecedorIns(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [fornecedorIns]', 'exception': e.toString()});
    }
  }
}
