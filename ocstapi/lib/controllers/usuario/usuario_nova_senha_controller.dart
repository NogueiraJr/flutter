import 'package:ocstapi/controllers/usuario/dto/cadastrar_usuario_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

class UsuarioNovaSenhaController extends ResourceController {
  UsuarioNovaSenhaController(this.context)
      : usuarioService = UsuarioService(context);
  final ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> enviarNovaSenha(
      @Bind.body() CadastrarUsuarioRequest request) async {
    request.senha = '***';
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      final codigo = await usuarioService.enviarNovoCodigoEmailUsuario(request);
      return Response.ok(
          {'message': 'Novo código enviado com sucesso', 'codigo': codigo});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao enviar novo código ao usuário',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('login', 'email', 'codigo')
  Future<Response> codigoValido(
      @Bind.path('login') String login,
      @Bind.path('email') String email,
      @Bind.path('codigo') String codigo) async {
    final resultado = await usuarioService.codigoValido(login, email, codigo);
    if (resultado != null) {
      return Response.ok({'resposta': 'SIM'});
    } else {
      return Response.ok({'resposta': 'NAO'});
    }
  }
}
