import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/cliente_service.dart';

class ClienteController extends ResourceController {
  ClienteController(this.context) : service = ClienteService(context);
  ManagedContext context;
  final ClienteService service;

  @Operation.get('id')
  Future<Response> obterClientePorId(@Bind.path('id') int id) async {
    try {
      return Response.ok(await service.obterClientePorId(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClientePorId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idUsuario')
  Future<Response> obterClientesPorIdUsuario(
      @Bind.path('idUsuario') int idUsuario) async {
    try {
      return Response.ok(await service.obterClientesPorIdUsuario(idUsuario));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClientesPorIdUsuario]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idUsuarioEmpresa', 'amostra')
  Future<Response> obterAmostraClientesDaEmpresaInteiraPorUmIdUsuario(
      @Bind.path('idUsuarioEmpresa') String login,
      @Bind.path('amostra') int qtdeAmostra) async {
    try {
      return service
          .obterAmostraClientesDaEmpresa(login, qtdeAmostra)
          .then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'nome': m.nome,
                  'celular': m.celular,
                  'email': m.email,
                  'tags': m.tags ?? "",
                  'usuarioId': m.usuario.id,
                  'usuarioNome': m.usuario.pessoa,
                })
            .toList();
      }).then((r) => Response.ok(r));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClientesDaEmpresaInteiraPorUmIdUsuario]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('nome')
  Future<Response> obterClientesPorNome(@Bind.path('nome') String nome) async {
    try {
      return Response.ok(await service.obterClientesPorNome(nome));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClientesPorNome]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('celular')
  Future<Response> obterClientesPorCelular(
      @Bind.path('celular') String celular) async {
    try {
      return Response.ok(await service.obterClientesPorCelular(celular));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClientesPorCelular]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('email')
  Future<Response> obterClientesPorEmail(
      @Bind.path('email') String email) async {
    try {
      return Response.ok(await service.obterClientesPorEmail(email));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterClientesPorEmail]',
        'exception': e.toString()
      });
    }
  }
}
