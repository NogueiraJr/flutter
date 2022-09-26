import 'package:ocstapi/controllers/usuario_acesso/dto/usuario_acesso_bloqueio_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

class UsuarioAcessoBloqueioController extends ResourceController {
  UsuarioAcessoBloqueioController(this.context)
      : usuarioService = UsuarioService(context);
  ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> bloqueioAcessoUsuario(
      @Bind.body() UsuarioAcessoBloqueioRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      final message = await usuarioService.bloqueioAcessoUsuario(request);
      return Response.ok({'resposta': message});
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [criarAcessoUsuario]',
        'exception': e.toString()
      });
    }
  }
}
