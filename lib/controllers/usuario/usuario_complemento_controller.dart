import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

import 'dto/complementar_usuario_request.dart';

class UsuarioComplementoController extends ResourceController {
  UsuarioComplementoController(this.context)
      : usuarioService = UsuarioService(context);
  final ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> complementar(
      @Bind.body() ComplementarUsuarioRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await usuarioService.complementarUsuario(request);
      return Response.ok({'message': 'Usuário complementado com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao complementar usuário',
        'exception': e.toString()
      });
    }
  }
}
