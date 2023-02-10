import 'package:ocstapi/model/automotivo_model.dart';
import 'package:ocstapi/repository/automotivo_repository.dart';

import '../ocstapi.dart';

class AutomotivoService {
  AutomotivoService(this.context) : repository = AutomotivoRepository(context);
  final ManagedContext context;
  final AutomotivoRepository repository;

  Future<List<AutomotivoModel>> obterEstatisticasDeslocamento(int id) async {
    final ret = await repository.obterEstatisticasDeslocamento(id);
    ret.forEach((f) => f.distPercorida = (f.tempoGasto / 60) * f.velocMedia);
    ret.forEach((f) => f.litrosGastos = f.distPercorida / f.kmPorLitro);
    return ret;
  }
}
