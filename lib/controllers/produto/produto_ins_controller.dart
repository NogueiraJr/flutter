import 'package:ocstapi/controllers/produto/dto/produto_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/produto_service.dart';

class ProdutoInsController extends ResourceController {
  ProdutoInsController(this.context) : service = ProdutoService(context);
  ManagedContext context;
  final ProdutoService service;

  @Operation.post()
  Future<Response> produtoIns(@Bind.body() ProdutoInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.produtoIns(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [produtoIns]', 'exception': e.toString()});
    }
  }
}
