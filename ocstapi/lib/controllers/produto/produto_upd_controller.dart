import 'package:ocstapi/controllers/produto/dto/produto_upd_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/produto_service.dart';

class ProdutoUpdController extends ResourceController {
  ProdutoUpdController(this.context) : service = ProdutoService(context);
  ManagedContext context;
  final ProdutoService service;

  @Operation.post()
  Future<Response> produtoUpd(@Bind.body() ProdutoUpdRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.produtoUpd(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [produtoUpd]', 'exception': e.toString()});
    }
  }
}
