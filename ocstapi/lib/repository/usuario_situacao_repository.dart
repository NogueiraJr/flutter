import 'package:ocstapi/model/usuario_situacao_model.dart';
import 'package:ocstapi/ocstapi.dart';

class UsuarioSituacaoRepository {
  UsuarioSituacaoRepository(
    this.context,
  );
  final ManagedContext context;

  Future<UsuarioSituacaoModel> buscarPorId(int id) {
    final query = Query<UsuarioSituacaoModel>(context)
      ..where((c) => c.id).equalTo(id);
    return query.fetchOne();
  }
}
