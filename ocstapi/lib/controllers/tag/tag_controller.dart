import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/tag_service.dart';

class TagController extends ResourceController {
  TagController(this.context) : service = TagService(context);
  ManagedContext context;
  final TagService service;

  @Operation.get('id')
  Future<Response> obterTagsPorId(@Bind.path('id') int id) async {
    try {
      return Response.ok(await service.obterTagsPorId(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterTagsPorId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idUsuario')
  Future<Response> obterTagsPorIdUsuario(
      @Bind.path('idUsuario') int idUsuario) async {
    try {
      return await service.obterTagsPorIdUsuario(idUsuario).then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'nome': m.nome,
                  'usuarioId': m.usuario.id,
                  'usuarioNome': m.usuario.pessoa,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterTagsPorIdUsuario]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('nome', 'usuarioId', 'id')
  Future<Response> obterTagsPorNome(@Bind.path('nome') String nome,
      @Bind.path('usuarioId') int usuarioId, @Bind.path('id') int id) async {
    try {
      return Response.ok(
          await service.obterTagsPorNome(id, nome.trim(), usuarioId));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterTagsPorNome]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idUsuarioEmpresa', 'amostra')
  Future<Response> obterAmostraTagsDaEmpresaInteiraPorUmIdUsuario(
      @Bind.path('idUsuarioEmpresa') String login,
      @Bind.path('amostra') int qtdeAmostra) async {
    try {
      return service.obterAmostraTagsDaEmpresa(login, qtdeAmostra).then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'nome': m.nome,
                  'descricao': m.descricao ?? "",
                  'usuarioId': m.usuario.id,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterAmostraTagsDaEmpresaInteiraPorUmIdUsuario]',
        'exception': e.toString()
      });
    }
  }
}
