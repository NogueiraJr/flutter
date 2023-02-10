import 'package:ocstapi/controllers/usuario_pai_filho/dto/criar_login_filho_do_pai_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

class UsuarioPaiFilhoController extends ResourceController {
  UsuarioPaiFilhoController(this.context)
      : usuarioService = UsuarioService(context);
  ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> criarAlterarLoginFilhoDoPai(
      @Bind.body() CriarLoginFilhoDoPaiRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(
          await usuarioService.criarAlterarLoginFilhoDoPai(request));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [criarAlterarLoginFilhoDoPai]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('login')
  Future<Response> obterUsuariosFilhos(@Bind.path('login') String login) async {
    try {
      return Response.ok(await usuarioService.obterUsuariosFilhos(login));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterUsuariosFilhos]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('id')
  Future<Response> obterUsuariosFilhosPorId(@Bind.path('id') int id) async {
    try {
      final login = await usuarioService.buscarPorId(id).then((r) => r.login);
      return Response.ok(await usuarioService.obterUsuariosFilhos(login));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterUsuariosFilhos]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('loginInicial')
  Future<Response> obterUsuariosEquipeInteira(
      @Bind.path('loginInicial') String login) async {
    try {
      final ret = await usuarioService.obterUsuariosEquipeInteira(login);
      return Response.ok(ret);
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterUsuariosEquipeInteira]',
        'exception': e.toString()
      });
    }
  }
}
