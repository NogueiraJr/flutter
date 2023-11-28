// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_composicao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoComposicaoController on _ProdutoComposicaoControllerBase, Store {
  Computed<StoreState> _$produtosStateComputed;

  @override
  StoreState get produtosState => (_$produtosStateComputed ??=
          Computed<StoreState>(() => super.produtosState))
      .value;
  Computed<List<ProdutoModel>> _$listFilteredComputed;

  @override
  List<ProdutoModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<ProdutoModel>>(() => super.listFiltered))
      .value;

  final _$errorMessageAtom =
      Atom(name: '_ProdutoComposicaoControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$_produtosFutureAtom =
      Atom(name: '_ProdutoComposicaoControllerBase._produtosFuture');

  @override
  ObservableFuture<List<ProdutoModel>> get _produtosFuture {
    _$_produtosFutureAtom.context.enforceReadPolicy(_$_produtosFutureAtom);
    _$_produtosFutureAtom.reportObserved();
    return super._produtosFuture;
  }

  @override
  set _produtosFuture(ObservableFuture<List<ProdutoModel>> value) {
    _$_produtosFutureAtom.context.conditionallyRunInAction(() {
      super._produtosFuture = value;
      _$_produtosFutureAtom.reportChanged();
    }, _$_produtosFutureAtom, name: '${_$_produtosFutureAtom.name}_set');
  }

  final _$produtosAtom =
      Atom(name: '_ProdutoComposicaoControllerBase.produtos');

  @override
  ObservableList<ProdutoModel> get produtos {
    _$produtosAtom.context.enforceReadPolicy(_$produtosAtom);
    _$produtosAtom.reportObserved();
    return super.produtos;
  }

  @override
  set produtos(ObservableList<ProdutoModel> value) {
    _$produtosAtom.context.conditionallyRunInAction(() {
      super.produtos = value;
      _$produtosAtom.reportChanged();
    }, _$produtosAtom, name: '${_$produtosAtom.name}_set');
  }

  final _$produtosDisponiveisAtom =
      Atom(name: '_ProdutoComposicaoControllerBase.produtosDisponiveis');

  @override
  ObservableList<ProdutoModel> get produtosDisponiveis {
    _$produtosDisponiveisAtom.context
        .enforceReadPolicy(_$produtosDisponiveisAtom);
    _$produtosDisponiveisAtom.reportObserved();
    return super.produtosDisponiveis;
  }

  @override
  set produtosDisponiveis(ObservableList<ProdutoModel> value) {
    _$produtosDisponiveisAtom.context.conditionallyRunInAction(() {
      super.produtosDisponiveis = value;
      _$produtosDisponiveisAtom.reportChanged();
    }, _$produtosDisponiveisAtom,
        name: '${_$produtosDisponiveisAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_ProdutoComposicaoControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$obterProdutoItemPorIdProdutoPaiAsyncAction =
      AsyncAction('obterProdutoItemPorIdProdutoPai');

  @override
  Future<void> obterProdutoItemPorIdProdutoPai(int id) {
    return _$obterProdutoItemPorIdProdutoPaiAsyncAction
        .run(() => super.obterProdutoItemPorIdProdutoPai(id));
  }

  final _$obterProdutosDisponiveisAsyncAction =
      AsyncAction('obterProdutosDisponiveis');

  @override
  Future<void> obterProdutosDisponiveis(int id) {
    return _$obterProdutosDisponiveisAsyncAction
        .run(() => super.obterProdutosDisponiveis(id));
  }

  final _$incluirProdutoNaComposicaoAsyncAction =
      AsyncAction('incluirProdutoNaComposicao');

  @override
  Future<void> incluirProdutoNaComposicao(int idProduto, int idProdutoIns) {
    return _$incluirProdutoNaComposicaoAsyncAction
        .run(() => super.incluirProdutoNaComposicao(idProduto, idProdutoIns));
  }

  final _$_ProdutoComposicaoControllerBaseActionController =
      ActionController(name: '_ProdutoComposicaoControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo =
        _$_ProdutoComposicaoControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_ProdutoComposicaoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'errorMessage: ${errorMessage.toString()},produtos: ${produtos.toString()},produtosDisponiveis: ${produtosDisponiveis.toString()},filter: ${filter.toString()},produtosState: ${produtosState.toString()},listFiltered: ${listFiltered.toString()}';
    return '{$string}';
  }
}
