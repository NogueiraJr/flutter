import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/repositories/produto_repository.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:mobx/mobx.dart';

part 'escolher_produto_controller.g.dart';

class EscolherProdutoController = _EscolherProdutoControllerBase
    with _$EscolherProdutoController;

abstract class _EscolherProdutoControllerBase with Store {
  //
  @observable
  ObservableFuture<List<ProdutoModel>> _produtosFuture;

  @computed
  StoreState get produtosState => StoreUtils.statusCheck(_produtosFuture);

  @observable
  ObservableList<ProdutoModel> produtos;

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
  List<ProdutoModel> get listFiltered {
    if (filter.isEmpty) {
      return produtos;
    } else {
      return (produtos.where((w) => w.codigo.contains(filter)).toList() +
              produtos.where((w) => w.nome.contains(filter)).toList() +
              produtos.where((w) => w.descricao.contains(filter)).toList() +
              produtos.where((w) => w.tags.contains(filter)).toList() +
              produtos.where((w) => w.usuarioNome.contains(filter)).toList())
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
  Future<void> obterPrimeirosProdutosParaTela() async {
    try {
      //final usuarioRepository = new UsuarioRepository();
      final produtoRepository = new ProdutoRepository();
      // final usuarioLogado = usuarioRepository.getLogin();
      _produtosFuture = ObservableFuture(
          produtoRepository.obterPrimeirosProdutosParaTela(/*usuarioLogado*/));
      List<ProdutoModel> produtosResultado = await _produtosFuture;
      produtos = produtosResultado.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar os dados dos produtos';
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
