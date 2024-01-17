import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/tag_model.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:mobx/mobx.dart';

part 'tag_controller.g.dart';

class TagController = _TagControllerBase with _$TagController;

abstract class _TagControllerBase with Store {
  //
  @observable
  ObservableFuture<List<TagModel>> _tagsFuture;

  @computed
  StoreState get tagsState => StoreUtils.statusCheck(_tagsFuture);

  @observable
  ObservableList<TagModel> tags;

  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @computed
  List<TagModel> get listFiltered {
    if (filter.isEmpty) {
      return tags;
    } else {
      return (tags.where((w) => w.nome.contains(filter)).toList() +
              tags.where((w) => w.descricao.contains(filter)).toList())
          .toSet()
          .toList();
    }
  }

  @observable
  String sistemaRef;

  @observable
  String errorMessage;

  @action
  Future<void> obterPrimeirosTagsParaTela() async {
    try {
      final usuarioRepository = new UsuarioRepository();
      final tagRepository = new TagRepository();
      final usuarioLogado = usuarioRepository.getLogin();
      _tagsFuture = ObservableFuture(
          tagRepository.obterPrimeirasTagsParaTela(usuarioLogado));
      List<TagModel> tagsResultado = await _tagsFuture;
      tags = tagsResultado.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar os dados dos Tags';
      print(e);
    }
  }

  @action
  Future<void> obterSistemaUsuarioLogado() async {
    final usuarioRepository = new UsuarioRepository();
    sistemaRef = await usuarioRepository
        .obterDadosDoSistemaEscolhidoPeloUsuario(
            await usuarioRepository.getLogin())
        .then((res) => res.sistemaRef);
  }
}
