// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escolher_produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EscolherProdutoController on _EscolherProdutoControllerBase, Store {
  Computed<StoreState> _$produtosStateComputed;

  @override
  StoreState get produtosState => (_$produtosStateComputed ??=
          Computed<StoreState>(() => super.produtosState))
      .value;
  Computed<StoreState> _$tagsStateComputed;

  @override
  StoreState get tagsState =>
      (_$tagsStateComputed ??= Computed<StoreState>(() => super.tagsState))
          .value;
  Computed<List<ProdutoModel>> _$listFilteredComputed;

  @override
  List<ProdutoModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<ProdutoModel>>(() => super.listFiltered))
      .value;

  final _$_produtosFutureAtom =
      Atom(name: '_EscolherProdutoControllerBase._produtosFuture');

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

  final _$produtosAtom = Atom(name: '_EscolherProdutoControllerBase.produtos');

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

  final _$filterAtom = Atom(name: '_EscolherProdutoControllerBase.filter');

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

  final _$_tagsFutureAtom =
      Atom(name: '_EscolherProdutoControllerBase._tagsFuture');

  @override
  ObservableFuture<List<String>> get _tagsFuture {
    _$_tagsFutureAtom.context.enforceReadPolicy(_$_tagsFutureAtom);
    _$_tagsFutureAtom.reportObserved();
    return super._tagsFuture;
  }

  @override
  set _tagsFuture(ObservableFuture<List<String>> value) {
    _$_tagsFutureAtom.context.conditionallyRunInAction(() {
      super._tagsFuture = value;
      _$_tagsFutureAtom.reportChanged();
    }, _$_tagsFutureAtom, name: '${_$_tagsFutureAtom.name}_set');
  }

  final _$tagsModelAtom =
      Atom(name: '_EscolherProdutoControllerBase.tagsModel');

  @override
  ObservableList<String> get tagsModel {
    _$tagsModelAtom.context.enforceReadPolicy(_$tagsModelAtom);
    _$tagsModelAtom.reportObserved();
    return super.tagsModel;
  }

  @override
  set tagsModel(ObservableList<String> value) {
    _$tagsModelAtom.context.conditionallyRunInAction(() {
      super.tagsModel = value;
      _$tagsModelAtom.reportChanged();
    }, _$tagsModelAtom, name: '${_$tagsModelAtom.name}_set');
  }

  final _$tagsAtom = Atom(name: '_EscolherProdutoControllerBase.tags');

  @override
  ObservableList<String> get tags {
    _$tagsAtom.context.enforceReadPolicy(_$tagsAtom);
    _$tagsAtom.reportObserved();
    return super.tags;
  }

  @override
  set tags(ObservableList<String> value) {
    _$tagsAtom.context.conditionallyRunInAction(() {
      super.tags = value;
      _$tagsAtom.reportChanged();
    }, _$tagsAtom, name: '${_$tagsAtom.name}_set');
  }

  final _$sistemaRefAtom =
      Atom(name: '_EscolherProdutoControllerBase.sistemaRef');

  @override
  String get sistemaRef {
    _$sistemaRefAtom.context.enforceReadPolicy(_$sistemaRefAtom);
    _$sistemaRefAtom.reportObserved();
    return super.sistemaRef;
  }

  @override
  set sistemaRef(String value) {
    _$sistemaRefAtom.context.conditionallyRunInAction(() {
      super.sistemaRef = value;
      _$sistemaRefAtom.reportChanged();
    }, _$sistemaRefAtom, name: '${_$sistemaRefAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_EscolherProdutoControllerBase.errorMessage');

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

  final _$obterTagsAsyncAction = AsyncAction('obterTags');

  @override
  Future<void> obterTags() {
    return _$obterTagsAsyncAction.run(() => super.obterTags());
  }

  final _$obterPrimeirosProdutosParaTelaAsyncAction =
      AsyncAction('obterPrimeirosProdutosParaTela');

  @override
  Future<void> obterPrimeirosProdutosParaTela() {
    return _$obterPrimeirosProdutosParaTelaAsyncAction
        .run(() => super.obterPrimeirosProdutosParaTela());
  }

  final _$obterSistemaUsuarioLogadoAsyncAction =
      AsyncAction('obterSistemaUsuarioLogado');

  @override
  Future<void> obterSistemaUsuarioLogado() {
    return _$obterSistemaUsuarioLogadoAsyncAction
        .run(() => super.obterSistemaUsuarioLogado());
  }

  final _$_EscolherProdutoControllerBaseActionController =
      ActionController(name: '_EscolherProdutoControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo =
        _$_EscolherProdutoControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_EscolherProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'produtos: ${produtos.toString()},filter: ${filter.toString()},tagsModel: ${tagsModel.toString()},tags: ${tags.toString()},sistemaRef: ${sistemaRef.toString()},errorMessage: ${errorMessage.toString()},produtosState: ${produtosState.toString()},tagsState: ${tagsState.toString()},listFiltered: ${listFiltered.toString()}';
    return '{$string}';
  }
}
