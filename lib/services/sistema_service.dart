import 'package:ocstapi/controllers/usuario/dto/gravar_sistema_usuario_request.dart';
import 'package:ocstapi/model/sistema_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/sistema_repository.dart';

class SistemaService {
  SistemaService(this.context) : repository = SistemaRepository(context);
  final ManagedContext context;
  final SistemaRepository repository;

  Future<List<SistemaModel>> obterSistemasAtivos() {
    return repository.obterSistemasAtivos();
  }

  Future<void> gravarSistemaUsuario(GravarSistemaUsuarioRequest request) {
    return repository.gravarSistemaUsuario(request);
  }

  Future<int> obterSistemaEscolhidoPeloUsuario(String login) {
    return repository.obterSistemaEscolhidoPeloUsuario(login);
  }

  Future<SistemaModel> obterDadosDoSistemaEscolhidoPeloUsuario(String login) {
    return repository.obterDadosDoSistemaEscolhidoPeloUsuario(login);
  }
}
