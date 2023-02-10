import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_arquivar_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_cancelar_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_finalizar_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_inicio_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_ins_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_iniciar_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_novovalor_request.dart';
import 'package:ocstapi/model/atendimento_servico_info_model.dart';
import 'package:ocstapi/model/atendimento_servico_item_model.dart';
import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/cliente_pet_model.dart';
import 'package:ocstapi/model/cliente_veiculo_model.dart';
import 'package:ocstapi/repository/atendimento_servico_repository.dart';
import 'package:ocstapi/ocstapi.dart';

class AtendimentoServicoService {
  AtendimentoServicoService(this.context)
      : repository = AtendimentoServicoRepository(context);
  final ManagedContext context;
  final AtendimentoServicoRepository repository;

  Future<AtendimentoServicoModel> obterAtendimentoServicoPorId(int id) async {
    return await repository.obterAtendimentoServicoPorId(id);
  }

  Future<List<AtendimentoServicoModel>> obterAtendimentoServicoPorClienteId(
      int id) async {
    return await repository.obterAtendimentoServicoPorClienteId(id);
  }

  Future<List<AtendimentoServicoModel>> obterAtendimentoServicoPorUsuarioId(
      int id) async {
    return await repository.obterAtendimentoServicoPorUsuarioId(id);
  }

  Future<List<AtendimentoServicoModel>>
      obterAtendimentoServicoPorUsuarioEmpresaId(
          int id, String ref, String opc, String quando) async {
    return await repository.obterAtendimentoServicoPorUsuarioEmpresaId(
        id, ref, opc, quando);
  }

  Future<bool> ins(AtendimentoServicoInsRequest request) async {
    return await repository.ins(request);
  }

  Future<List<AtendimentoServicoItemModel>> consultarProdutosDoAtendimento(
      int id) async {
    return await repository.consultarProdutosDoAtendimento(id);
  }

  Future<bool> iniciar(AtendimentoServicoIniciarRequest request) async {
    return await repository.iniciar(request);
  }

  Future<bool> finalizar(AtendimentoServicoFinalizarRequest request) async {
    return await repository.finalizar(request);
  }

  Future<bool> arquivar(AtendimentoServicoArquivarRequest request) async {
    return await repository.arquivar(request);
  }

  Future<bool> cancelar(AtendimentoServicoCancelarRequest request) async {
    return await repository.cancelar(request);
  }

  Future<int> obterQtdes(int id, String ref) async {
    return await repository.obterQtdes(id, ref);
  }

  Future<ClienteVeiculoModel> obterClienteVeiculoPorIdAtendimento(
      int id) async {
    final atendimentoServicoObjeto =
        await repository.obterAtendimentoServicoObjetoPorIdAtendimento(id);
    return await repository
        .obterClienteVeiculoPorId(atendimentoServicoObjeto.clienteVeiculo.id);
  }

  Future<List<AtendimentoServicoInfoModel>> consultarAtendimentoServicoInfo(
      int id) async {
    return await repository.consultarAtendimentoServicoInfo(id);
  }

  Future<void> gravarNovoValor(
      AtendimentoServicoNovoValorRequest request) async {
    return await repository.gravarNovoValor(request);
  }

  Future<ClientePetModel> obterClientePetPorIdAtendimento(int id) async {
    final atendimentoServicoObjeto =
        await repository.obterAtendimentoServicoObjetoPorIdAtendimento(id);
    return await repository
        .obterClientePetPorId(atendimentoServicoObjeto.clientePet.id);
  }

  Future<bool> inicio(AtendimentoServicoInicioRequest request) async {
    return await repository.inicio(request);
  }
}
