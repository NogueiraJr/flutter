import 'package:ocstapi/controllers/cliente_pet/dto/cliente_pet_del_request.dart';
import 'package:ocstapi/controllers/cliente_pet/dto/cliente_pet_ins_request.dart';
import 'package:ocstapi/controllers/cliente_pet/dto/cliente_pet_upd_request.dart';
import 'package:ocstapi/model/atendimento_servico_objeto_model.dart';
import 'package:ocstapi/model/cliente_pet_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/atendimento_pet_repository.dart';
import 'package:ocstapi/repository/checar_antes_de_apagar_repository.dart';

class ClientePetService {
  ClientePetService(this.context) : repository = ClientePetRepository(context);
  final ManagedContext context;
  final ClientePetRepository repository;

  Future<ClientePetModel> clientePetIns(ClientePetInsRequest request) async {
    return await repository.clientePetIns(request);
  }

  Future<bool> clientePetUpd(ClientePetUpdRequest request) async {
    return await repository.clientePetUpd(request);
  }

  Future<String> clientePetDel(ClientePetDelRequest request) async {
    final msg = await ChecarAntesDeApagarRepository(context)
        .checarAntesDeApagar(request.id, 'clientePet');
    if (msg.isNotEmpty) {
      return msg;
    } else {
      return await repository.clientePetDel(request);
    }
  }

  Future<ClientePetModel> obterClientePetPorId(int id) async {
    return await repository.obterClientePetPorId(id);
  }

  Future<List<ClientePetModel>> obterClientePetsPorClienteId(
      int clienteId) async {
    return await repository.obterClientePetsPorIdCliente(clienteId);
  }

  Future<List<AtendimentoServicoObjetoModel>> obterAtendimentoServicoObjeto(
      int clientePetId, int atendimentoServicoId) async {
    return await repository.obterAtendimentoServicoObjeto(
        clientePetId, atendimentoServicoId);
  }

  // Future<AtendimentoServicoObjetoModel> petClienteEstaEmUso(
  //     int clientePetIdEmUso) async {
  //   return await repository.petClienteEstaEmUso(clientePetIdEmUso);
  // }
}
