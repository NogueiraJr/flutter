import 'package:ocstapi/controllers/produto/dto/produto_item_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/produto_service.dart';

class ProdutoItemInsController extends ResourceController {
  ProdutoItemInsController(this.context) : service = ProdutoService(context);
  ManagedContext context;
  final ProdutoService service;

  @Operation.post()
  Future<Response> produtoItemIns(
      @Bind.body() ProdutoItemInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.produtoItemIns(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [produtoItemIns]',
        'exception': e.toString()
      });
    }
  }
}
