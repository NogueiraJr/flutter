import 'package:ocstapi/controllers/atendimento_servico_item/dto/atendimento_servico_item_del_request.dart';
import 'package:ocstapi/controllers/atendimento_servico_item/dto/atendimento_servico_item_ins_request.dart';
import 'package:ocstapi/controllers/atendimento_servico_item/dto/atendimento_servico_item_upd_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/atendimento_servico_item_repository.dart';
import 'package:ocstapi/repository/checar_antes_de_apagar_repository.dart';

class AtendimentoServicoItemService {
  AtendimentoServicoItemService(this.context)
      : repository = AtendimentoServicoItemRepository(context);
  final ManagedContext context;
  final AtendimentoServicoItemRepository repository;

  Future<bool> ins(AtendimentoServicoItemInsRequest request) async {
    return await repository.ins(request);
  }

  // Future<bool> upd(AtendimentoServicoItemUpdRequest request) async {
  //   return await repository.upd(request);
  // }

  Future<String> del(AtendimentoServicoItemDelRequest request) async {
    final msg = await ChecarAntesDeApagarRepository(context)
        .checarAntesDeApagar(request.id, 'atendimentoServicoItem');
    if (msg.isNotEmpty) {
      return msg;
    } else {
      return await repository.del(request);
    }
  }

  Future<bool> upd(AtendimentoServicoItemUpdRequest request) async {
    return await repository.upd(request);
  }
}
