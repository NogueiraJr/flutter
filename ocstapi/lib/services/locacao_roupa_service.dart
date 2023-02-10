import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_arquivar_request.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_cancelar_request.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_devolver_request.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_ins_request.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_retirar_request.dart';
import 'package:ocstapi/model/locacao_roupa_item_model.dart';
import 'package:ocstapi/model/locacao_roupa_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/locacao_roupa_repository.dart';

class LocacaoRoupaService {
  LocacaoRoupaService(this.context)
      : repository = LocacaoRoupaRepository(context);
  final ManagedContext context;
  final LocacaoRoupaRepository repository;

  Future<LocacaoRoupaModel> obterLocacaoRoupaPorId(int id) async {
    return await repository.obterLocacaoRoupaPorId(id);
  }

  Future<List<LocacaoRoupaModel>> obterLocacaoRoupaPorClienteId(int id) async {
    return await repository.obterLocacaoRoupaPorClienteId(id);
  }

  Future<List<LocacaoRoupaModel>> obterLocacaoRoupaPorUsuarioId(int id) async {
    return await repository.obterLocacaoRoupaPorUsuarioId(id);
  }

  Future<List<LocacaoRoupaModel>> obterLocacaoRoupaPorUsuarioEmpresaId(
      int id, String ref) async {
    return await repository.obterLocacaoRoupaPorUsuarioEmpresaId(id, ref);
  }

  Future<bool> locacaoIns(LocacaoRoupaInsRequest request) async {
    return await repository.locacaoIns(request);
  }

  Future<List<LocacaoRoupaItemModel>> consultarProdutosDaLocacao(int id) async {
    return await repository.consultarProdutosDaLocacao(id);
  }

  Future<bool> locacaoRetirar(LocacaoRoupaRetirarRequest request) async {
    return await repository.locacaoRetirar(request);
  }

  Future<bool> locacaoDevolver(LocacaoRoupaDevolverRequest request) async {
    return await repository.locacaoDevolver(request);
  }

  Future<bool> locacaoArquivar(LocacaoRoupaArquivarRequest request) async {
    return await repository.locacaoArquivar(request);
  }

  Future<bool> locacaoCancelar(LocacaoRoupaCancelarRequest request) async {
    return await repository.locacaoCancelar(request);
    // TODO: depois apagar também dos demais locais relacionados a esta Locação (Financeiro, etc.)
  }

  Future<int> obterQtdeLocacoes(int id, String ref) async {
    return await repository.obterQtdeLocacoes(id, ref);
  }
}
