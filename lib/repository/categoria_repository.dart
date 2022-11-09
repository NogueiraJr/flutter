import 'package:ocstapi/model/categoria_model.dart';
import 'package:ocstapi/ocstapi.dart';

class CategoriaRepository {
  CategoriaRepository(this.context);
  final ManagedContext context;

  Future<List<CategoriaModel>> buscarCategoriaPorTipo(
      TipoCategoria tipoCategoria) {
    final query = Query<CategoriaModel>(context)
      ..where((c) => c.tipoCategoria).equalTo(tipoCategoria)
      ..sortBy((s) => s.nome, QuerySortOrder.ascending);
    return query.fetch();
  }

  Future<CategoriaModel> buscarPorId(int id) {
    final query = Query<CategoriaModel>(context)
      ..where((c) => c.id).equalTo(id);
    return query.fetchOne();
  }
}
