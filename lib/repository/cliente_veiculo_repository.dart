import 'package:ocstapi/controllers/cliente_veiculo/dto/cliente_veiculo_del_request.dart';
import 'package:ocstapi/controllers/cliente_veiculo/dto/cliente_veiculo_ins_request.dart';
import 'package:ocstapi/controllers/cliente_veiculo/dto/cliente_veiculo_upd_request.dart';
import 'package:ocstapi/model/atendimento_servico_objeto_model.dart';
import 'package:ocstapi/model/cliente_veiculo_model.dart';
import 'package:ocstapi/repository/cliente_repository.dart';

import '../ocstapi.dart';

class ClienteVeiculoRepository {
  ClienteVeiculoRepository(this.context)
      : clienteRepository = ClienteRepository(context);
  final ManagedContext context;
  final ClienteRepository clienteRepository;

  Future<ClienteVeiculoModel> clienteVeiculoIns(
      ClienteVeiculoInsRequest request) async {
    try {
      final cliente =
          await clienteRepository.obterClientePorId(request.clienteId);
      final model = ClienteVeiculoModel();
      model.cliente = cliente;
      model.marca = request.marca ?? "";
      model.modelo = request.modelo ?? "";
      model.ano = request.ano ?? "";
      model.cor = request.cor ?? "";
      model.placa = request.placa ?? "";
      model.observacao = request.observacao ?? "";
      return await context.insertObject(model);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> clienteVeiculoUpd(ClienteVeiculoUpdRequest request) async {
    try {
      final query = Query<ClienteVeiculoModel>(context)
        ..values.marca = request.marca ?? ""
        ..values.modelo = request.modelo ?? ""
        ..values.ano = request.ano ?? ""
        ..values.cor = request.cor ?? ""
        ..values.placa = request.placa ?? ""
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

  Future<String> clienteVeiculoDel(ClienteVeiculoDelRequest request) async {
    try {
      final query = Query<ClienteVeiculoModel>(context)
        ..where((w) => w.id).equalTo(request.id);
      return await query.delete() > 0
          ? 'Apaguei o Veículo com sucesso.'
          : 'Não achei o Veículo para apagar.';
    } catch (e) {
      print(e);
      return 'Problemas ao apagar o Veículo.';
    }
  }

  Future<ClienteVeiculoModel> obterClienteVeiculoPorId(int id) async {
    try {
      final query = Query<ClienteVeiculoModel>(context)
        ..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ClienteVeiculoModel>> obterClienteVeiculosPorIdCliente(
      int clienteId) async {
    try {
      final query = Query<ClienteVeiculoModel>(context)
        ..join(object: (j) => j.cliente)
        ..where((w) => w.cliente.id).equalTo(clienteId)
        ..sortBy((s) => s.marca, QuerySortOrder.ascending)
        ..sortBy((s) => s.modelo, QuerySortOrder.ascending)
        ..sortBy((s) => s.ano, QuerySortOrder.ascending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoObjetoModel>> obterAtendimentoServicoObjeto(
      int clienteVeiculoId, int atendimentoServicoId) async {
    try {
      final query = Query<AtendimentoServicoObjetoModel>(context)
        ..join(object: (j) => j.atendimentoServico)
        ..join(object: (j) => j.clienteVeiculo)
        ..where((w) => w.clienteVeiculo.id).equalTo(clienteVeiculoId)
        ..where((w) => w.atendimentoServico.id).equalTo(atendimentoServicoId)
        ..sortBy((s) => s.quando, QuerySortOrder.ascending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Future<AtendimentoServicoObjetoModel> veiculoClienteEstaEmUso(
  //     int clienteVeiculoIdEmUso) async {
  //   try {
  //     final query = Query<AtendimentoServicoObjetoModel>(context)
  //       ..join(object: (j) => j.clienteVeiculo)
  //       ..where((w) => w.clienteVeiculo.id).equalTo(clienteVeiculoIdEmUso);
  //     return await query.fetchOne();
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }
}
