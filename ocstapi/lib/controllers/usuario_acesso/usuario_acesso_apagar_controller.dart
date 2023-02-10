import 'package:ocstapi/controllers/usuario_acesso/dto/usuario_acesso_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

class UsuarioAcessoApagarController extends ResourceController {
  UsuarioAcessoApagarController(this.context)
      : usuarioService = UsuarioService(context);
  ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> apagarAcessoUsuario(
      @Bind.body() UsuarioAcessoRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await usuarioService.apagarAcessoUsuario(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [apagarAcessoUsuario]',
        'exception': e.toString()
      });
    }
  }
}
