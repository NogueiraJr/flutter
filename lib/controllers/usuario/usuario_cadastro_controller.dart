import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

import 'dto/excluir_usuario_request.dart';

class UsuarioCadastroController extends ResourceController {
  UsuarioCadastroController(this.context)
      : usuarioService = UsuarioService(context);
  final ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> apagarCadastroInicialDoUsuario(
      @Bind.body() ExcluirUsuarioRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await usuarioService.apagarCadastroInicialDoUsuario(request);
      return Response.ok({'message': 'Usuário apagado com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao apagar usuário',
        'exception': e.toString()
      });
    }
  }
}
