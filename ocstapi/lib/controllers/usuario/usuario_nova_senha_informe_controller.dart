import 'package:ocstapi/controllers/usuario/dto/cadastrar_usuario_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

class UsuarioNovaSenhaInformeController extends ResourceController {
  UsuarioNovaSenhaInformeController(this.context)
      : usuarioService = UsuarioService(context);
  final ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> gravarNovaSenhaUsuario(
      @Bind.body() CadastrarUsuarioRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await usuarioService.gravarNovaSenhaUsuario(request);
      return Response.ok({'message': 'Nova senha gravada com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao gravar a nova senha do usuário',
        'exception': e.toString()
      });
    }
  }
}
