import 'package:ocstapi/controllers/fornecedor/dto/fornecedor_del_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/fornecedor_service.dart';

class FornecedorDelController extends ResourceController {
  FornecedorDelController(this.context) : service = FornecedorService(context);
  ManagedContext context;
  final FornecedorService service;

  @Operation.post()
  Future<Response> fornecedorDel(
      @Bind.body() FornecedorDelRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.fornecedorDel(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [fornecedorDel]', 'exception': e.toString()});
    }
  }
}
