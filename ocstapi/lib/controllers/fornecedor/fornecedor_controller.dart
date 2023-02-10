import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/fornecedor_service.dart';

class FornecedorController extends ResourceController {
  FornecedorController(this.context) : service = FornecedorService(context);
  ManagedContext context;
  final FornecedorService service;

  @Operation.get('id')
  Future<Response> obterFornecedorPorId(@Bind.path('id') int id) async {
    try {
      return Response.ok(await service.obterFornecedorPorId(id));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterFornecedorPorId]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idUsuario')
  Future<Response> obterFornecedoresPorIdUsuario(
      @Bind.path('idUsuario') int idUsuario) async {
    try {
      return Response.ok(
          await service.obterFornecedoresPorIdUsuario(idUsuario));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterFornecedoresPorIdUsuario]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('idUsuarioEmpresa', 'amostra')
  Future<Response> obterAmostraFornecedoresDaEmpresaInteiraPorUmIdUsuario(
      @Bind.path('idUsuarioEmpresa') String login,
      @Bind.path('amostra') int qtdeAmostra) async {
    try {
      return service
          .obterAmostraFornecedoresDaEmpresa(login, qtdeAmostra)
          .then((data) {
        return data
            .map((m) => {
                  'id': m.id,
                  'nome': m.nome,
                  'telefone': m.telefone,
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
        'message': 'ERRO [obterFornecedoresDaEmpresaInteiraPorUmIdUsuario]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('nome')
  Future<Response> obterFornecedoresPorNome(
      @Bind.path('nome') String nome) async {
    try {
      return Response.ok(await service.obterFornecedoresPorNome(nome));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterFornecedoresPorNome]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('telefone')
  Future<Response> obterFornecedoresPorTelefone(
      @Bind.path('telefone') String telefone) async {
    try {
      return Response.ok(await service.obterFornecedoresPorTelefone(telefone));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterFornecedoresPorTelefone]',
        'exception': e.toString()
      });
    }
  }

  @Operation.get('email')
  Future<Response> obterFornecedoresPorEmail(
      @Bind.path('email') String email) async {
    try {
      return Response.ok(await service.obterFornecedoresPorEmail(email));
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'ERRO [obterFornecedoresPorEmail]',
        'exception': e.toString()
      });
    }
  }
}
