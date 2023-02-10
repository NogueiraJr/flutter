import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_del_request.dart';
import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_ins_request.dart';
import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_upd_request.dart';
import 'package:ocstapi/model/atendimento_servico_info_model.dart';
import 'package:ocstapi/repository/atendimento_servico_repository.dart';
import 'package:ocstapi/repository/usuario_repository.dart';

import '../ocstapi.dart';

class AtendimentoServicoInfoRepository {
  AtendimentoServicoInfoRepository(this.context)
      : usuarioRepository = UsuarioRepository(context),
        atendimentoServicoRepository = AtendimentoServicoRepository(context);
  final ManagedContext context;
  final UsuarioRepository usuarioRepository;
  final AtendimentoServicoRepository atendimentoServicoRepository;

  Future<List<AtendimentoServicoInfoModel>>
      consultarAtendimentoServicoInfoPorId(int id) async {
    try {
      final query = Query<AtendimentoServicoInfoModel>(context)
        ..join(object: (j) => j.usuario)
        ..join(object: (j) => j.atendimentoServico)
        ..where((w) => w.id).equalTo(id);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoInfoModel>>
      consultarAtendimentoServicoInfoPorUsuarioId(int id) async {
    try {
      final query = Query<AtendimentoServicoInfoModel>(context)
        ..join(object: (j) => j.usuario)
        ..join(object: (j) => j.atendimentoServico)
        ..where((w) => w.usuario.id).equalTo(id)
        ..sortBy((s) => s.quando, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoInfoModel>>
      consultarAtendimentoServicoInfoPorAtendimentoServicoId(int id) async {
    try {
      final query = Query<AtendimentoServicoInfoModel>(context)
        ..join(object: (j) => j.usuario)
        ..join(object: (j) => j.atendimentoServico)
        ..where((w) => w.atendimentoServico.id).equalTo(id)
        ..sortBy((s) => s.quando, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> ins(AtendimentoServicoInfoInsRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final atendimentoServico = await atendimentoServicoRepository
          .obterAtendimentoServicoPorId(request.atendimentoServicoId);
      final model = AtendimentoServicoInfoModel();
      model.descricao = request.descricao ?? '';
      model.quando = DateTime.now();
      model.tags = request.tags ?? '';
      model.observacao = request.observacao ?? '';
      model.usuario = usuario;
      model.atendimentoServico = atendimentoServico;
      await context.insertObject(model).then((t) => t);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> upd(AtendimentoServicoInfoUpdRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final atendimentoServico = await atendimentoServicoRepository
          .obterAtendimentoServicoPorId(request.atendimentoServicoId);
      final query = Query<AtendimentoServicoInfoModel>(context)
        ..values.descricao = request.descricao ?? ""
        ..values.quandoAlterado = DateTime.now()
        ..values.tags = request.tags ?? ""
        ..values.observacao = request.observacao ?? ""
        ..values.usuario = usuario
        ..values.atendimentoServico = atendimentoServico
        ..where((w) => w.id).equalTo(request.id);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> del(AtendimentoServicoInfoDelRequest request) async {
    try {
      final query = Query<AtendimentoServicoInfoModel>(context)
        ..where((w) => w.id).equalTo(request.id);
      return await query.delete() > 0
          ? 'Apaguei a informação com sucesso.'
          : 'Não achei a informação para apagar.';
    } catch (e) {
      print(e);
      return 'Problemas ao apagar a informação.';
    }
  }
}
