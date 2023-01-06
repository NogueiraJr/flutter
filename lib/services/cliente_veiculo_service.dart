import 'package:ocstapi/controllers/cliente_veiculo/dto/cliente_veiculo_del_request.dart';
import 'package:ocstapi/controllers/cliente_veiculo/dto/cliente_veiculo_ins_request.dart';
import 'package:ocstapi/controllers/cliente_veiculo/dto/cliente_veiculo_upd_request.dart';
import 'package:ocstapi/model/atendimento_servico_objeto_model.dart';
import 'package:ocstapi/model/cliente_veiculo_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/checar_antes_de_apagar_repository.dart';
import 'package:ocstapi/repository/cliente_veiculo_repository.dart';

class ClienteVeiculoService {
  ClienteVeiculoService(this.context)
      : repository = ClienteVeiculoRepository(context);
  final ManagedContext context;
  final ClienteVeiculoRepository repository;

  Future<ClienteVeiculoModel> clienteVeiculoIns(
      ClienteVeiculoInsRequest request) async {
    return await repository.clienteVeiculoIns(request);
  }

  Future<bool> clienteVeiculoUpd(ClienteVeiculoUpdRequest request) async {
    return await repository.clienteVeiculoUpd(request);
  }

  Future<String> clienteVeiculoDel(ClienteVeiculoDelRequest request) async {
    final msg = await ChecarAntesDeApagarRepository(context)
        .checarAntesDeApagar(request.id, 'clienteVeiculo');
    if (msg.isNotEmpty) {
      return msg;
    } else {
      return await repository.clienteVeiculoDel(request);
    }
  }

  Future<ClienteVeiculoModel> obterClienteVeiculoPorId(int id) async {
    return await repository.obterClienteVeiculoPorId(id);
  }

  Future<List<ClienteVeiculoModel>> obterClienteVeiculosPorClienteId(
      int clienteId) async {
    return await repository.obterClienteVeiculosPorIdCliente(clienteId);
  }

  Future<List<AtendimentoServicoObjetoModel>> obterAtendimentoServicoObjeto(
      int clienteVeiculoId, int atendimentoServicoId) async {
    return await repository.obterAtendimentoServicoObjeto(
        clienteVeiculoId, atendimentoServicoId);
  }

  // Future<AtendimentoServicoObjetoModel> veiculoClienteEstaEmUso(
  //     int clienteVeiculoIdEmUso) async {
  //   return await repository.veiculoClienteEstaEmUso(clienteVeiculoIdEmUso);
  // }
}
