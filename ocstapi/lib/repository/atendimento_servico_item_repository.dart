import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_ins_request.dart';
import 'package:ocstapi/controllers/atendimento_servico_item/dto/atendimento_servico_item_del_request.dart';
import 'package:ocstapi/controllers/atendimento_servico_item/dto/atendimento_servico_item_ins_request.dart';
import 'package:ocstapi/controllers/atendimento_servico_item/dto/atendimento_servico_item_upd_request.dart';
import 'package:ocstapi/model/atendimento_servico_item_model.dart';
import 'package:ocstapi/repository/atendimento_servico_repository.dart';
import 'package:ocstapi/repository/produto_repository.dart';
import 'package:ocstapi/repository/usuario_repository.dart';

import '../ocstapi.dart';

class AtendimentoServicoItemRepository {
  AtendimentoServicoItemRepository(this.context)
      : usuarioRepository = UsuarioRepository(context),
        atendimentoServicoRepository = AtendimentoServicoRepository(context),
        produtoRepository = ProdutoRepository(context);
  final ManagedContext context;
  final UsuarioRepository usuarioRepository;
  final AtendimentoServicoRepository atendimentoServicoRepository;
  final ProdutoRepository produtoRepository;

  Future<bool> ins(AtendimentoServicoItemInsRequest request) async {
    try {
      final atendimentoServico = await atendimentoServicoRepository
          .obterAtendimentoServicoPorId(request.atendimentoServicoId);
      final produto =
          await produtoRepository.obterProdutoPorId(request.produtoId);
      final model = AtendimentoServicoItemModel();
      model.qtde = request.qtde;
      model.observacao = request.observacao ?? '';
      model.atendimentoServico = atendimentoServico;
      model.produto = produto;
      await context.insertObject(model).then((t) => t);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<bool> upd(AtendimentoServicoInfoUpdRequest request) async {
  //   try {
  //     final usuario =
  //         await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
  //     final atendimentoServico = await atendimentoServicoRepository
  //         .obterAtendimentoServicoPorId(request.atendimentoServicoId);
  //     final query = Query<AtendimentoServicoInfoModel>(context)
  //       ..values.descricao = request.descricao ?? ""
  //       ..values.quando = DateTime.now()
  //       ..values.tags = request.tags ?? ""
  //       ..values.observacao = request.observacao ?? ""
  //       ..values.usuario = usuario
  //       ..values.atendimentoServico = atendimentoServico
  //       ..where((w) => w.id).equalTo(request.id);
  //     final ret = await query.update();
  //     return ret.isNotEmpty;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  Future<String> del(AtendimentoServicoItemDelRequest request) async {
    try {
      final query = Query<AtendimentoServicoItemModel>(context)
        ..where((w) => w.id).equalTo(request.id);
      return await query.delete() > 0
          ? 'Apaguei a informação com sucesso.'
          : 'Não achei a informação para apagar.';
    } catch (e) {
      print(e);
      return 'Problemas ao apagar a informação.';
    }
  }

  Future<bool> upd(AtendimentoServicoItemUpdRequest request) async {
    try {
      final atendimentoServico = await atendimentoServicoRepository
          .obterAtendimentoServicoPorId(request.atendimentoServicoId);
      final query = Query<AtendimentoServicoItemModel>(context);
      if (request.qtde != null) {
        query.values.qtde = request.qtde;
      }
      query.values.observacao = request.observacao.trim();
      query.values.atendimentoServico = atendimentoServico;
      query.where((w) => w.id).equalTo(request.id);
      query.where((w) => w.produto.id).equalTo(request.produtoId);
      query
          .where((w) => w.atendimentoServico.id)
          .equalTo(request.atendimentoServicoId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
