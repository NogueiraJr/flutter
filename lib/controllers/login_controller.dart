import 'package:ocstapi/controllers/login/dto/login_request.dart';
import 'package:ocstapi/services/usuario_service.dart';

import '../ocstapi.dart';

class LoginController extends ResourceController {
  LoginController(this.context) : usuarioService = UsuarioService(context);
  final ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> login(@Bind.body() LoginRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    final token = await usuarioService.login(request);
    return Response.ok({'autenticado': token != null, "token": token});
  }
}
