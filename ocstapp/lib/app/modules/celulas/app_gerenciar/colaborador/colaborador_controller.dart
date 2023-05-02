import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'colaborador_controller.g.dart';

class ColaboradorController = _ColaboradorControllerBase
    with _$ColaboradorController;

abstract class _ColaboradorControllerBase with Store {
  final UsuarioRepository repository;

  _ColaboradorControllerBase(
    this.repository,
  );

  @observable
  String login;

  @observable
  UsuarioConsultaModel candidatoLider;

  @observable
  String errorMessage;

  @observable
  ObservableFuture<List<UsuarioConsultaModel>> _usuariosFuture;

  @observable
  ObservableFuture<List<UsuarioConsultaModel>> _usuariosLideradosFuture;

  @observable
  ObservableFuture<UsuarioConsultaModel> _colaboradorAnterior;

  @observable
  UsuarioConsultaModel usuarioAnterior;

  @observable
  ObservableList<UsuarioConsultaModel> usuarios;

  @observable
  ObservableList<UsuarioConsultaModel> usuariosLiderados;

  @computed
  StoreState get menusState => StoreUtils.statusCheck(_usuariosFuture);

  @action
  Future<void> obterUsuarioRaiz() async {
    candidatoLider =
        await repository.consultarUsuarioLogado(await repository.getLogin());
  }

  @action
  Future<void> obterDadosUsuario() async {
    try {
      var loginParam = await repository.getUltimoLoginParam();
      _colaboradorAnterior =
          ObservableFuture(repository.consultarUsuarioLogado(loginParam));
      UsuarioConsultaModel usuariosResultado = await _colaboradorAnterior;
      usuarioAnterior = usuariosResultado;
    } catch (e) {
      errorMessage = 'Erro ao buscar os dados do usuário logado';
      print(e);
    }
  }

  @action
  Future<void> obterDados() async {
    try {
      login = await repository.getLogin();
      _usuariosFuture =
          ObservableFuture(repository.consultarUsuariosFilhos(login));
      List<UsuarioConsultaModel> usuariosResultado = await _usuariosFuture;
      usuarios = usuariosResultado.asObservable();

      print('usuariosResultado: $usuariosResultado');
      print('usuarios: $usuarios');
    } catch (e) {
      errorMessage = 'Erro ao buscar os usuarios filhos';
      print(e);
    }
  }

  @action
  Future<void> obterDadosParaListaEquipe() async {
    try {
      login =
          await repository.getUltimoLoginParam() ?? await repository.getLogin();
      _usuariosFuture =
          ObservableFuture(repository.consultarUsuariosFilhos(login));
      List<UsuarioConsultaModel> usuariosResultado = await _usuariosFuture;
      usuarios = usuariosResultado.asObservable();
      //await repository.setLoginParam(null);

      print('usuariosResultado: $usuariosResultado');
      print('usuarios: $usuarios');
    } catch (e) {
      errorMessage = 'Erro ao buscar os usuarios filhos';
      print(e);
    }
  }

  @action
  Future<bool> obterLiderados(int id) async {
    try {
      login = await repository.obterLoginPorId(id);
      _usuariosLideradosFuture =
          ObservableFuture(repository.consultarUsuariosFilhos(login));
      List<UsuarioConsultaModel> usuariosResultado =
          await _usuariosLideradosFuture;
      usuariosLiderados = usuariosResultado.asObservable();

      print('usuariosResultado: $usuariosResultado');
      print('usuariosLiderados: $usuariosLiderados');
    } catch (e) {
      errorMessage = 'Erro ao buscar os usuariosLiderados';
      print(e);
      return false;
    }
    return true;
  }

  @action
  Future<bool> removeUltimoLoginParam() async {
    await repository.removeUltimoLoginParam();
    return true;
  }

  @action
  Future<bool> defineProprietarioComoLoginParam() async {
    await repository.defineProprietarioComoLoginParam();
    return true;
  }

  @action
  Future<void> voltarAoInicio() async {
    //Get.offAllNamed('/colaborador');
    Get.toNamed('/app_gerenciar');
  }
}
