import 'package:ocstapi/controllers/proprietario/dto/gravar_proprietario_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

class GravarProprietarioController extends ResourceController {
  GravarProprietarioController(this.context)
      : usuarioService = UsuarioService(context);
  ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> gravarProprietario(
      @Bind.body() GravarProprietarioRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await usuarioService.gravarProprietario(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [gravarProprietario]',
        'exception': e.toString()
      });
    }
  }
}
