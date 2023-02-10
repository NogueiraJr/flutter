import 'package:ocstapi/model/categoria_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/categoria_repository.dart';

class CategoriaService {
  CategoriaService(this.context) : repository = CategoriaRepository(context);
  final ManagedContext context;
  final CategoriaRepository repository;

  Future<List<CategoriaModel>> buscarCategoriaPorTipo(TipoCategoria tipo) {
    return repository.buscarCategoriaPorTipo(tipo);
  }
}
