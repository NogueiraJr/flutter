import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/repositories/produto_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:mobx/mobx.dart';

part 'produto_composicao_controller.g.dart';

class ProdutoComposicaoController = _ProdutoComposicaoControllerBase
    with _$ProdutoComposicaoController;

abstract class _ProdutoComposicaoControllerBase with Store {
  final ProdutoRepository repository;

  _ProdutoComposicaoControllerBase(this.repository);

  @observable
  String errorMessage;

  //
  @observable
  ObservableFuture<List<ProdutoModel>> _produtosFuture;

  @computed
  StoreState get produtosState => StoreUtils.statusCheck(_produtosFuture);

  @observable
  ObservableList<ProdutoModel> produtos;

  @observable
  ObservableList<ProdutoModel> produtosDisponiveis;

  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @computed
  List<ProdutoModel> get listFiltered {
    if (filter.isEmpty) {
      return produtosDisponiveis;
    } else {
      return (produtosDisponiveis
                  .where((w) => w.codigo.contains(filter))
                  .toList() +
              produtosDisponiveis
                  .where((w) => w.nome.contains(filter))
                  .toList() +
              produtosDisponiveis
                  .where((w) => w.descricao.contains(filter))
                  .toList()
          //     +
          // produtosDisponiveis
          //     .where((w) => w.usuarioNome
          //
          //         .contains(filter))
          //     .toList()
          )
          .toSet()
          .toList();
    }
  }

  @action
  Future<void> obterProdutoItemPorIdProdutoPai(int id) async {
    try {
      final repository = new ProdutoRepository();
      _produtosFuture =
          ObservableFuture(repository.obterProdutoItemPorIdProdutoPai(id));
      List<ProdutoModel> res = await _produtosFuture;
      produtos = res.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar os dados dos produtos compostos';
      print(e);
    }
  }

  @action
  Future<void> obterProdutosDisponiveis(int id) async {
    try {
      final repository = new ProdutoRepository();
      _produtosFuture =
          ObservableFuture(repository.obterProdutosDisponiveis(id));
      List<ProdutoModel> res = await _produtosFuture;
      produtosDisponiveis = res.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar os dados dos produtos disponíveis';
      print(e);
    }
  }

  @action
  Future<void> incluirProdutoNaComposicao(
      int idProduto, int idProdutoIns) async {
    try {
      final repository = new ProdutoRepository();
      _produtosFuture = ObservableFuture(
          repository.inserirProdutoNaComposicao(idProduto, idProdutoIns));
      List<ProdutoModel> res = await _produtosFuture;
      produtos = res.asObservable();
      // await obterProdutoItemPorIdProdutoPai(idProduto);
    } catch (e) {
      print(e);
    }
  }
}
