import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_del_request.dart';
import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_ins_request.dart';
import 'package:ocstapi/controllers/atendimento_servico_info/dto/atendimento_servico_info_upd_request.dart';
import 'package:ocstapi/model/atendimento_servico_info_model.dart';
import 'package:ocstapi/repository/atendimento_servico_info_repository.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/checar_antes_de_apagar_repository.dart';

class AtendimentoServicoInfoService {
  AtendimentoServicoInfoService(this.context)
      : repository = AtendimentoServicoInfoRepository(context);
  final ManagedContext context;
  final AtendimentoServicoInfoRepository repository;

  Future<List<AtendimentoServicoInfoModel>>
      consultarAtendimentoServicoInfoPorId(int id) async {
    return await repository.consultarAtendimentoServicoInfoPorId(id);
  }

  Future<List<AtendimentoServicoInfoModel>>
      consultarAtendimentoServicoInfoPorUsuarioId(int id) async {
    return await repository.consultarAtendimentoServicoInfoPorUsuarioId(id);
  }

  Future<List<AtendimentoServicoInfoModel>>
      consultarAtendimentoServicoInfoPorAtendimentoServicoId(int id) async {
    return await repository
        .consultarAtendimentoServicoInfoPorAtendimentoServicoId(id);
  }

  Future<bool> ins(AtendimentoServicoInfoInsRequest request) async {
    return await repository.ins(request);
  }

  Future<bool> upd(AtendimentoServicoInfoUpdRequest request) async {
    return await repository.upd(request);
  }

  Future<String> del(AtendimentoServicoInfoDelRequest request) async {
    final msg = await ChecarAntesDeApagarRepository(context)
        .checarAntesDeApagar(request.id, 'atendimentoServicoInfo');
    if (msg.isNotEmpty) {
      return msg;
    } else {
      return await repository.del(request);
    }
  }
}
