import 'package:ocstapi/controllers/produto/dto/produto_item_del_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/produto_service.dart';

class ProdutoItemDelController extends ResourceController {
  ProdutoItemDelController(this.context) : service = ProdutoService(context);
  ManagedContext context;
  final ProdutoService service;

  @Operation.post()
  Future<Response> produtoItemDel(
      @Bind.body() ProdutoItemDelRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.produtoItemDel(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [produtoItemDel]',
        'exception': e.toString()
      });
    }
  }
}
