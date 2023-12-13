import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/models/produto_resumo_model.dart';
import 'package:OCSTApp/app/models/tag_model.dart';
import 'package:OCSTApp/app/repositories/produto_repository.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:mobx/mobx.dart';

part 'produto_controller.g.dart';

class ProdutoController = _ProdutoControllerBase with _$ProdutoController;

abstract class _ProdutoControllerBase with Store {
  _ProdutoControllerBase();

  //
  @observable
  ObservableFuture<List<ProdutoModel>> _produtosFuture;

  @observable
  ObservableFuture<ProdutoModel> _produtoFuture;

  @observable
  ObservableFuture<ProdutoResumoModel> _produtoResumoFuture;

  @computed
  StoreState get produtosState => StoreUtils.statusCheck(_produtosFuture);

  @computed
  StoreState get produtoResumoState =>
      StoreUtils.statusCheck(_produtoResumoFuture);

  @observable
  ObservableList<ProdutoModel> produtos;

  @observable
  ProdutoResumoModel produtoResumo;

  @observable
  ObservableFuture<List<ProdutoModel>> _compoeFuture;
  @computed
  StoreState get compoeState => StoreUtils.statusCheck(_compoeFuture);
  @observable
  ObservableList<ProdutoModel> compoe;

  @observable
  ObservableFuture<List<ProdutoModel>> _compostoFuture;
  @computed
  StoreState get compostoState => StoreUtils.statusCheck(_compostoFuture);
  @observable
  ObservableList<ProdutoModel> composto;

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

  Future<ProdutoModel> obterProdutoPorId(int idProduto) async {
    final produtoRepository = new ProdutoRepository();
    _produtoFuture =
        ObservableFuture(produtoRepository.obterProdutoPorId(idProduto));
    ProdutoModel produtoResultado = await _produtoFuture;
    return produtoResultado;
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

  Future<void> consultarResumoDoProduto(ProdutoModel item) async {
    try {
      final produtoRepository = new ProdutoRepository();
      _produtoResumoFuture =
          ObservableFuture(produtoRepository.consultarResumoDoProduto(item.id));
      ProdutoResumoModel resultado = await _produtoResumoFuture;
      produtoResumo = resultado;

      // await mostaListaCompoe();

      // await montaListaComposto();
      //
    } catch (e) {
      errorMessage = 'Erro ao buscar o resumo do produto';
      print(e);
    }
  }

  Future<void> montaListaComposto() async {
    _compostoFuture = ObservableFuture(_montaListaComposto());
    List<ProdutoModel> compostoResultado = await _compostoFuture;
    composto = compostoResultado.asObservable();
  }

  Future<void> montaListaCompoe() async {
    _compoeFuture = ObservableFuture(_montaListaCompoe());
    List<ProdutoModel> compoeResultado = await _compoeFuture;
    compoe = compoeResultado.asObservable();
  }

  Future<List<ProdutoModel>> _montaListaCompoe() async {
    List<ProdutoModel> _compoe = [];
    for (var item in produtoResumo.compoe) {
      print(item);
      _compoe.add(ProdutoModel.fromMapResumo(item));
    }
    return _compoe;
  }

  Future<List<ProdutoModel>> _montaListaComposto() async {
    List<ProdutoModel> _composto = [];
    for (var item in produtoResumo.composto) {
      print(item);
      _composto.add(ProdutoModel.fromMapResumo(item));
    }
    return _composto;
  }
}
