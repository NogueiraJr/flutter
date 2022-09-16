import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';

import 'dto/cadastrar_usuario_request.dart';

class UsuarioController extends ResourceController {
  UsuarioController(this.context) : usuarioService = UsuarioService(context);
  final ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> cadastrar(
      @Bind.body() CadastrarUsuarioRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      final codigo = await usuarioService.cadastrarUsuario(request);
      return Response.ok(
          {'message': 'Usuário cadastrado com sucesso', 'codigo': codigo});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao cadastrar usuário',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('login')
  Future<Response> usuarioExiste(@Bind.path('login') String login) async {
    final resultado = await usuarioService.obterUsuarioPorLogin(login);
    if (resultado != null) {
      return Response.ok({'resposta': 'SIM'});
    } else {
      return Response.ok({'resposta': 'NAO'});
    }
  }

  @Operation.get('login', 'email')
  Future<Response> usuarioEmailExistem(@Bind.path('login') String login,
      @Bind.path('email') String email) async {
    final resultado =
        await usuarioService.obterUsuarioPorLoginEmail(login, email);
    if (resultado != null) {
      return Response.ok({'resposta': 'SIM'});
    } else {
      return Response.ok({'resposta': 'NAO'});
    }
  }

  @Operation.get('user')
  Future<Response> usuarioValidado(@Bind.path('user') String login) async {
    final resultado = await usuarioService.usuarioValidado(login);
    if (resultado != null) {
      return Response.ok({'resposta': 'SIM'});
    } else {
      return Response.ok({'resposta': 'NAO'});
    }
  }

  @Operation.get('userAdmin')
  Future<Response> usuarioAdmin(@Bind.path('userAdmin') String login) async {
    final resultado = await usuarioService.usuarioAdmin(login);
    if (resultado != null) {
      return Response.ok({'resposta': 'SIM'});
    } else {
      return Response.ok({'resposta': 'NAO'});
    }
  }

  @Operation.get('userBloc')
  Future<Response> usuarioBloqueado(@Bind.path('userBloc') String login) async {
    final resultado = await usuarioService.usuarioBloqueado(login);
    if (resultado != null) {
      return Response.ok({'resposta': 'SIM'});
    } else {
      return Response.ok({'resposta': 'NAO'});
    }
  }

  @Operation.get('loginConsultar')
  Future<Response> consultarUsuarioPorLogin(
      @Bind.path('loginConsultar') String login) async {
    final resultado = await usuarioService.consultarUsuarioPorLogin(login);
    return Response.ok(resultado);
  }

  @Operation.get('idConsultar')
  Future<Response> consultarUsuarioPorId(
      @Bind.path('idConsultar') int id) async {
    final resultado = await usuarioService.consultarUsuarioPorId(id);
    return Response.ok(resultado);
  }

  @Operation.get('loginUsuarioPai')
  Future<Response> obterListaIdsUsuariosFilhosPorLoginPai(
      @Bind.path('loginUsuarioPai') String loginUsuarioPai) async {
    final resultado = await usuarioService
        .obterListaIdsUsuariosFilhosPorLoginPai(loginUsuarioPai);
    return Response.ok(resultado);
  }
}
