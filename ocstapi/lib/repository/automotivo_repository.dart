import 'package:ocstapi/model/automotivo_model.dart';

import '../ocstapi.dart';

class AutomotivoRepository {
  AutomotivoRepository(this.context);
  final ManagedContext context;

  Future<List<AutomotivoModel>> obterEstatisticasDeslocamento(int id) async {
    final query = Query<AutomotivoModel>(context)
      ..where((c) => c.id).equalTo(id);
    return await query.fetch();
  }
}
