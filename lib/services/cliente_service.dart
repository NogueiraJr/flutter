import 'package:ocstapi/controllers/cliente/dto/cliente_del_request.dart';
import 'package:ocstapi/controllers/cliente/dto/cliente_ins_request.dart';
import 'package:ocstapi/controllers/cliente/dto/cliente_upd_request.dart';
import 'package:ocstapi/model/cliente_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/checar_antes_de_apagar_repository.dart';
import 'package:ocstapi/repository/cliente_repository.dart';
import 'package:ocstapi/repository/usuario_repository.dart';
import 'package:ocstapi/services/usuario_service.dart';

class ClienteService {
  ClienteService(this.context)
      : repository = ClienteRepository(context),
        usuarioRepository = UsuarioRepository(context),
        usuarioService = UsuarioService(context);
  final ManagedContext context;
  final ClienteRepository repository;
  final UsuarioRepository usuarioRepository;
  final UsuarioService usuarioService;

  Future<ClienteModel> clienteIns(ClienteInsRequest request) async {
    return await repository.clienteIns(request);
  }

  Future<bool> clienteUpd(ClienteUpdRequest request) async {
    return await repository.clienteUpd(request);
  }

  Future<String> clienteDel(ClienteDelRequest request) async {
    final msg = await ChecarAntesDeApagarRepository(context)
        .checarAntesDeApagar(request.id, 'cliente');
    if (msg.isNotEmpty) {
      return msg;
    } else {
      return await repository.clienteDel(request);
    }
  }

  Future<ClienteModel> obterClientePorId(int id) async {
    return await repository.obterClientePorId(id);
  }

  Future<List<ClienteModel>> obterClientesPorIdUsuario(int idUsuario) async {
    return await repository.obterClientesPorIdUsuario(idUsuario);
  }

  Future<List<ClienteModel>> obterClientesPorNome(String nome) async {
    return await repository.obterClientesPorNome(nome);
  }

  Future<List<ClienteModel>> obterClientesPorCelular(String celular) async {
    return await repository.obterClientesPorCelular(celular);
  }

  Future<List<ClienteModel>> obterClientesPorEmail(String email) async {
    return await repository.obterClientesPorEmail(email);
  }

  Future<List<ClienteModel>> obterAmostraClientesDaEmpresa(
      String login, int qtdeAmostra) async {
    final id = await usuarioRepository.obterIdPorLogin(login);
    final idDono = await usuarioRepository.obterIdProprietarioDaEmpresa(id);
    final dono = await usuarioRepository.consultarUsuarioPorId(idDono);
    final usuarios = await usuarioService.obterUsuariosEquipe(dono.login);
    final ids = <int>[];
    for (var usuario in usuarios) {
      ids.add(usuario.id);
    }
    //Inclusive o Dono!
    ids.add(idDono);

    final clientesEmpresa =
        await repository.obterAmostraClientesDaEmpresa(ids, qtdeAmostra);
    return clientesEmpresa;
  }
}
