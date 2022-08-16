import 'package:ocstapi/controllers/produto/dto/produto_del_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/produto_service.dart';

class ProdutoDelController extends ResourceController {
  ProdutoDelController(this.context) : service = ProdutoService(context);
  ManagedContext context;
  final ProdutoService service;

  @Operation.post()
  Future<Response> produtoDel(@Bind.body() ProdutoDelRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok({'resposta': await service.produtoDel(request)});
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [produtoDel]', 'exception': e.toString()});
    }
  }
}
