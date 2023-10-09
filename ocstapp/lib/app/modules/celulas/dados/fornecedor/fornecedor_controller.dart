import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/fornecedor_model.dart';
import 'package:OCSTApp/app/repositories/fornecedor_repository.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:mobx/mobx.dart';

part 'fornecedor_controller.g.dart';

class FornecedorController = _FornecedorControllerBase
    with _$FornecedorController;

abstract class _FornecedorControllerBase with Store {
  //
  @observable
  ObservableFuture<List<FornecedorModel>> _fornecedoresFuture;

  @computed
  StoreState get fornecedoresState =>
      StoreUtils.statusCheck(_fornecedoresFuture);

  @observable
  ObservableList<FornecedorModel> fornecedores;

  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @observable
  ObservableFuture<List<String>> _tagsFuture;

  @computed
  StoreState get tagsState => StoreUtils.statusCheck(_tagsFuture);

  @observable
  ObservableList<String> tagsModel;

  @observable
  ObservableList<String> tags;

  @computed
  List<FornecedorModel> get listFiltered {
    if (filter.isEmpty) {
      return fornecedores;
    } else {
      return (fornecedores.where((w) => w.nome.contains(filter)).toList() +
              fornecedores.where((w) => w.telefone.contains(filter)).toList() +
              fornecedores.where((w) => w.email.contains(filter)).toList() +
              fornecedores.where((w) => w.tags.contains(filter)).toList() +
              fornecedores
                  .where((w) => w.usuarioNome.contains(filter))
                  .toList())
          .toSet()
          .toList();
    }
  }

  @observable
  String sistemaRef;

  @observable
  String errorMessage;

  @action
  Future<void> obterTags() async {
    try {
      final usuarioRepository = new UsuarioRepository();
      final tagRepository = new TagRepository();
      final usuarioLogado = await usuarioRepository.getLogin();
      final usuario =
          await usuarioRepository.consultarUsuarioLogado(usuarioLogado);

      _tagsFuture = ObservableFuture(tagRepository.obterTags(usuario.id));
      List<String> tagsResultado = await _tagsFuture;
      tagsModel = tagsResultado.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar as Etiquetas';
      print(e);
    }
  }

  @action
  Future<void> obterPrimeirosFornecedoresParaTela() async {
    try {
      final usuarioRepository = new UsuarioRepository();
      final fornecedorRepository = new FornecedorRepository();
      final usuarioLogado = usuarioRepository.getLogin();
      _fornecedoresFuture = ObservableFuture(fornecedorRepository
          .obterPrimeirosFornecedoresParaTela(usuarioLogado));
      List<FornecedorModel> fornecedoresResultado = await _fornecedoresFuture;
      fornecedores = fornecedoresResultado.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar os dados dos fornecedores';
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

  List tagStringParaTagsList(String tags) {
    var listSplit = tags != null ? tags.split('|') : new List();
    var listRet = new List<Item>();
    for (var item in listSplit) {
      if (item != "") listRet.add(Item(title: item));
    }
    return listRet;
  }
}
