import 'package:ocstapi/controllers/usuario_pai_filho/dto/usuario_delegar_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

class UsuarioDelegarController extends ResourceController {
  UsuarioDelegarController(this.context)
      : usuarioService = UsuarioService(context);
  ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> delegarUsuario(
      @Bind.body() UsuarioDelegarRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await usuarioService.delegarUsuario(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [delegarUsuario]',
        'exception': e.toString()
      });
    }
  }
}
