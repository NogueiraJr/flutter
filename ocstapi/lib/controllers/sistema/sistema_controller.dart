import 'package:ocstapi/controllers/usuario/dto/gravar_sistema_usuario_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/sistema_service.dart';

class SistemaController extends ResourceController {
  SistemaController(this.context) : sistemaService = SistemaService(context);
  final ManagedContext context;
  final SistemaService sistemaService;

  @Operation.post()
  Future<Response> gravarSistemaUsuario(
      @Bind.body() GravarSistemaUsuarioRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      await sistemaService.gravarSistemaUsuario(request);
      return Response.ok({'message': 'Sistema do Usuário gravado com sucesso'});
    } catch (e) {
      return Response.serverError(body: {
        'message': 'Erro ao gravar o Sistema do Usuário',
        'exception': e.toString()
      });
    }
  }

  @Operation.get()
  Future<Response> obterSistemasAtivos() async {
    final resultado = await sistemaService.obterSistemasAtivos();
    return Response.ok(resultado);
  }

  @Operation.get('login')
  Future<Response> obterSistemaEscolhidoPeloUsuario(
      @Bind.path('login') String login) async {
    final resultado =
        await sistemaService.obterSistemaEscolhidoPeloUsuario(login);
    return Response.ok({'id': resultado});
  }

  @Operation.get('loginSistema')
  Future<Response> obterDadosDoSistemaEscolhidoPeloUsuario(
      @Bind.path('loginSistema') String login) async {
    try {
      final resultado =
          await sistemaService.obterDadosDoSistemaEscolhidoPeloUsuario(login);
      return Response.ok({
        'id': resultado.id,
        'sistemaRef': resultado.sistemaRef,
        'sistemaNome': resultado.sistemaNome,
        'sistemaDescricao': resultado.sistemaDescricao,
        'sistemaFigura': resultado.sistemaFigura,
        'sistemaAtivo': resultado.sistemaAtivo
      });
    } catch (e) {
      return Response.ok({
        'id': 0,
        'sistemaRef': 'refOCSTApp',
        'sistemaNome': 'OCST App 1.0',
        'sistemaDescricao': 'Sistema ainda não definido pelo Usuário',
        'sistemaFigura': 'loja.png',
        'sistemaAtivo': 'S'
      });
    }
  }
}
