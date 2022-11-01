import 'package:ocstapi/controllers/cliente_pet/dto/cliente_pet_del_request.dart';
import 'package:ocstapi/controllers/cliente_pet/dto/cliente_pet_ins_request.dart';
import 'package:ocstapi/controllers/cliente_pet/dto/cliente_pet_upd_request.dart';
import 'package:ocstapi/model/atendimento_servico_objeto_model.dart';
import 'package:ocstapi/model/cliente_pet_model.dart';
import 'package:ocstapi/repository/cliente_repository.dart';

import '../ocstapi.dart';

class ClientePetRepository {
  ClientePetRepository(this.context)
      : clienteRepository = ClienteRepository(context);
  final ManagedContext context;
  final ClienteRepository clienteRepository;

  Future<ClientePetModel> clientePetIns(ClientePetInsRequest request) async {
    try {
      final cliente =
          await clienteRepository.obterClientePorId(request.clienteId);
      final model = ClientePetModel();
      model.cliente = cliente;
      model.nome = request.nome ?? "";
      model.raca = request.raca ?? "";
      model.anoNascimento = request.anoNascimento ?? "";
      model.mesNascimento = request.mesNascimento ?? "";
      model.cor = request.cor ?? "";
      model.observacao = request.observacao ?? "";
      return await context.insertObject(model);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> clientePetUpd(ClientePetUpdRequest request) async {
    try {
      final query = Query<ClientePetModel>(context)
        ..values.nome = request.nome ?? ""
        ..values.raca = request.raca ?? ""
        ..values.anoNascimento = request.anoNascimento ?? ""
        ..values.mesNascimento = request.mesNascimento ?? ""
        ..values.cor = request.cor ?? ""
        ..values.observacao = request.observacao ?? ""
        ..where((w) => w.id).equalTo(request.id)
        ..where((w) => w.cliente.id).equalTo(request.clienteId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> clientePetDel(ClientePetDelRequest request) async {
    try {
      final query = Query<ClientePetModel>(context)
        ..where((w) => w.id).equalTo(request.id);
      return await query.delete() > 0
          ? 'Apaguei o Pet com sucesso.'
          : 'Não achei o Pet para apagar.';
    } catch (e) {
      print(e);
      return 'Problemas ao apagar o Pet.';
    }
  }

  Future<ClientePetModel> obterClientePetPorId(int id) async {
    try {
      final query = Query<ClientePetModel>(context)
        ..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ClientePetModel>> obterClientePetsPorIdCliente(
      int clienteId) async {
    try {
      final query = Query<ClientePetModel>(context)
        ..join(object: (j) => j.cliente)
        ..where((w) => w.cliente.id).equalTo(clienteId)
        ..sortBy((s) => s.nome, QuerySortOrder.ascending)
        ..sortBy((s) => s.raca, QuerySortOrder.ascending)
        ..sortBy((s) => s.anoNascimento, QuerySortOrder.ascending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoObjetoModel>> obterAtendimentoServicoObjeto(
      int clientePetId, int atendimentoServicoId) async {
    try {
      final query = Query<AtendimentoServicoObjetoModel>(context)
        ..join(object: (j) => j.atendimentoServico)
        ..join(object: (j) => j.clientePet)
        ..where((w) => w.clientePet.id).equalTo(clientePetId)
        ..where((w) => w.atendimentoServico.id).equalTo(atendimentoServicoId)
        ..sortBy((s) => s.quando, QuerySortOrder.ascending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Future<AtendimentoServicoObjetoModel> petClienteEstaEmUso(
  //     int clientePetIdEmUso) async {
  //   try {
  //     final query = Query<AtendimentoServicoObjetoModel>(context)
  //       ..join(object: (j) => j.clientePet)
  //       ..where((w) => w.clientePet.id).equalTo(clientePetIdEmUso);
  //     return await query.fetchOne();
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }
}
