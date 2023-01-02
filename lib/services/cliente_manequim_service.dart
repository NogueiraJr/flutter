import 'package:ocstapi/controllers/cliente_manequim/dto/cliente_manequim_ins_request.dart';
import 'package:ocstapi/controllers/cliente_manequim/dto/cliente_manequim_upd_request.dart';
import 'package:ocstapi/model/cliente_manequim_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/cliente_manequim_repository.dart';
import 'package:ocstapi/services/usuario_service.dart';

class ClienteManequimService {
  ClienteManequimService(this.context)
      : repository = ClienteManequimRepository(context),
        usuarioService = UsuarioService(context);
  final ManagedContext context;
  final ClienteManequimRepository repository;
  final UsuarioService usuarioService;

  Future<ClienteManequimModel> clienteManequimIns(
      ClienteManequimInsRequest request) async {
    return await repository.clienteManequimIns(request);
  }

  Future<bool> clienteManequimUpd(ClienteManequimUpdRequest request) async {
    return await repository.clienteManequimUpd(request);
  }

  Future<ClienteManequimModel> obterClienteManequimPorId(int id) async {
    return await repository.obterClienteManequimPorId(id);
  }

  Future<List<ClienteManequimModel>> obterClienteManequinsPorClienteId(
      int clienteId) async {
    return await repository.obterClienteManequinsPorIdCliente(clienteId);
  }
}
